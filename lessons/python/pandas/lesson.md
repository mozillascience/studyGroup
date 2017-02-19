---
layout: page
title: Intro to Pandas DataFrames
visible: true
tags:
  - python
  - beginner
---

 - **Authors**: Dano Morrison
 - **Research field**: Neuroscience
 - **Lesson topic**: Usage of Pandas DataFrames for data analysis
 - **Lesson content URL**: <https://github.com/UofTCoders/studyGroup/tree/gh-pages/lessons/python/pandas>

# Introduction

DataFrames are a lovely way to store data. They're essentially matrices that can store almost any type of data and are a great option for handling data where you want to keep track of rows and columns with labels. The Pandas library also comes with a handy host of functions that allow you to work with your DataFrames in very smart ways (eg. means, split-apply-combine).

The Pandas website has a lot of [great documentation](http://pandas.pydata.org/pandas-docs/version/0.15.2/10min.html#min) to help you get started. However, even after reading the official tutorials, I was stumped on some problems using DataFrames. This lesson is based directly off of how I solved those problems, so hopefully some will find it helpful. 

# Creating DataFrames

You can instantiate DataFrames without any data or with data from any number of sources

~~~
import pandas as pd
import numpy as np

blank = pd.DataFrame()

blank
~~~

~~~
movies = pd.DataFrame(np.zeros((4,4)), index=['Forrest Gump', 'Scanners', '2010: Odyssey Two', 'Fern Gully'], columns = ['Date Released', 'Box Office Gross', 'IMDB Score', 'Tomatometer'])

movies
~~~

~~~
zeros = pd.DataFrame(np.zeros((3,5)))

zeros
~~~

Got a csv file you want to read? No problem!

~~~
probedata = pd.read_csv('12probe20cm.csv')

probedata[1:4]
~~~

# Slicing DataFrames
You can slice DataFrames just like an array, and can also include some more advanced criteria

~~~
movies['Date Released'] = ['1994','1981','1984','1992']
movies['Box Office Gross'] = [50,12,8,16]
movies['IMDB Score'] = [8.8,6.8,6.8,6.4]
movies['Tomatometer'] = [.72,.80,.66,.71]

movies[1:2]

#OR

movies.iloc[1:2]
~~~

~~~
movies[['IMDB Score','Tomatometer']]
~~~

~~~
movies[movies['IMDB Score']<(movies['Tomatometer']*10)]
~~~

# Adding new elements

Columns and rows can be added easily (relatively)

Columns can be added by setting a new column to another DataFrame. Just make sure that the indices are compatible!

~~~
favlist = pd.DataFrame([True,True,True,True],index=movies.index)

movies['Childhood Top 10?'] = favlist

movies
~~~

Rows can be added by using the append function on a DataFrame, taking an appropriately index and columned DataFrame that will be added on the end of the first DataFrame.

~~~
wildwildwest = pd.DataFrame(index=['Wild Wild West'], columns=movies.columns)

wildwildwest.iloc[0] = ['1999', 2, 4.8,.17,False]

movies.append(wildwildwest)
~~~

The concat function is also very useful. It can handle DataFrames with different indices and/or columns. There are multiple ways to joining the indices and columns however you would like

~~~
pd.concat([movies,movies])
~~~

# The Amazing GroupBy

Pandas.GroupBy is a great function that allows you to process your data in many different ways without having to get fancy or write any loops.

Essentially, it carries out three different steps:

- *Splitting*: the data into different groups [eg. treatment condition]
- *Applying*: some function to your data [eg. mean]
- *Combining*: the results back into another DataFrame

In my work, this function was extremely useful when I wanted to obtain the mean *time spent in target zone* for each of my treatment groups

~~~
probedata
~~~

~~~
grouped = probedata.groupby(['Group']).mean()

grouped
~~~


    import matplotlib.pylab as plt
    import seaborn as sns
    
    sns.set_context("talk")
    grouped[['Zone 1 %','Target Zone %','Zone 3 %','Zone 4 %']].plot(kind='bar')
    plt.title('Time spent in Zone')
    plt.ylabel('Time (sec)')
    plt.xlabel('Zone')
    locs, labels = plt.xticks()
    plt.setp(labels,rotation=0)
    plt.show()

