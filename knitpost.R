#!/usr/bin/Rscript --vanilla
#
# Convert a Rmd file to a md file for Jekyll
#
# Usage:
#   -arg1 The Rmd file to convert to md for Jekyll use.
#
# Example:
#   Rscript knitpost.R filename.Rmd
#

KnitPost <- function(input) {
    # this function is a modified version of an example here:
    # http://jfisher-usgs.github.com/r/2012/07/03/knitr-jekyll/
    outfile <- rename_to_post(input)
    knitr::opts_knit$set(base.url = '{{ site.github.url }}/')
    fig_path <- paste0("img/", sub(".Rmd$", "", input), "/")
    knitr::opts_chunk$set(fig.path = fig_path)
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
