#!/usr/bin/Rscript --vanilla
#
# Convert a Rmd file to a md file for Jekyll
#
# Usage:
#   -arg1 The Rmd file to convert to md for Jekyll use.
#
# Example:
#   cd lesson/lesson_name/
#   Rscript ../../knitpost.R lesson.Rmd
#
# Change `visible: false` to `visible: true` in the generated lesson.md file.
#

KnitPost <- function(input) {
    outfile <- rename_to_post(input)
    knitr::opts_knit$set(base.url = '../')
    knitr::opts_chunk$set(fig.cap = "center")
    knitr::render_markdown()
    knitr::knit(input, outfile, envir = parent.frame())
}

rename_to_post <- function(draft)
    paste0(sub(".Rmd$", ".md", draft))

args <- commandArgs(trailingOnly = TRUE)
if (length(args) > 1)
    stop('Please pass only one argument: the file.')

KnitPost(args[1])
