---
layout: page
title: Making packages in R using devtools
visible: true
tags:
  - r
  - intermediate
---

 - **Authors**: Luke Johnston
 - **Research field**: PhD in Nutritional Sciences
 - **Lesson topic**: R package development
 - **Lesson content URL**: <https://github.com/UofTCoders/studyGroup/tree/gh-pages/lessons/r/packages>
 
-----

Making your own package in R of functions that you commonly use can help you
save an incredible amount of time in your data analysis. This lesson will
briefly go over the basics of package development in R. For more information on
this, I highly highly recommend the book (online and free!) 
[**R Packages**](http://r-pkgs.had.co.nz/) written by Hadley Wickham (a prolific R
package developer and creator of `devtools`). This book is written in a way that
most novice R users (i.e. those slightly familiar with R) would be able to
understand what is being explained. Check it out!

So, briefly, developing R packages is done by running:

```r
devtools::create('pkg_name')
```

... Or by using the menu options `File -> New Project -> New Directory -> R Package` in RStudio.

This creates a new directory called `pkg_name` (or whatever other name) along with:

- An `R/` subfolder: contains all of the R code that the new R package will have.
- A `DESCRIPTION` file: Contains the information about the package (like version
number, title, author, etc)
- A `NAMESPACE` file: Contains the R functions or code that R will look for when
the package is 'officially' installed.
- An `.Rproj` file: Tells RStudio what the folder structure is used for (package
development) and sets RStudio options.

## Making functions

Make new R functions in the `R/` folder. A simple one can be created:

```r
sum_nums <- function(arg1, arg2) {
    arg1 + arg2
}
```

You can now access this function in the R console when developing the package by
running `devtools::load_all()` or `Ctrl-Shift-L` in RStudio. Now, when you start
typing `sum_` you'll see the autocompletion list the `sum_nums`. All new
functions can be created this way.

Sometimes you need to use functions from other packages, such as `dplyr` or
`ggplot2`. R packages access these differently then when running interactively.
You can't include a `library()` statement in your R functions. So first you do:

```r
devtools::use_package('dplyr')
```

This will output a message to the R console, telling you how to use the `dplyr`
package functions. It also adds `dplyr` to the Import section of the DESCRIPTION
file. You also need to prefix `dplyr::` to each `dplyr` function. So, if we
create a new function:

```r
filter_down <- function(cutoff = 30) {
    dplyr::filter(swiss, Agriculture < cutoff)
}
```

Hit `Ctrl-Shift-L` to run `devtools::load_all()` to access the new function. Now
type in the console `filter_down(40)` and it will list off a filtered version of
the `swiss` dataset.

## Documenting your functions

It's often a good idea to document your functions. Put your cursor inside the
function and hit `Ctrl-Shift-Alt-R`. Something like this should be added to the
function:

```r
#' Title
#'
#' @param cutoff 
#'
#' @return
#' @export
#'
#' @examples
filter_down <- function(cutoff = 30) {
    dplyr::filter(swiss, Agriculture < cutoff)
}
```

These tags are called `roxygen` document tags. 

- `@param`: Parameter/argument name and description.
- `@return`: What is output from the function. In this case, a data frame.
- `@export`: Whether to send this function to the NAMESPACE. This dictates
whether the function will be external (accessible to the end user) or internal
(only accessible to the functions within the R package, but not the user).
- `@examples`: Usually good to give an example of how your function is used.

These tags are used whenever you type `?filter_down`, as they are used for the
help documentation. To generate the documentation files, hit `Ctrl-Shift-D` to
run `devtools::document()`.

## Documenting your package

Depending on how complicated your package is (and even if it isn't), it helps to
write up a more descriptive documentation on how to use your package. These
documentations are called vignettes. Even if no one but you will use the
package, I would still recommend writing up at least an introduction since
you'll be guaranteed to forget what your package does later in the future (it's
happened to me many many times). So, to start writing up a vignette, type in the
console:

```r
devtools::use_vignette('introduction')
```

This will create a `vignette/` folder and an 
[R Markdown](http://rmarkdown.rstudio.com/) file, where you can mix text, code, and
code output for a polished tutorial on using your package. You can access this
vignette when the package is installed by using:

```r
vignette('introduction', package = 'your_package_name')
```

## Installing your package and other bits

You can install your package by running:

```r
devtools::install()
```

This installs the package and lets you access the functions by using `library()`
command.

There are several other bits of information for building an R package which may
not get covered. These include unit testing and integration with Git/GitHub.
Unit testing (via the `testthat` package and `devtools::use_testthat()`) allows
you to include tests to confirm that your functions work as intended (run 
`Ctrl-Shift-T` to run `devtools::test()` and run the unit tests). R packages and
RStudio integrate very well with Git and GitHub, so you can make use of them!
