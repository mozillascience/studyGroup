---
layout: page
title: "Resampling techniques in R: bootstrapping and permutation testing"
visible: true
tags:
  # languages
  - r
  # levels
  - intermediate
---

 - **Authors**: Luke Johnston 
 - **Research field**: Nutritional Sciences
 - **Lesson content URL**: <https://github.com/UofTCoders/studyGroup/tree/gh-pages/lessons/r/resampling>

-----

In statistics, we use samples to infer about the population given some set of
conditions. We generally do not know or can ever know (without substantial cost
and time) the entire characteristics of the population, so we use the sample to
make guesses. Because the sample is not the entire population, the sample does
not completely represent the population. That's why there are standard
deviations, standard errors, and confidence intervals with all statistics. If we
took another sample, it would be slightly different from the original sample and
would have slightly different statistics. Since standard errors of the
statistics are calculated based on the sample, these estimates can be biased to
the sample and have certain mathematical assumptions about the distribution.
What resampling does is to take randomly drawn (sub)samples of the sample and
calculate the statistic from that (sub)sample. Do this enough times and you can
get a distribution of statistic values that can provide an empirical measure of
the accuracy/precision of the test statistic, with less rigid assumptions. In
this lesson, I'll cover bootstrapping and permutation testing. The differences
come down to essentially: 

- Bootstrapping is best used to estimate confidence intervals of test statistics.
- Permutation testing is best used for testing hypotheses.

## Bootstrapping

Bootstrapping is the process of resampling *with replacement* (*all* values in
the sample have an *equal* probability of being selected, including multiple
times, so a value could have a duplicate). Resample, calculate a statistic (e.g.
the mean), repeat this hundreds or thousands of times and you are able to
estimate a precise/accurate uncertainty of the mean (confidence interval) of the
data's distribution. There are less assumptions about the underlying
distribution using bootstrap compared to calculating the standard error
directly.


```r
x <- runif(10)
hist(x)
mean(x)
```

```
## [1] 0.5701154
```

```r
resample <- sample(x, replace = TRUE)
mean(resample)
```

```
## [1] 0.6443582
```

```r
library(dplyr)
```

```
## 
## Attaching package: 'dplyr'
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
library(ggplot2)
```

![center](../figure/unnamed-chunk-1-1.png)

```r
# Resample 100 times, and find the mean of each
data_frame(num = 1:100) %>% 
    group_by(num) %>% 
    mutate(means = mean(sample(x, replace = TRUE))) %>% 
    ggplot(aes(x = means)) +
    geom_freqpoly()
```

```
## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
```

![center](../figure/unnamed-chunk-1-2.png)

```r
# Resample a 5000 times, and find the mean of each
data_frame(num = 1:100) %>% 
    group_by(num) %>% 
    mutate(means = mean(sample(x, replace = TRUE))) %>% 
    ggplot(aes(x = means)) +
    geom_freqpoly()
```

```
## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
```

![center](../figure/unnamed-chunk-1-3.png)

There is a R package that does boostrapping, called `boot`. The `boot` function
needs a function that calculates the mean based on the resample of the data. It
takes two arguments, the values (`x`) and the resample vector of the values
(`i`).


```r
library(boot)

# Create a function to take a resample of the values, 
# and then calculate the mean
boot_mean <- function(original_vector, resample_vector) {
    mean(original_vector[resample_vector])
}

# R is number of replications
mean_results <- boot(x, boot_mean, R = 2000)

# Load broom to get a tidy dataframe as output.
library(broom)
tidy(mean_results)
```

```
##   statistic         bias  std.error
## 1 0.5701154 -0.004093434 0.08803179
```

```r
# Calculate the confidence intervals
boot.ci(mean_results)
```

```
## Warning in boot.ci(mean_results): bootstrap variances needed for
## studentized intervals
```

```
## BOOTSTRAP CONFIDENCE INTERVAL CALCULATIONS
## Based on 2000 bootstrap replicates
## 
## CALL : 
## boot.ci(boot.out = mean_results)
## 
## Intervals : 
## Level      Normal              Basic         
## 95%   ( 0.4017,  0.7467 )   ( 0.4046,  0.7517 )  
## 
## Level     Percentile            BCa          
## 95%   ( 0.3885,  0.7356 )   ( 0.4044,  0.7445 )  
## Calculations and Intervals on Original Scale
```

