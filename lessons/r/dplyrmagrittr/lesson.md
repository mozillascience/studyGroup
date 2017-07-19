---
layout: page
title: Data wrangling with dplyr and magrittr
visible: true
tags:
  - r
  - intermediate
---



 - **Authors**: Ahmed Hasan
 - **Research field**: Genomics
 - **Lesson topic**: Data wrangling with dplyr and magrittr
 - **Lesson content URL**: <https://github.com/UofTCoders/studyGroup/tree/gh-pages/lessons/r/dplyrmagrittr>
 - **Lesson video stream**: coming soon!

## Why `dplyr` and `magrittr`?

`dplyr` is a package for data wrangling and manipulation developed primarily by Hadley Wickham as part of his 'tidyverse' group of packages. It provides a powerful suite of functions that operate specifically on data frame objects, allowing for easy subsetting, filtering, sampling, summarising, and more.

The overall philosophy binding `dplyr` together is rather simple - save for a select few exceptions, nearly every function in the package follows the convention of taking in a data frame as input and returning a modified data frame as output. Coupled with the pipe operator from the `magrittr` package, chaining `dplyr` functions together makes data frame manipulation an absolute breeze.

## Meet the pipe

The R pipe, or `%>%` (Ctrl/Cmd + Shift + M in RStudio) initially began life outside of `dplyr`, finding its R beginnings in the `magrittr` package instead. Its creator, Stefan Milton Bache, was inspired by the pipe operator in F# (`|>`) in addition to its Unix shell equivalent (`|`).

Much like in those examples, the idea behind the `magrittr` pipe is also relatively simple: it essentially stands for 'evaluate the left hand side, and feed the result as input to the function on the right hand side'. For functions that take multiple arguments, the pipe will feed it to the first one by default. Like so:


```r
library(magrittr)

x <- c(1,2)

sum(x, 3)
```

```
## [1] 6
```

```r
x %>% sum(3)
```

```
## [1] 6
```

```r
sum(x, 3) == x %>% sum(3)
```

```
## [1] TRUE
```

Of course, sometimes we want our LHS to be fed into a different argument that just so happens to not be the first one. In these cases, we use `.` to tell R where to send the LHS instead:


```r
seq(1, 10, 2)
```

```
## [1] 1 3 5 7 9
```

```r
1 %>% seq(10, 2)
```

```
## [1] 1 3 5 7 9
```

```r
10 %>% seq(1, ., 2)
```

```
## [1] 1 3 5 7 9
```

Given the `dplyr` concept of each function taking in a data frame and returning a modified version, it made a lot of sense to integrate the pipe into the `dplyr` workflow. This way, a given data frame would be 'piped' through a series of functions one after the other in order to obtain a specific desired output.

To summarise:


```r
f(x) == x %>% f()

f(x, y) == x %>% f(y)

f(x, y) == y %>% f(x, .)
```


## Tidy data

One final thing to note before we delve into `dplyr` itself is the concept of _tidy data_. This basically describes a data set where each column is a variable or feature of the data, and every row is a single observation. Fisher and Anderson's `iris`, which we'll be using in today's lesson, is a good example of a tidy dataset.



```r
head(iris)
```

```
##   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
## 1          5.1         3.5          1.4         0.2  setosa
## 2          4.9         3.0          1.4         0.2  setosa
## 3          4.7         3.2          1.3         0.2  setosa
## 4          4.6         3.1          1.5         0.2  setosa
## 5          5.0         3.6          1.4         0.2  setosa
## 6          5.4         3.9          1.7         0.4  setosa
```

The `iris` dataset gives measurements of sepal length/width and petal length/width for 50 flower samples from each of _Iris setosa_, _Iris versicolor_, and _Iris virginica_. Notice how each row corresponds to measurements from a single flower sample, and each column represents a specific feature of that flower. 

`dplyr` is optimized for use with tidy data. However, real world data are rarely in a tidy format from the get-go. For this reason, Hadley and co. have also developed the `tidyr` package, which provides useful functions for reshaping data. We won't be covering `tidyr` in today's lesson, but a wealth of tutorials are available online.

