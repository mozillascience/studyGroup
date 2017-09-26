# Intro to Data Manipulation and "piping"
JEPA
09/28/2017

# Why use dplyr and tidyr?

- Speed - dplyr and tidyr are really fast
- Readability - the code syntax is straightforward and easy to read
- Chaining - never break the chain. More on this later
- Integrates with ggplot2 - plot your data in the same workflow that you manipulate it with
- Can be used to analyze external databases without knowledge of additional database query languages

# Objectives
The session will cover a variety of useful functions to manipulate data, mainly from `dplyr` and `tidyr`.

# Instructions

1. **Session Matterials:** Get the workshop materials: Go to the repository and click on the "fork" button to create an independent copy within your own GitHub account. Alternately, click on the "clone or download" button. 

2. **csv files:** All csv files are located in the *Data* folder ( *Alaska.csv*)

4. **Necessary Packages:**


```r
## Install all packages (Combo!)

## This is the Combo:

## Loading tidyverse: ggplot2
## Loading tidyverse: tibble
## Loading tidyverse: tidyr
## Loading tidyverse: readr
## Loading tidyverse: purrr
## Loading tidyverse: dplyr

#install.packages('tidyverse')
library(tidyverse)

# If you only want the minimum...

#install.packages('dplyr')
library(dplyr) 

#install.packages('tidyr')
library(tidyr) 

#install.packages('ggplot2')
library(ggplot2) 

```
# References and help!

- [Tutorial on dplyr and tidyr packages for Eco-Data-Sci group](https://github.com/eco-data-science/dplyr-tidyr-tutorial)
- [A more complete Guide to dplyr](https://cran.rstudio.com/web/packages/dplyr/vignettes/introduction.html)
- [dplyr CRAN](https://cran.r-project.org/web/packages/dplyr/dplyr.pdf)
- [The whole deal](http://dplyr.tidyverse.org/articles/dplyr.html)
- [Download this AWESOME CHEAT SHEET](https://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf)