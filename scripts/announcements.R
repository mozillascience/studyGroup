# Setup and Usage ---------------------------------------------------------
#
# Will need to get a GitHub PAT to use some of these commands.
# See [here](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/). Once you have the GitHub PAT, you will need to save this PAT in your
# home directory ("~/") in a file called ".Renviron". Inside the file, type out:
#
#   GITHUB_PAT= # paste the PAT number after the equal sign
#
# NOTE: Keep this PAT **ONLY ON YOUR COMPUTER**. Don't save it to GitHub.
#
# This script can be used in a few ways. Either:
# 1.    Open the main.Rproj, open the scripts/announcements.R, and "Source" the file
#       using the button or the shortcut Ctrl-Shift-S.
# 2.    Open R console and run the command "source('announcements.R')" when in the
#       script folder.
# 3.    Open the main.Rproj, run "source('scripts/announcements.R')" in the console.

# Installation and Loading Packages ---------------------------------------
# Running these lines will install the necessary packages.

if (!require(devtools)) install.packages("devtools")
devtools::install_dev_deps()
library(tidyverse)
library(lubridate)
library(glue)
library(assertr)

# Importing and Filtering the Event Data ----------------------------------

session_details <- read_csv(here::here("_data", "events.csv"), comment = "#") %>%
    arrange(date) %>%
    # drop sessions that are not set (NA in date)
    filter(!is.na(date)) %>%
    mutate_at(vars(start_time, end_time), funs(strftime(., format = "%H:%M", tz = "GMT")))

# Find any existing posts, take the date, and filter out those sessions from the
# session_details dataframe.
keep_only_new_sessions <- function() {
    existing_post_dates <- fs::dir_ls(here::here("_posts"), regexp = ".md$|.markdown$") %>%
        str_extract("[0-9]{4}-[0-9]{2}-[0-9]{2}")

    session_details %>%
        filter(!as.character(date) %in% existing_post_dates)
}

new_sessions <- keep_only_new_sessions()

# Create a GitHub Issue of the session ------------------------------------

post_gh_issue <- function(title, body, labels) {
    # Will need to set up a GitHub PAT via (I think) the function
    # devtools::github_pat() in the console.
    devtools:::rule("Posting GitHub Issues")
    cat("Posting `", title, "`\n\n")
    if (!devtools:::yesno("Are you sure you want to post this event as an Issue?")) {
        gh::gh(
            "POST /repos/:owner/:repo/issues",
            owner = "uoftcoders",
            repo = "Events",
            title = title,
            body = body,
            labels = array(c(labels))
        )
        usethis:::done("Event posted as an Issue to UofTCoders/Events.")
        return(invisible())
    } else {
        message("Event not posted to Issue.")
    }
}

# Format as eg August 23
day_month <- function(.date, add_name = TRUE) {
    date_format <- "%B %e" # as August 23
    if (add_name) date_format <- "%A, %B %e" # as Monday, August 23
    trimws(format(as.Date(.date), format = date_format))
}

gh_issue_info <- function(.data) {
    content <- .data %>%
        mutate(needs_packages = ifelse(
            !is.na(packages),
            str_c(
                "Please also install these packages: ",
                str_replace_all(packages, " ", ", "), "."
            ),
            ""
        )) %>%
        glue_data(
            "
            {description}

            - **Where**: MADLab at [Gerstein Science Information Centre](https://goo.gl/maps/2916Y54jQkx)
            - **When**: {day_month(date)}, from {start_time}-{end_time} pm
            - **Instructor**: TBA
            - **Skill level**: {skill_level}

            *Installation instructions*: You will need to install the appropriate programs. See the {program_language} section of the [installation instructions page](?link?). {needs_packages}

            **Directions:**  MADLab is located in [Gerstein Science Information Centre](https://goo.gl/maps/2916Y54jQkx), Room B112 at the south end of the first lower level. Once you go through the main entrance of Gerstein, take a right turn down a corridor (across from the admin desk or just past the reading room), then take the stairs down and follow the signs to MADLab, the door should be open 10-15 minutes before the lesson.
            "
        )

    .data %>%
        mutate(content = content, title = str_c(title, " - ", day_month(date, add_name = FALSE))) %>%
        select(title, content, skill_level, gh_labels)
}

create_gh_issues <- function(.data) {
    .data %>%
        gh_issue_info() %>%
        pmap( ~ post_gh_issue(..1, ..2, c(..3, ..4)))
}

create_gh_issues(new_sessions)

# Create files in _posts/ -------------------------------------------------
# Adds the new sessions/events to the _posts folder.

create_new_posts_with_content <- function(.data) {
    new_post_filenames <-
        glue_data(new_sessions, "{here::here('_posts')}/{date}-{key}.md")

    # Get the GitHub Issue URL for the event.
    gh_issue_number <- gh::gh("GET /repos/:owner/:repo/issues",
                              owner = "uoftcoders",
                              repo = "Events") %>%
        map_dfr(~ data_frame(title = .$title, url = .$html_url)) %>%
        mutate(title = str_remove(title, " - .* [1-9]?$"))

    new_post_content <- .data %>%
        left_join(gh_issue_number, by = "title") %>%
        glue_data(
            '
            ---
            title: "{title}"
            text: "{description}"
            location: "MADLab at Gerstein"
            link: "{url}"
            date: "{as.Date(date)}"
            startTime: "{start_time}"
            endTime: "{end_time}"
            ---
            '
        )

    # Save post content to file
    fs::dir_create(here::here("_posts"))
    map2(new_post_content, new_post_filenames, ~ write_lines(x = .x, path = .y))
    usethis:::done("Markdown posts created in _posts/ folder.")
    return(invisible())
}

create_new_posts_with_content(new_sessions)

# Create emails for sessions ----------------------------------------------

create_new_emails_for_session <- function(.data) {
    email_content <- new_sessions %>%
        mutate(needs_packages = ifelse(
            !is.na(packages),
            str_c(
                "Please also install these packages: ",
                str_replace_all(packages, " ", ", "), "."
            ),
            ""
        )) %>%
        glue_data(
            "
            <add this to the email subject> {title} - {day_month(date)}

            {description}

            **When**: {day_month(date)}, from {start_time}-{end_time}
            **Where**: MADLab at [Gerstein Science Information Centre](https://goo.gl/maps/2916Y54jQkx)
            **Skill level**: {skill_level}
            **What to bring:**

            *Installation instructions*: You will need to install the appropriate programs. See the {program_language} section of the [installation instructions page](link?). {needs_packages}
            "
        )

    fs::dir_create(here::here("_emails"))
    email_file <- glue_data(.data, "{here::here('_emails')}/{date}-{key}.md")
    usethis:::done("Files with email contents created.")
    usethis:::todo("Open them and copy over into an email.")

    map2(email_content, email_file, ~ write_lines(x = .x, path = .y))
    return(invisible())
}

create_new_emails_for_session(new_sessions)