Alright, let's dive right into `dplyr`!

## `filter` - subsetting rows

`filter` is the first `dplyr` verb we'll be looking at. At its core, and much like all `dplyr` functions, `filter` will take an input data frame as its first argument. Following that, we can define a set of conditions that we want to filter the rows of our data frame by.

To begin with, let's look at all the flowers that have a sepal length greater than or equal to 7.0 cm.


```r
library(dplyr)

filter(iris, Sepal.Length >= 7.0)
```

```
##    Sepal.Length Sepal.Width Petal.Length Petal.Width    Species
## 1           7.0         3.2          4.7         1.4 versicolor
## 2           7.1         3.0          5.9         2.1  virginica
## 3           7.6         3.0          6.6         2.1  virginica
## 4           7.3         2.9          6.3         1.8  virginica
## 5           7.2         3.6          6.1         2.5  virginica
## 6           7.7         3.8          6.7         2.2  virginica
## 7           7.7         2.6          6.9         2.3  virginica
## 8           7.7         2.8          6.7         2.0  virginica
## 9           7.2         3.2          6.0         1.8  virginica
## 10          7.2         3.0          5.8         1.6  virginica
## 11          7.4         2.8          6.1         1.9  virginica
## 12          7.9         3.8          6.4         2.0  virginica
## 13          7.7         3.0          6.1         2.3  virginica
```

We can simply tack on any further conditions we might want to filter by as separate arguments:


```r
filter(iris, Sepal.Length >= 7.0, Species == 'versicolor')
```

```
##   Sepal.Length Sepal.Width Petal.Length Petal.Width    Species
## 1            7         3.2          4.7         1.4 versicolor
```

## `select` - subsetting columns

`select` operates in a similar fashion to `filter`, but allows for subsetting columns instead. Since `select` is primarily given column names (which can be thought of as text strings) for input, it also allows for easy globbing of multiple columns at once.

