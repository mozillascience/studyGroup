---
layout: page
title: High Performance Loops in R
visible: true
tags:
  - r
  - beginner
---

 - **Authors**: Lina Tran adapted from Roz Dakin
 - **Research field**: Neuroscience
 - **Lesson topic**: For Loops 
 - **Lesson content URL**: <https://github.com/UofTCoders/studyGroup/tree/gh-pages/lessons/r/loops>

To For Loop or not to For Loop? Learn different ways to make use of for loops as well as when it might be more efficient to use other methods in favour of looping. We will also learn how to use the Microbenchmark package to time how long it takes to execute code when deciding to use one method over another to maximize efficiency.

## Topics Covered:

- When loops are useful
- When other alternatives might work better
- The Apply family
- How to time your code
- Speeding up your loops

##What You Will Need:

- [R](https://cran.rstudio.com/)
- [RStudio](https://www.rstudio.com/products/rstudio/#Desktop)

Once you have these set up, make sure to install the following packages (gapminder, dplyr, & microbenchmark) either through Tools > Install Packages in RStudio, or in the console:

```
install.packages('gapminder')
install.packages('dplyr')
install.packages('microbenchmark')
```

[**Here is the lesson material with the R output**](../HighPerformanceLoops.html)
