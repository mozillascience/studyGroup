---
layout: page
title: 'Interactive Plotting with Shiny Apps'
visible: true
tags:
  - r
  - advanced
---

 - **Authors**: Erica Acton
 - **Lesson topic**: Interactive Plotting with Shiny Apps
 - **Lesson content URL**: <https://github.com/UofTCoders/studyGroup/tree/gh-pages/lessons/r/shiny_2019>
 - **Lesson video stream**: <https://www.youtube.com/watch?v=Pp3zMKq_G-0>

# Introduction

[Shiny](https://shiny.rstudio.com/) is an R package to make interactive web
applications for exploring your data.

For this lesson, please install `shiny`, `tidyverse`, `gapminder`,
`shinydashboard`:

```r
install.packages(c("shiny", "tidyverse", "gapminder", "shinydashboard"))
```

You should be able to open the provided `app.R` in RStudio and tell it to start
the application using the "Run App" button. See the video stream for a
graphical explanation of this procedure.

You may also run the application from the command-line:

```
# Use the path to the directory containing app.R (do not include app.R below):
$ R -e "shiny::runApp('/path/to/app.R')"
```

# Overview

Our Shiny app will have a layout that will look approximately like this:

![Dashboard layout](../dashboard.png)

There will be three different "views" with different plots and options to
change how they look:

![Tab 1 layout](../tab1.png)

![Tab 2 layout](../tab2.png)

![Tab 3 layout](../tab3.png)