A quick aside - we are also going to convert `iris` to a tibble from this point onwards. Tibbles are another feature of `dplyr`; they're essentially data frame objects with a number of under-the-hood improvements, but those are somewhat beyond the scope of this lesson. What's relevant to us here is that they prevent R from printing out the entire data frame when it's called, and are also previewed in an informative format that tells us about the object types stored within each data frame column and more. ([More details here if you're interested.](https://cran.r-project.org/web/packages/tibble/vignettes/tibble.html))


```r
ir <- as_tibble(iris)

select(ir, Species)
```

```
## # A tibble: 150 x 1
##    Species
##     <fctr>
##  1  setosa
##  2  setosa
##  3  setosa
##  4  setosa
##  5  setosa
##  6  setosa
##  7  setosa
##  8  setosa
##  9  setosa
## 10  setosa
## # ... with 140 more rows
```

We can select multiple columns by simply providing their names as further arguments. `dplyr` also allows use of the `:` operator for consecutive columns.


```r
select(ir, Sepal.Length:Petal.Length, Species)
```

```
## # A tibble: 150 x 4
##    Sepal.Length Sepal.Width Petal.Length Species
##           <dbl>       <dbl>        <dbl>  <fctr>
##  1          5.1         3.5          1.4  setosa
##  2          4.9         3.0          1.4  setosa
##  3          4.7         3.2          1.3  setosa
##  4          4.6         3.1          1.5  setosa
##  5          5.0         3.6          1.4  setosa
##  6          5.4         3.9          1.7  setosa
##  7          4.6         3.4          1.4  setosa
##  8          5.0         3.4          1.5  setosa
##  9          4.4         2.9          1.4  setosa
## 10          4.9         3.1          1.5  setosa
## # ... with 140 more rows
```

The `-` operator can be used to exclude a column:


```r
select(ir, -Species)
```

```
## # A tibble: 150 x 4
##    Sepal.Length Sepal.Width Petal.Length Petal.Width
##           <dbl>       <dbl>        <dbl>       <dbl>
##  1          5.1         3.5          1.4         0.2
##  2          4.9         3.0          1.4         0.2
##  3          4.7         3.2          1.3         0.2
##  4          4.6         3.1          1.5         0.2
##  5          5.0         3.6          1.4         0.2
##  6          5.4         3.9          1.7         0.4
##  7          4.6         3.4          1.4         0.3
##  8          5.0         3.4          1.5         0.2
##  9          4.4         2.9          1.4         0.2
## 10          4.9         3.1          1.5         0.1
## # ... with 140 more rows
```

Finally, `select` features the helper functions `contains`, `starts_with`, and `ends_with` for globbing column names. Note that while we generally treat column names as objects in the body of `dplyr` functions, these helper functions _require strings as input_.


```r
select(ir, contains('Sepal'))
```

```
## # A tibble: 150 x 2
##    Sepal.Length Sepal.Width
##           <dbl>       <dbl>
##  1          5.1         3.5
##  2          4.9         3.0
##  3          4.7         3.2
##  4          4.6         3.1
##  5          5.0         3.6
##  6          5.4         3.9
##  7          4.6         3.4
##  8          5.0         3.4
##  9          4.4         2.9
## 10          4.9         3.1
## # ... with 140 more rows
```

```r
select(ir, starts_with('Petal'))
```

```
## # A tibble: 150 x 2
##    Petal.Length Petal.Width
##           <dbl>       <dbl>
##  1          1.4         0.2
##  2          1.4         0.2
##  3          1.3         0.2
##  4          1.5         0.2
##  5          1.4         0.2
##  6          1.7         0.4
##  7          1.4         0.3
##  8          1.5         0.2
##  9          1.4         0.2
## 10          1.5         0.1
## # ... with 140 more rows
```

```r
select(ir, ends_with('Length'))
```

```
## # A tibble: 150 x 2
##    Sepal.Length Petal.Length
##           <dbl>        <dbl>
##  1          5.1          1.4
##  2          4.9          1.4
##  3          4.7          1.3
##  4          4.6          1.5
##  5          5.0          1.4
##  6          5.4          1.7
##  7          4.6          1.4
##  8          5.0          1.5
##  9          4.4          1.4
## 10          4.9          1.5
## # ... with 140 more rows
```

### Here comes the pipe

But what if we want to select certain columns, _and then_ filter the resultant rows by a certain condition? (Or vice versa)

We could certainly nest functions, like so:


```r
filter(select(ir, contains('Sepal')), Sepal.Length >= 7.0)
```

```
## # A tibble: 13 x 2
##    Sepal.Length Sepal.Width
##           <dbl>       <dbl>
##  1          7.0         3.2
##  2          7.1         3.0
##  3          7.6         3.0
##  4          7.3         2.9
##  5          7.2         3.6
##  6          7.7         3.8
##  7          7.7         2.6
##  8          7.7         2.8
##  9          7.2         3.2
## 10          7.2         3.0
## # ... with 3 more rows
```

But this is messy enough as is, and that's just with a single instance of nesting. Imagine we had three or four nested functions! We'd fast approach having more parentheses than actual code.

An alternative is using intermediate objects:


```r
sepals <- select(ir, contains('Sepal'))
filter(sepals, Sepal.Length >= 7.0)
```

```
## # A tibble: 13 x 2
##    Sepal.Length Sepal.Width
##           <dbl>       <dbl>
##  1          7.0         3.2
##  2          7.1         3.0
##  3          7.6         3.0
##  4          7.3         2.9
##  5          7.2         3.6
##  6          7.7         3.8
##  7          7.7         2.6
##  8          7.7         2.8
##  9          7.2         3.2
## 10          7.2         3.0
## # ... with 3 more rows
```

But that can be a drain on memory if we're working with large amounts of data; not to mention that the number of intermediates would only grow as our analysis goes on, increasingly cluttering our workspace.

However, recall that every `dplyr` function both takes in a data frame object as its first argument, and returns one as output. With this being the case, the pipe allows us to easily chain `dplyr` functions together.


```r
ir %>% 
  select(contains('Sepal')) %>% 
  filter(Sepal.Length >= 7.0)
```

```
## # A tibble: 13 x 2
##    Sepal.Length Sepal.Width
##           <dbl>       <dbl>
##  1          7.0         3.2
##  2          7.1         3.0
##  3          7.6         3.0
##  4          7.3         2.9
##  5          7.2         3.6
##  6          7.7         3.8
##  7          7.7         2.6
##  8          7.7         2.8
##  9          7.2         3.2
## 10          7.2         3.0
## # ... with 3 more rows
```

Notice how that code is both easy to conceptualize and understand after the fact, and that neither of the `dplyr` functions have the data frame actually listed as part of their arguments. The overall code block effectively reads like:


```r
# Take ir, then -
#   select all columns with 'Sepal' in the name, then -
#   filter for rows where sepal length is greater than or equal to 7.0.
```

In using the pipe with `dplyr` functions, we can write up simple 'recipes' that manipulate data frame objects in a quick and straightforward manner.

Of course, there's more to `dplyr` than just subsetting -

## `arrange` - sort your data

Much like the name implies, `arrange` allows us to sort data. Not much to it:


```r
ir %>% 
  select(starts_with('Sepal')) %>% 
  filter(Sepal.Length >= 7.0) %>% 
  arrange(Sepal.Length)
```

```
## # A tibble: 13 x 2
##    Sepal.Length Sepal.Width
##           <dbl>       <dbl>
##  1          7.0         3.2
##  2          7.1         3.0
##  3          7.2         3.6
##  4          7.2         3.2
##  5          7.2         3.0
##  6          7.3         2.9
##  7          7.4         2.8
##  8          7.6         3.0
##  9          7.7         3.8
## 10          7.7         2.6
## # ... with 3 more rows
```

Sorting in descending order is not much harder:


```r
ir %>% 
  select(starts_with('Sepal')) %>% 
  filter(Sepal.Length >= 7.0) %>% 
  arrange(desc(Sepal.Length))
```

```
## # A tibble: 13 x 2
##    Sepal.Length Sepal.Width
##           <dbl>       <dbl>
##  1          7.9         3.8
##  2          7.7         3.8
##  3          7.7         2.6
##  4          7.7         2.8
##  5          7.7         3.0
##  6          7.6         3.0
##  7          7.4         2.8
##  8          7.3         2.9
##  9          7.2         3.6
## 10          7.2         3.2
## # ... with 3 more rows
```

Finally, feeding two (or more) arguments to `arrange` will be interpreted as 'sort by first column and then by second column'.


```r
ir %>% 
  select(starts_with('Sepal')) %>% 
  filter(Sepal.Length >= 7.0) %>% 
  arrange(Sepal.Length, Sepal.Width)
```

```
## # A tibble: 13 x 2
##    Sepal.Length Sepal.Width
##           <dbl>       <dbl>
##  1          7.0         3.2
##  2          7.1         3.0
##  3          7.2         3.0
##  4          7.2         3.2
##  5          7.2         3.6
##  6          7.3         2.9
##  7          7.4         2.8
##  8          7.6         3.0
##  9          7.7         2.6
## 10          7.7         2.8
## # ... with 3 more rows
```

## `mutate` - make new variables

`mutate` is arguably where `dplyr` really comes to life. So far, we've just been playing around with existing data, subsetting it and arranging it how we please. Which is certainly very useful! But `mutate` allows us to create entirely new variables (i.e. columns) in our data frame object out of operations performed on the data frame itself.

`mutate` employs _window functions_ in order to do this. Unlike an _aggregation function_ (such as `mean`) which takes in $n$ values and returns one value, a window function will take in $n$ elements as input and return $n$ elements as output. In the case of `mutate`, this means performing an operation on every single row of a data frame and returning the resultant values in a new column.

Let's use `mutate` to calculate the approximate area of sepals and petals in our dataset.


```r
ir %>% 
  select(contains('Sepal')) %>% 
  mutate(Sepal.Area = Sepal.Length * Sepal.Width)
```

```
## # A tibble: 150 x 3
##    Sepal.Length Sepal.Width Sepal.Area
##           <dbl>       <dbl>      <dbl>
##  1          5.1         3.5      17.85
##  2          4.9         3.0      14.70
##  3          4.7         3.2      15.04
##  4          4.6         3.1      14.26
##  5          5.0         3.6      18.00
##  6          5.4         3.9      21.06
##  7          4.6         3.4      15.64
##  8          5.0         3.4      17.00
##  9          4.4         2.9      12.76
## 10          4.9         3.1      15.19
## # ... with 140 more rows
```

We could also get the differences between sepal length and petal length for each flower:


```r
ir %>% 
  select(ends_with('Length')) %>% 
  mutate(Length.Diff = Sepal.Length - Petal.Length)
```

```
## # A tibble: 150 x 3
##    Sepal.Length Petal.Length Length.Diff
##           <dbl>        <dbl>       <dbl>
##  1          5.1          1.4         3.7
##  2          4.9          1.4         3.5
##  3          4.7          1.3         3.4
##  4          4.6          1.5         3.1
##  5          5.0          1.4         3.6
##  6          5.4          1.7         3.7
##  7          4.6          1.4         3.2
##  8          5.0          1.5         3.5
##  9          4.4          1.4         3.0
## 10          4.9          1.5         3.4
## # ... with 140 more rows
```

Gone are the days of clumsy loops over data frame rows!

Of course, if we are performing some kind of complex operation that `mutate` is behaving strangely with, we can use `rowwise` to evaluate the operation one row at a time.


```r
ir %>% 
  select(ends_with('Length'), Species) %>% 
  rowwise() %>% 
  mutate(Length.Diff = Sepal.Length - Petal.Length)
```

```
## Source: local data frame [150 x 4]
## Groups: <by row>
## 
## # A tibble: 150 x 4
##    Sepal.Length Petal.Length Species Length.Diff
##           <dbl>        <dbl>  <fctr>       <dbl>
##  1          5.1          1.4  setosa         3.7
##  2          4.9          1.4  setosa         3.5
##  3          4.7          1.3  setosa         3.4
##  4          4.6          1.5  setosa         3.1
##  5          5.0          1.4  setosa         3.6
##  6          5.4          1.7  setosa         3.7
##  7          4.6          1.4  setosa         3.2
##  8          5.0          1.5  setosa         3.5
##  9          4.4          1.4  setosa         3.0
## 10          4.9          1.5  setosa         3.4
## # ... with 140 more rows
```

Finally, it is sometimes useful to drop all other columns once we've performed a `mutate` operation. Instead of having to use `select` after the fact to keep the columns we need, `transmute` is a version of `mutate` that only keeps the variables you create.


```r
ir %>% 
  select(contains('Sepal'), Species) %>% 
  transmute(Sepal.Area = Sepal.Length * Sepal.Width)
```

```
## # A tibble: 150 x 1
##    Sepal.Area
##         <dbl>
##  1      17.85
##  2      14.70
##  3      15.04
##  4      14.26
##  5      18.00
##  6      21.06
##  7      15.64
##  8      17.00
##  9      12.76
## 10      15.19
## # ... with 140 more rows
```

Notice how the Species column is also gone in the example above.

## `summarise` - summarise your data

Where `mutate` is all about window functions, `summarise` returns us to the familiar world of aggregate functions, outputting a single value for however many values are fed as input. These should generally be quite familiar:


```r
ir %>% 
  select(contains('Sepal')) %>% 
  summarise(Mean.S.Length = mean(Sepal.Length), Mean.S.Width = mean(Sepal.Width))
```

```
## # A tibble: 1 x 2
##   Mean.S.Length Mean.S.Width
##           <dbl>        <dbl>
## 1      5.843333     3.057333
```

The important thing to note is that in using `summarise`, we are obtaining our summary values within a data frame structure still. Using something like `mean` outside of `summarise` would simply return a float.

## `group_by` - group your data

`group_by` is primarily a helper function itself, but it provides an immense amount of added utility to `mutate` and `summarise`. It does so by adding grouping information in an under the hood fashion. While this does not necessarily do anything explicit to the data, both `summarise` and `mutate` behave quite differently when presented with a grouped data frame.

For instance, let's redo the `summarise` function we did above, but now in a grouped manner:


```r
ir %>% 
  select(contains('Sepal'), Species) %>% 
  group_by(Species) %>% 
  summarise(Mean.S.Length = mean(Sepal.Length), Mean.S.Width = mean(Sepal.Width))
```

```
## # A tibble: 3 x 3
##      Species Mean.S.Length Mean.S.Width
##       <fctr>         <dbl>        <dbl>
## 1     setosa         5.006        3.428
## 2 versicolor         5.936        2.770
## 3  virginica         6.588        2.974
```

We can also quickly obtain the total number of records for each species:


```r
ir %>% 
  group_by(Species) %>% 
  summarise(count = n())
```

```
## # A tibble: 3 x 2
##      Species count
##       <fctr> <int>
## 1     setosa    50
## 2 versicolor    50
## 3  virginica    50
```

Or the number of distinct values in a given column:


```r
ir %>% 
  group_by(Species) %>% 
  summarise(distinct = n_distinct(Sepal.Length))
```

```
## # A tibble: 3 x 2
##      Species distinct
##       <fctr>    <int>
## 1     setosa       15
## 2 versicolor       21
## 3  virginica       21
```

`group_by` also works with `mutate` for grouped operations. For instance, if we want to examine the ratio of each flower's sepal length from the mean for that species, we could try something like this:


```r
ir %>% 
  select(Sepal.Length, Species) %>% 
  group_by(Species) %>% 
  mutate(Grouped.SL.Ratio = Sepal.Length / mean(Sepal.Length))
```

```
## # A tibble: 150 x 3
## # Groups:   Species [3]
##    Sepal.Length Species Grouped.SL.Ratio
##           <dbl>  <fctr>            <dbl>
##  1          5.1  setosa        1.0187775
##  2          4.9  setosa        0.9788254
##  3          4.7  setosa        0.9388734
##  4          4.6  setosa        0.9188973
##  5          5.0  setosa        0.9988014
##  6          5.4  setosa        1.0787056
##  7          4.6  setosa        0.9188973
##  8          5.0  setosa        0.9988014
##  9          4.4  setosa        0.8789453
## 10          4.9  setosa        0.9788254
## # ... with 140 more rows
```

In this example, `mean(Sepal.Length)` is computed for each species, instead of from the entire dataset.

Finally, grouping information can be removed with the `ungroup` function. This is useful when performing one grouped operation and then performing a second in the same `dplyr` chain but off of a different column grouping.

## To `summarise`

- `select` allows you to subset by column
- `filter` allows you to subset rows that meet one or more conditions
- `arrange` allows you to sort your data
- `group_by` allows you to group your data for grouped downstream operations
- `mutate` allows you to compute new variables from your data
- `summarise` allows you to apply summary functions on your data

The official [Data Wrangling with R cheat sheet](https://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf) is a stellar reference for working with all these functions and more. Chain them together however you please using the pipe, and watch your adventures wrangling data frames become substantially more straightforward!

## Some `magrittr` tricks

While we may have covered the basics of `dplyr` and how the pipe synergizes with it, it's still worth going over some of the unique tricks `magrittr` itself offers.

### The tee operator - `%T>%`

Another operator that derives its inspiration from the Unix shell equivalent, the tee operator will still pass on LHS to RHS, but _returns LHS to stdout_ instead of RHS.

In the context of a `dplyr` chain of commands, this is especially useful when we are saving the final result of said commands back to a data frame, but also have some kind of ancillary function tacked on at the very end (i.e. `plot()`) that we don't want saved to the object.


```r
sepalsonly <- ir %>% 
  select(Sepal.Length, Sepal.Width) %T>% 
  plot()
```

Here, the tee operator allows us to view a plot of our data, but without the output of `plot` ending up saved to the `sepalsonly` object. `plot` is therefore still part of our command chain, but not in an obtrusive way.

### The compound assignment operator - `%<>%`

The compound assignment operator also comes in handy when we're performing a series of `dplyr` commands on a data frame and saving the results back to it.

Where we might do:


```r
ir <- ir %>% 
  select(contains('Sepal'), Species)
```

The compound assignment operator makes for a useful bit of shorthand:


```r
ir %<>%
  select(contains('Sepal'), Species)
```


