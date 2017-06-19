---
layout: page
title: R Package Tutorial I Intro to making a basic package
visible: true
tags:
  # languages
  - r
  # levels
  - beginner
---

**Author:** Matthew Wolak

# Introduction

The basic idea behind R packages is to make units of code that extend the functionality in the base R program in a way that is both (*i*) reproducible across computers with different hardware and software configurations and (*ii*) fully explained with helpful documentation (including example code and maybe also example data). 

<!-- Something about philosophy of packages/style/any variation in opinions over this? -->


## Why
  - Maintain personal functions and data that are frequently used in a time-saving format that is easily managed and shared
  - R packaging system has tools to check that (necessary) documentation exists (and is up to date), spot common errors, and check that code is working

## Definitions

From Leisch, F. 2009. Creating R Packages: A Tutorial. *In* Compstat 2008-Proceedings in Computational Statistics. Brito, P. ed. Physica Verlag, Heidelberg, Germany, 2008.

  - **Package:** An extension of the R base system with code, data, and documentation in standardized format
  - **Library:** A directory containing installed packages
  - **Repository:** A website providing packages for installation
  - **Source:** The original version of a package with human-readable text and code
  - **Binary:** A compiled version of a package with computer-readable text and code, may work only on a specific platform


## Types of packages

  - Hosted on **C**omprehensive **R** **A**rchive **N**etwork (CRAN)
    - Required to meet the standards of CRAN policy for [Writing R Extensions](https://cran.r-project.org/doc/manuals/r-release/R-exts.html) (extensively detailed at this link)
  - Other repos (less restrictive requirements/checking)
    - GitHub, Bitbucket, etc.
  - The use, distribution, and re-use of code and packages is usually controlled by a license
    - Most commonly, good [author's editorial] R packages come with one of the [Open Source Licenses](https://opensource.org/licenses)
  - R packages with just data are also possible and useful for comparing/testing/benchmarking!
    - the `datasets` [package in base R](https://stat.ethz.ch/R-manual/R-patched/library/datasets/html/00Index.html)



--------------------------------------------------------------------------------


# Approaches

There are numerous ways to develop, maintain, and share R packages. In the end, use whatever approaches and tools you find to be the most helpful for *you*. Here are four common tools in an increasing order of the amount each tool controls the entire process


## `package.skeleton()`
  - This is an R function in the `utils` base package. There are a number of related functions, but this one will take objects in R and create the basic structure for an R package
  - Additional functions that are useful are:
    - `prompt()` to facilitate the generation of documentation files
    - `promptData()` specifically facilitates generation of documentation for data sets

## `roxygen2`
  - Generates and formats the documentation files for you, using special arguments inserted in your code
  - Fundamentally changes the way code is written and documented.

## `devtools`
  - This incredibly useful package helps to automate a lot of the process for building, checking, and releasing to CRAN. Some useful functions are:
    - `build()` turns a directory containing an R package structure into a single package source
        - also see `build_win()`
    - `check()` builds and checks a source package, particularly to assure compliance with CRAN policies
    - `release()` runs a few tests and submits the package directly to CRAN for consideration to be added to the repository
    - `install_github()`, `install_git()`, `install_bitbucket()`, `install_bioc()`, etc. will download and install packages from GitHub, a git repository, Bitbucket, or Bioconductor repositories, respectively.


## RStudio

RStudio has created a complete environment with tools to help you build R packages. If you want one-stop shopping then see their help/overview on developing R packages using RStudio's *fancy buttons* [here](https://support.rstudio.com/hc/en-us/articles/200486488-Developing-Packages-with-RStudio)



--------------------------------------------------------------------------------


# Overview of the tutorial

The approach used in the following tutorial will target the middle of the above four options. Namely, we will use a combination of `devtools` and `roxygen2` to build a very simple package.

## Part II. Dipping your toe into the water
To begin, we will create the basic directories and files needed for the outline of a package. We will then transform some simple code into a function and put this in the package directory.

The next step is to document the code, which will first be done using the basic `.Rd` structured files so that you get a sense of what different parts are required for the files that eventually are turned into R help manual pages. This will give you the basics to better understand what is going on in `roxygen2`, as discussed in the Part III tutorial.

Following this, we will run some basic checks on the package and then discuss how to host your package and interact with it as a GitHub repository. By the time this part is finished you should have a very basic R package that can be installed and loaded for your and others' own use and convenience - Woohoo!

## Part III. Efficient documentation and code
We will go over how to document your code using `roxygen2` instead of manually editing the `.Rd` files. This will hopefully improve the efficiency of writing code that works and is **well documented**.

Next we will go through some of the basic checks to ensure your package is now CRAN worthy and how to use `devtools` to submit a package for hosting on CRAN. At the end of this, you could have a package hosted on CRAN and graduate to being an *R wizard*!

Finally we will focus on improving the package by briefly covering a few strategies for profiling code in an attempt to identify areas that could benefit from some attention.

<!-- ## Part IV. C++/C I will cover the basic process of incorporating some C++ code into the package, if you are so brave. -->


## Resources
The above approach is my own take on how to make R packages, but it is not the only way (and probably not the best way). I have tremendously benefitted from other people sharing their ideas and have found the following sources extremely helpful.

  - Hilary Parker's [bare-bones R package creation](https://hilaryparker.com/2014/04/29/writing-an-r-package-from-scratch/)
    - A great little tutorial for creating a simple, basic R package.
  - Hadley Wickham's (free online) [R package book](http://r-pkgs.had.co.nz/)
    - This is a fantastic resource for R package development that provides an excellent overview and summary to the more extensive CRAN policies in [Writing R Extensions](https://cran.r-project.org/doc/manuals/r-release/R-exts.html)
    - Save the link, as you will constantly be using it as a reference!
  - Carl Broman's quick [primer](http://kbroman.org/pkg_primer/)
  - [roxygen2](https://cran.r-project.org/web/packages/roxygen2/vignettes/rd.html) vignette for help using this package
  - Guide to creating packages in [RStudio](https://support.rstudio.com/hc/en-us/articles/200486488-Developing-Packages-with-RStudio)


--------------------------------------------------------------------------------


# Preparation

## Tools

A good overview of the software requirements for creating R packages (with installation instructions) on Windows, Mac, and Linux are provided [here by the RStudio folks](https://support.rstudio.com/hc/en-us/articles/200486498-Package-Development-Prerequisites) to get you setup before starting Part II. Basically, your computer needs something to compile `C` code and handle the construction of R help manuals from LaTeX code.

You will require a compiler for the `C` language. Whereas most Linux operating systems should include one automatically, Mac and Windows will not. If you have RStudio installed, you should be covered already. Here is what you should have before starting and note the way to check this at the end of the next section ("Handy packages").

  - Windows:
    - install [Rtools](https://cran.r-project.org/bin/windows/Rtools/) (**not an R package**)
    - MikTeX distribution of LaTeX, which can be downloaded [here](https://miktex.org/download)

  - Mac:
    - install either `XCode` (free from the App Store with an Apple ID) or the [Command Line Tools for Xcode](https://idmsa.apple.com/IDMSWebAuth/login?appIdKey=891bd3417a7776362562d2197f89480a8547b108fd934911bcbea0110d07f757&path=%2Fdownload%2Fmore%2F&rv=1)
    - MacTex distribution of LaTex, which can be downloaded [here](http://www.tug.org/mactex/downloading.html)

  - Linux:
    - In addition to installing `R`, the development package will also need to be installed. For example, in Debian install the `r-base-dev` package. (e.g., `sudo apt-get install r-base-dev`)
        - It might be necessary, in some cases, to also install the `r-base-core` package (e.g., `sudo apt-get install r-base-core`)
    - LaTeX can be installed with the `texlive-full` package (e.g., `sudo apt-get install texlive-full`)


## Handy packages

Below are the two basic R packages necessary for this tutorial. Please have these installed before proceeding with [Part II](./makingRpackages2_ToeDip.html).

<!-- ```{R necessaryRpackages, eval = FALSE} -->
```
install.packages(c("devtools", "roxygen2"))
library(devtools)
library(roxygen2)
```

`devtools` to the rescue! To check and make sure you have everything needed, run:

<!-- ```{R devtools_checkCcompiler, eval = FALSE} -->
```
library(devtools)
has_devel()
```

and make sure it returns `TRUE` after some gobbledegook!


