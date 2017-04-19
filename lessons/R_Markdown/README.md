
# Libraries needed

library(data.table)
library(knirt)

# rmarkdown_R
This tutorial was adapted from the tutorial created by [Casey O'Hara](https://github.com/oharac) from the [eco-data-science Tutorial](https://github.com/eco-data-science/rmarkdown_R)

# What is R Markdown?

From rmarkdown.rstudio.com:  

R Markdown is an authoring format that enables easy creation of dynamic documents, presentations, and reports from R. It combines the core syntax of markdown (an easy-to-write plain text format) with embedded R code chunks that are run so their output can be included in the final document. R Markdown documents are fully reproducible (they can be automatically regenerated whenever underlying R code or data changes).

# Objectives

This tutorial/workshop will focus on introducing to you the basic structure of R Markdown and creating R Markdown documents.

# Quick start!

In RStudio, create a blank .Rmd:  go to File -> New File -> R Markdown... 

What are the differences between this and a standard new R script?

* the file extension
* the header
* white spaces (Markdown sections, where text will be formatted using Markdown language) and grey spaces (R code chunks, where functional R code lives)

With your new file, hit the 'Knit HTML' button at the top of the script pane in RStudio.  You will need to save the file before it will knit.

Check out what it looks like!  pretty nice, pretty easy.



# Cool references

[Here's a great R Markdown reference sheet](https://www.rstudio.com/wp-content/uploads/2015/03/rmarkdown-reference.pdf) and a similar but more colorful [R Markdown cheat sheet](https://www.rstudio.com/wp-content/uploads/2015/02/rmarkdown-cheatsheet.pdf), including basic Markdown formatting.  No need to recreate all the different formatting options here; but you should get to know and love the following, which are all easy:

[Print out this awesome reference sheet](https://www.rstudio.com/wp-content/uploads/2015/03/rmarkdown-reference.pdf) or [this awesome cheat sheet](https://www.rstudio.com/wp-content/uploads/2015/02/rmarkdown-cheatsheet.pdf) and nail it to your monitor.

More code chunk options can be found on the [R Markdown reference sheet](https://www.rstudio.com/wp-content/uploads/2015/03/rmarkdown-reference.pdf) or [R Markdown cheat sheet](https://www.rstudio.com/wp-content/uploads/2015/02/rmarkdown-cheatsheet.pdf), or at http://rmarkdown.rstudio.com/authoring_rcodechunks.html.  Some of these are also shown later in this document.