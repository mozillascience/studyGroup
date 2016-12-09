---
layout: page
title: 'Plotting in R: ggplot2'
visible: true
tags:
  - r
  - intermediate
---

# Introduction to ggplot2

 - **Author**: Sarah Meister
 - **Lesson topic**: Plotting in R using ggplot2
 - **Lesson content URL**: <https://github.com/UofTCoders/studyGroup/tree/gh-pages/lessons/ggplot2>

### What is ggplot2? ###

ggplot2 is meant to be an implementation of the Grammar of Graphics, hence gg-plot. The basic notion is that there is a grammar to the composition of graphical components in statistical graphics, and by direcly controlling that grammar, you can generate a large set of carefully constructed graphics tailored to your particular needs. Each component is added to the plot as a layer. 

### Components of a ggplot2 plot ###

Plots convey information through various aspects of their aesthetics. Some aesthetics that plots use are:

* x position
* y position
* size of elements
* shape of elements
* color of elements

The elements in a plot are geometric shapes, like

* points
* lines
* line segments
* bars
* text

Some of these geometries have their own particular aesthetics. For instance:

**points**

  * point shape
  * point size
  
**lines**

  * line type
  * line weight
  
**bars**

  * y minimum
  * y maximum
  * fill color
  * outline color
  
**text**

  * label value

## R code ##


```r
library(ggplot2)

summary(mpg)
```

```
##  manufacturer          model               displ            year     
##  Length:234         Length:234         Min.   :1.600   Min.   :1999  
##  Class :character   Class :character   1st Qu.:2.400   1st Qu.:1999  
##  Mode  :character   Mode  :character   Median :3.300   Median :2004  
##                                        Mean   :3.472   Mean   :2004  
##                                        3rd Qu.:4.600   3rd Qu.:2008  
##                                        Max.   :7.000   Max.   :2008  
##       cyl           trans               drv                 cty       
##  Min.   :4.000   Length:234         Length:234         Min.   : 9.00  
##  1st Qu.:4.000   Class :character   Class :character   1st Qu.:14.00  
##  Median :6.000   Mode  :character   Mode  :character   Median :17.00  
##  Mean   :5.889                                         Mean   :16.86  
##  3rd Qu.:8.000                                         3rd Qu.:19.00  
##  Max.   :8.000                                         Max.   :35.00  
##       hwy             fl               class          
##  Min.   :12.00   Length:234         Length:234        
##  1st Qu.:18.00   Class :character   Class :character  
##  Median :24.00   Mode  :character   Mode  :character  
##  Mean   :23.44                                        
##  3rd Qu.:27.00                                        
##  Max.   :44.00
```

```r
g <- ggplot(mpg, aes(displ, hwy))

g + geom_point()
```

![center](../figure/unnamed-chunk-1-1.png)

```r
g + geom_point() + geom_smooth(method="lm")
```

![center](../figure/unnamed-chunk-1-2.png)

```r
g + geom_point() + geom_smooth(method="lm") + facet_grid(drv~.)
```

![center](../figure/unnamed-chunk-1-3.png)

```r
g + geom_point(color="steelblue", size=4, alpha=1/2)
```

![center](../figure/unnamed-chunk-1-4.png)

```r
g + geom_point(aes(color=drv)) + 
labs(title="Fuel ecomony...", 
     x= "Engine displ", y="highway milage") + theme_bw(base_family = "Times")
```

![center](../figure/unnamed-chunk-1-5.png)

```r
ggplot(mpg, aes(displ)) + geom_histogram(aes(color=drv)) + theme_bw()
```

```
## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
```

![center](../figure/unnamed-chunk-1-6.png)

```r
library(reshape2)
library(plyr)
library(dplyr)
```

```
## 
## Attaching package: 'dplyr'
```

```
## The following objects are masked from 'package:plyr':
## 
##     arrange, count, desc, failwith, id, mutate, rename, summarise,
##     summarize
```

```
## The following objects are masked from 'package:stats':
## 
##     filter, lag
```

```
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

```r
mt <- select(mtcars, c(1,3,4,5,6,7))
mt2 <- cor(mt)
mt3 <- melt(mt2)
ggplot(mt3, aes(x=Var1, y=Var2, fill=value)) + geom_tile()
```

![center](../figure/unnamed-chunk-1-7.png)

```r
mtcars %>%
  select(c(1,3,4,5,6,7)) %>%
  cor() %>%
  melt() %>%
  ggplot(aes(x=Var1, y=Var2, color=value)) + geom_point()
```

![center](../figure/unnamed-chunk-1-8.png)

# Python-ized version (courtesy of [@QuLogic](https://github.com/QuLogic))

<script src="https://gist.github.com/QuLogic/6c168deedeab0a7c2c96.js"></script>