If you bootstrap for a statistic with two values, the individual rows are
resampled. However, the rows are still paired together (no reshuffling of the
order occurs).


```r
boot_corr <- function(data, resample_vector) {
    cor(data$x[resample_vector], data$y[resample_vector])
}

ds <- data.frame(y = runif(10), x = runif(10))

# Original correlation
cor(ds$x, ds$y)
```

```
## [1] -0.2155279
```

```r
# Bootstrapped correlation
cor_results <- boot(example_data, boot_corr, R = 100)
```

```
## Error in NROW(data): object 'example_data' not found
```

```r
tidy(cor_results)
```

```
## Error in tidy(cor_results): object 'cor_results' not found
```

```r
# Plus confidence interval
boot.ci(cor_results)
```

```
## Error in boot.ci(cor_results): object 'cor_results' not found
```

## Permutation testing

Similar to bootstrapping, except permutation testing resamples *without
replacement* (meaning when a value is selected, it can not be selected again, so
no value can be a duplicate). This simply shuffles the values. In the case of a
univariate statistic (e.g. mean), this will not change anything. However, when
there are two or more variables, reshuffling one variable will change the test
statistic (e.g. correlation or regression). Usually this is done on the
response/outcome/y variable, and usually for tests that use discrete or
categorical ("yes", "no") variables.


```r
ds <- data.frame(y = runif(10), x = runif(10))
ds
```

```
##             y          x
## 1  0.26248353 0.60789022
## 2  0.27608331 0.81612978
## 3  0.35928985 0.47067467
## 4  0.34308694 0.86670014
## 5  0.61019344 0.23596764
## 6  0.31907683 0.53597891
## 7  0.51808777 0.77629172
## 8  0.39792031 0.09387856
## 9  0.04529551 0.75595895
## 10 0.56524394 0.44996910
```

```r
# Using spearman correlation to be consistent with the next example
cor(ds$y, ds$x, method = "spearman") 
```

```
## [1] -0.5393939
```

```r
# Resampled the y only (reshuffled the order)
ds$resample_y <- sample(ds$y)
ds
```

```
##             y          x resample_y
## 1  0.26248353 0.60789022 0.31907683
## 2  0.27608331 0.81612978 0.04529551
## 3  0.35928985 0.47067467 0.56524394
## 4  0.34308694 0.86670014 0.39792031
## 5  0.61019344 0.23596764 0.34308694
## 6  0.31907683 0.53597891 0.35928985
## 7  0.51808777 0.77629172 0.51808777
## 8  0.39792031 0.09387856 0.26248353
## 9  0.04529551 0.75595895 0.27608331
## 10 0.56524394 0.44996910 0.61019344
```

```r
# Correlation again, with the resampled y
cor(ds$resample_y, ds$x, method = "spearman")
```

```
## [1] -0.07878788
```

```r
# 1000 resamples of the correlation of each.
data_frame(num = 1:1000) %>% 
    group_by(num) %>% 
    mutate(corr = cor(sample(y), x, method = "spearman")) %>% 
    ggplot(aes(x = corr)) +
    geom_freqpoly()
```

```
## Error in mutate_impl(.data, dots): Evaluation error: object 'y' not found.
```

There is a `coin` package that does permutation testing for several tests.


```r
library(coin)
```

```
## Loading required package: methods
```

```
## Loading required package: survival
```

```
## 
## Attaching package: 'survival'
```

```
## The following object is masked from 'package:boot':
## 
##     aml
```

```r
ds <- data.frame(y, x)
```

```
## Error in data.frame(y, x): object 'y' not found
```

```r
spearman_test(y ~ x, data = ds)
```

```
## 
## 	Asymptotic Spearman Correlation Test
## 
## data:  y by x
## Z = -1.6182, p-value = 0.1056
## alternative hypothesis: true rho is not equal to 0
```

There are many more tests found within the `coin` package. Check them out in the vignette:


```r
vignette("coin", package = "coin")
```

## Resources:

- [CrossValidated Q&A on resampling](https://stats.stackexchange.com/questions/104040/resampling-simulation-methods-monte-carlo-bootstrapping-jackknifing-cross)
- [Wikipedia on Bootstrap](https://en.wikipedia.org/wiki/Bootstrapping_(statistics))
- [Documentation on the `coin` package](https://cran.r-project.org/web/packages/coin/vignettes/coin.pdf)
