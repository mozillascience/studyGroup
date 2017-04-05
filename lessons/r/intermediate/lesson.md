---
layout: page
title: "Intermediate topics in R: Strings and factors"
visible: true
tags: 
  # languages
  - r
  # levels
  - intermediate
---



# Strings, factors, and regular expressions

 - **Authors**: Luke Johnston (@lwjohnst86)
 - **Research field**: Nutritional Sciences
 - **Lesson topic**: Working with character/string data
 - **Lesson video link**: <https://youtu.be/jdMOmg9SMEc>
 
Install these packages:


```r
install.packages(c("stringr", "forcats"))
```

Base R has some pretty decent string manipulation and searching functionality.
The primary way of working with strings is through 
[regular expressions](http://www.regular-expressions.info/). Regular
expressions, or regex in R, are a group of characters that have special meaning
and function. For instance, the `.` means wildcard and it will search for any
character (letter, number, symbol, etc). Or `$` means end of the string or line.
If you want to see more details on regex in R, run `?regex` to get help on it.

In general, the most commonly used functions (at least that I use and that I've
seen) are `grep`, `grepl`, `sub`, and `gsub` commands. Each of these take regex
characters (`$ ^ * . + ? [] () |` are a few; see `?regex` for more). Let's
begin with the base R functions!


```r
fruits <- c("apple", "banana", "pear")

# replace `a` at beginning of string with nothing. `gsub` = global substitution
gsub("^a", "", fruits)
#> [1] "pple"   "banana" "pear"
# replace letters `an` or `ar` with `bb`
gsub("(an|ar)", "bb", fruits)
#> [1] "apple"  "bbbbba" "pebb"
# same as above but only first search and replace. `sub` = substitution
sub("(an|ar)", "bb", fruits)
#> [1] "apple"  "bbbana" "pebb"
# search for fruits starting with a. Returns the number position of the search
# result.
grep("^a", fruits)
#> [1] 1
# same as above, but returns the actual value rather than the number
grep("^a", fruits, value = TRUE)
#> [1] "apple"
# same as above, but returns a vector of logical values
grepl("^a", fruits)
#> [1]  TRUE FALSE FALSE
```

While base R is pretty powerful, it isn't always easy to work with and there are
some major bits of functionality missing. That's where the `stringr` package
(which is a subset of common functions from the `stringi` package) comes into
play. `stringr` greatly expands on string manipulation in R. Let's go through
some.


```r
library(stringr)

# month.name is a default variable in R. I'm putting it in a new variable to
# make it shorter to type out.
mth <- month.name
mth
#>  [1] "January"   "February"  "March"     "April"     "May"      
#>  [6] "June"      "July"      "August"    "September" "October"  
#> [11] "November"  "December"

# Almost every stringr function begins with `str_`.
# Convert cases (lower case, UPPER CASE)
str_to_lower(mth)
#>  [1] "january"   "february"  "march"     "april"     "may"      
#>  [6] "june"      "july"      "august"    "september" "october"  
#> [11] "november"  "december"
str_to_upper(mth)
#>  [1] "JANUARY"   "FEBRUARY"  "MARCH"     "APRIL"     "MAY"      
#>  [6] "JUNE"      "JULY"      "AUGUST"    "SEPTEMBER" "OCTOBER"  
#> [11] "NOVEMBER"  "DECEMBER"

# Find out the number of characters in each string of the vector
str_length(mth)
#>  [1] 7 8 5 5 3 4 4 6 9 7 8 8
mth
#>  [1] "January"   "February"  "March"     "April"     "May"      
#>  [6] "June"      "July"      "August"    "September" "October"  
#> [11] "November"  "December"

# Combine (concatenate) the strings together. Similar to `paste`
str_c(mth, collapse = ", ")
#> [1] "January, February, March, April, May, June, July, August, September, October, November, December"

# Take a subset of the months based on a regex.
# for months starting with `J`
str_subset(mth, "^J")
#> [1] "January" "June"    "July"
# for months ending in y
str_subset(mth, "y$")
#> [1] "January"  "February" "May"      "July"
# for months that contain either s, n, or d (only lower case)
str_subset(mth, "[snd]")
#> [1] "January" "June"    "August"
# same as above, but all letters since months have been converted to lower case
str_subset(str_to_lower(mth), "[snd]")
#> [1] "january"   "june"      "august"    "september" "november"  "december"

# Because stringr is part of the tidyverse packages, you can also use the pipe
# `%>%` command with the commands, to make it easier to read.
mth %>%
    str_to_lower() %>%
    str_subset("[snd]")
#> [1] "january"   "june"      "august"    "september" "november"  "december"

# Using the fruit variable in the stringr package... different from the `fruits`
# we created above!
# str_detect converts to logical, for use in filtering, subsetting, etc.
# searches for all fruit beginning with `be`
str_detect(fruit, "^be")
#>  [1] FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE
#> [12] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
#> [23] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
#> [34] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
#> [45] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
#> [56] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
#> [67] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
#> [78] FALSE FALSE FALSE

# Find out the proportion (mean of values that are either 0 or 1) of fruit with
# at least one vowel at the end of the string.
str_detect(fruit, "[aeiou]$") %>%
    mean()
#> [1] 0.35

# search for any fruit that does not end in an `a`
str_detect(fruit, "^.*[^a]$")
#>  [1]  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
#> [12]  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
#> [23]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE
#> [34]  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
#> [45]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
#> [56] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
#> [67]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE
#> [78]  TRUE  TRUE  TRUE
# this is the same as above, but subsets instead
str_subset(fruit, "[^a]$")
#>  [1] "apple"             "apricot"           "avocado"          
#>  [4] "bell pepper"       "bilberry"          "blackberry"       
#>  [7] "blackcurrant"      "blood orange"      "blueberry"        
#> [10] "boysenberry"       "breadfruit"        "canary melon"     
#> [13] "cantaloupe"        "cherry"            "chili pepper"     
#> [16] "clementine"        "cloudberry"        "coconut"          
#> [19] "cranberry"         "cucumber"          "currant"          
#> [22] "damson"            "date"              "dragonfruit"      
#> [25] "durian"            "eggplant"          "elderberry"       
#> [28] "fig"               "goji berry"        "gooseberry"       
#> [31] "grape"             "grapefruit"        "honeydew"         
#> [34] "huckleberry"       "jackfruit"         "jambul"           
#> [37] "jujube"            "kiwi fruit"        "kumquat"          
#> [40] "lemon"             "lime"              "loquat"           
#> [43] "lychee"            "mandarine"         "mango"            
#> [46] "mulberry"          "nectarine"         "nut"              
#> [49] "olive"             "orange"            "pamelo"           
#> [52] "passionfruit"      "peach"             "pear"             
#> [55] "persimmon"         "physalis"          "pineapple"        
#> [58] "plum"              "pomegranate"       "pomelo"           
#> [61] "purple mangosteen" "quince"            "raisin"           
#> [64] "rambutan"          "raspberry"         "redcurrant"       
#> [67] "rock melon"        "salal berry"       "star fruit"       
#> [70] "strawberry"        "tamarillo"         "tangerine"        
#> [73] "ugli fruit"        "watermelon"

# similar to sub
# search any month that starts with J and ends with e and replace the middle
# letters with `HIII`.
str_replace(mth, "^(J).*(e)$", "\\1HIII\\2")
#>  [1] "January"   "February"  "March"     "April"     "May"      
#>  [6] "JHIIIe"    "July"      "August"    "September" "October"  
#> [11] "November"  "December"

# vector of sentences
head(sentences)
#> [1] "The birch canoe slid on the smooth planks." 
#> [2] "Glue the sheet to the dark blue background."
#> [3] "It's easy to tell the depth of a well."     
#> [4] "These days a chicken leg is a rare dish."   
#> [5] "Rice is often served in round bowls."       
#> [6] "The juice of lemons makes fine punch."

# you can split strings up by a specific character. `str_split` creates a list,
# so I use `[[1]]` or `[1]` to show only the first one.
str_split(sentences, " ")[[1]] # this outputs a vector
#> [1] "The"     "birch"   "canoe"   "slid"    "on"      "the"     "smooth" 
#> [8] "planks."
str_split(sentences, " ")[1] # this outputs a list
#> [[1]]
#> [1] "The"     "birch"   "canoe"   "slid"    "on"      "the"     "smooth" 
#> [8] "planks."
# or split by the letter `e`
str_split(sentences, "e")[[1]]
#> [1] "Th"              " birch cano"     " slid on th"     " smooth planks."
# if you want to split by the word, use the `boundary` function.
str_split(sentences, boundary("word"))[[1]]
#> [1] "The"    "birch"  "canoe"  "slid"   "on"     "the"    "smooth" "planks"
# or by a sentence
str_split(sentences, boundary("sentence"))[[1]]
#> [1] "The birch canoe slid on the smooth planks."

# include in a pipe
str_split(sentences, boundary("sentence"))[[1]] %>%
    # convert to Title Case
    str_to_title()
#> [1] "The Birch Canoe Slid On The Smooth Planks."
```

String manipulation is great, but sometimes you need to convert to factor
variables for use in statistical models or when plotting (for instance when
using `ggplot2`). The `forcats` package makes it easier to work with factors.
Base R really only has one function for working with factors... the `factor`
command.


```r
library(forcats)

str(mth)
#>  chr [1:12] "January" "February" "March" "April" "May" ...
# This is base function. Compare this...
as.factor(mth)
#>  [1] January   February  March     April     May       June      July     
#>  [8] August    September October   November  December 
#> 12 Levels: April August December February January July June March ... September
# with this...
as_factor(mth)
#>  [1] January   February  March     April     May       June      July     
#>  [8] August    September October   November  December 
#> 12 Levels: January February March April May June July August ... December
# base R as.factor orders alphabetically, while forcats as_factor orders in
# appearance.

mth2 <- c(mth[10:12], mth[6:12], mth)
mth2
#>  [1] "October"   "November"  "December"  "June"      "July"     
#>  [6] "August"    "September" "October"   "November"  "December" 
#> [11] "January"   "February"  "March"     "April"     "May"      
#> [16] "June"      "July"      "August"    "September" "October"  
#> [21] "November"  "December"

# you can also order by frequency:
fct_infreq(mth2)
#>  [1] October   November  December  June      July      August    September
#>  [8] October   November  December  January   February  March     April    
#> [15] May       June      July      August    September October   November 
#> [22] December 
#> 12 Levels: December November October August July June September ... May
# this more explicitly orders by appearance.
fct_inorder(mth2)
#>  [1] October   November  December  June      July      August    September
#>  [8] October   November  December  January   February  March     April    
#> [15] May       June      July      August    September October   November 
#> [22] December 
#> 12 Levels: October November December June July August ... May

# this counts the number of levels within the factors. It is a simple summary
fct_count(mth2, sort = TRUE)
#> # A tibble: 12 × 2
#>            f     n
#>       <fctr> <int>
#> 1   December     3
#> 2   November     3
#> 3    October     3
#> 4     August     2
#> 5       July     2
#> 6       June     2
#> 7  September     2
#> 8      April     1
#> 9   February     1
#> 10   January     1
#> 11     March     1
#> 12       May     1

# if you want to convert levels that contains only a few (in this case, less the
# 10% of the total proportion), they will be converted to `Other`. This is a
# nice, quick function to group together uncommon values.
fct_lump(mth2, prop = 0.1)
#>  [1] October  November December Other    Other    Other    Other   
#>  [8] October  November December Other    Other    Other    Other   
#> [15] Other    Other    Other    Other    Other    October  November
#> [22] December
#> Levels: December November October Other
# or any level with only an n=1 in the category
fct_lump(mth2, n = 1)
#>  [1] October  November December Other    Other    Other    Other   
#>  [8] October  November December Other    Other    Other    Other   
#> [15] Other    Other    Other    Other    Other    October  November
#> [22] December
#> Levels: December November October Other
# or if you want them renamed to `None`
fct_lump(mth2, prop = 0.1, other_level = 'None')
#>  [1] October  November December None     None     None     None    
#>  [8] October  November December None     None     None     None    
#> [15] None     None     None     None     None     October  November
#> [22] December
#> Levels: December November October None

# this is also a really nice function to rename levels within a factor.
fct_recode(mth2,
           Jan = "January",
           Feb = "February",
           "Dec ember" = "December"
           )
#>  [1] October   November  Dec ember June      July      August    September
#>  [8] October   November  Dec ember Jan       Feb       March     April    
#> [15] May       June      July      August    September October   November 
#> [22] Dec ember
#> 12 Levels: April August Dec ember Feb Jan July June March May ... September
```


# Resources

Very good book on R and data (<https://r4ds.had.co.nz>). Also the
[tidyverse](https://tidyverse.org) resource is good.

Factors (`forcats`):

- <https://forcats.tidyverse.org/>
- <https://r4ds.had.co.nz/factors.html>

Strings (`stringr`):

- <https://stringr.tidyverse.org/>
- <https://r4ds.had.co.nz/strings.html>
- For more complex string work, check out the
[stringi package](https://cran.r-project.org/web/packages/stringi/index.html)

