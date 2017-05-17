# R Markdown workshop
JEPA (CCO)  
October 12, 2015  

# Why should I use R-Markdown?

## Document your code

Use R Markdown to make your code pretty and share it with others. R code in the .Rmd function exactly the same as in a regular .R script.  A reader can see your code, and what it does, and in fancy cases, interact with the data directly in the document.

- Explain your code or make it available to others
- Show all code with outputs
- Create human-readable coding

## Document your workflow

Use R Markdown to highlight the workflow of your code, to share your process. The code itself is not so important; instead, you can focus on the steps you used to get from input A to output B.

- Promote reproducibility of results and provenance of data
- Focus on the process: inputs, outputs, and the steps in between
- Downplay specific code except where critical

## Document your results

Use R Markdown to document your results such as for publication. Focus on your research question and present the results in nicely-formatted text, equations, tables, and graphs.

- Hide the work: if they want to see the process, they can dig into the document.
- Focus on the big picture: formatted write up and fancy graphs
- Present results in a format that doesn't even look like code - looks more like a publication.

# R Markdown Structure

1.- File Header
2.- Markdown style basics:
3.- Code Chunks
4.- knit it!

## 1. File header

The top of the .Rmd file should have a header; when you create a new .Rmd this is added automatically. At very least, include the dashes, a title, and output format.  

**Note:** the left alignment and tab spacing are important.

```
---
title: "R Markdown workshop"
output: html_document
---
```
more options can go in the header; more on these later:

```
---
title: "R Markdown workshop"
author: "JEPA (CCO)"
date: "October 12, 2015"
output:
  html_document:
    highlight: haddock
    theme: spacelab
    toc: yes
  pdf_document:
    highlight: haddock
    toc: yes
---
```

## 2.- Markdown style basics:

* bulleted lists
    * including multi-level bullets and numbered lists  
* *italics*, **bold**, and even ***bold italics***
* headers - six levels, from # (HUGE) to ###### (small)
* `inline monospaced text` and inline executable R code
* code blocks, non-executing (just for display) and executing (R code chunks)
* text as ^superscripts^ and as ~subscripts~
* You can make links like [DSDS](https://jepa.github.io/studyGroup/)


**NOTE:** Since Markdown basically converts your formatting to HTML, you can also just include straight HTML tags to do the same thing:

### Note on spaces and line breaks

Markdown is finicky, but R Markdown is especially finicky about line breaks and spaces.  A single line break is treated about the same as a space.  Between sections with different formatting, it's good to always put a blank line (two line breaks).  If your knitted formatting looks wrong, you probably forgot to space it properly.

## 3.Code Chunk

Code chunks allow for pieces of executable R code within your document - basically, mini scripts or pieces of a larger script, with regular Markdown text in between. Each code chunk can access values, functions, and packages defined earlier in the .Rmd, but beyond that, each chunk needs to be self-contained (e.g. if you define a function or a loop, the entire code for that must be within a single code chunk).

Each code chunk starts with three back-ticks (\```) at the start of a line, followed by 'r' in braces. Next comes the code; then the code block ends with a triple back tick on its own line. 

* e.g. `` ``` {r chunk name, echo = FALSE, eval = TRUE, message = FALSE, warning = FALSE}``

#### Header structure explanation

The `{r}` is the code chunk header, and can be modified in helpful ways.

* The text after the `r` but before a comma becomes the name of the code chunk. The name appears in the list of sections in the RStudio script editing pane, so you can navigate right to the code chunk of your choice.
    * e.g. `` ``` {r chunk name goes here} ``
* Code chunk options can be added to the header, to control how the code chunk is executed and knitted.  Code chunk options are separated by commas.
    
#### Helpful code chunk options:
    * `echo`: when FALSE, the code in this chunk will not be displayed in the knitted document. 
    * `eval`: when FALSE, this code chunk will not run.  You can use `eval = FALSE, echo = TRUE` to display but not run the code.
    * `message` or `warning`: setting these to false will prevent the display of outputs from `message()` or `warning()` - such as those that often show up (in red) when loading packages with `library()`.
* You can skip the name and go straight to the options, if you like, just use a comma after the `r`:
    * e.g. `` ``` {r, echo = FALSE} ``

So this is how the document can look like:

The International *Pacific Halibut* Commission [(IPHC)](http://www.iphc.int/news-releases/491-nr2017-01.html) completed its Ninety-third Annual Meeting in Victoria, BC, Canada on **27 January, 2017**. More than 200 halibut industry stakeholders attended the meeting, with approximately 80 more participating in web broadcasts of the public sessions.

The Commission is recommending to the governments of Canada and the United States catch limits for 2017 totaling 28.8* million pounds, displayed in the following table by regulatory area:


Table: Quota Allocation for 2016 According to IPHC

   Alaska    Canada       USA   Total TAC
---------  --------  --------  ----------
 18842800   7300000   1140000    28890000

Outside of code blocks, you can include R code directly in the formatted text. This is helpful if you want to display a value or output in a nicely formatted way. This can access values calculated locally or in other code chunks earlier in the document. To do this, start with a single back-tick followed by 'r', and end with another single back-tick. For example:

The TAC for the 2017 Pacific Halibut season was 2.889\times 10^{7}. From the total quota, 7.3 million tons where allocated to Canada and 19.9828 million tons for the US (Alaska = 18.8428, Mainland = 1.14).

#### Chunk Visualization in line V.s Console

A fresh new (2017!) version of R Markdown is that the chunk outputs can be seen inline the chunk (Notebook!). This is specially useful for those like me that have a 13' monitor!  Lets have a look:


Table: Quota Allocation for 2016 According to IPHC

   Alaska    Canada       USA   Total TAC
---------  --------  --------  ----------
 18842800   7300000   1140000    28890000

To change this option you can go to the little screw nest to "knit" button and select "Chunk Output in Console"/"Chunk Output in inline" that way the output will be normally displayed in the console. 


## 4.- knit it!

Once your .Rmd is done, you can try to knit it.  At the top of the script editing panel in RStudio, you'll see an option to "Knit" (or maybe "Knit PDF" or other formats).  That kicks in the `knitr` library to interpret your .Rmd code, and save it as a new file in the same directory as your .Rmd, with the same base name, and a new extension.

If your code has errors, you'll see the error reported in the R Markdown pane in RStudio.  Otherwise, you can track the progress of the knitting, and see the resulting document.

## Common issues in R Markdown

#### `setwd()`: don't do it!

The `knitr` package isn't friendly about setting working directories.  It expects that the working directory is the directory in which the .Rmd file lives; if you change that through `setwd()` in one chunk of code, it resets it for the next chunk of code.

It's generally a good practice to avoid using `setwd()` in your code anyway - use variables and `file.path()` to store and set file locations.

#### Spaces/line breaks

As noted above: Knitting an .Rmd properly is very sensitive to line breaks.  Whenever you want to change the format from one line to the next, include an extra line break in between.  Note that knitting ignores multiple line breaks, so one blank line and ten blank lines will render the same in the final output document.
