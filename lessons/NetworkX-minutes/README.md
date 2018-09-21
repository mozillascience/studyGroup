---
layout: page
title: Demo session on NetworkX python package
text: 
link: https://github.com/uio-carpentry/studyGroup/issues/6
visible: true
tags:
  # languages
  - python
  # levels
  - intermediate
---

<!-- change visible to true if you want it on the site -->
<!-- remove any tags listed above that are not relevant -->

 - **Authors**: Annika Rockenberger and Anne Fouilloux
 - **Lesson Topic**: NetworkX python package
 - [![License: CC BY 4.0](https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)


# Minutes of the studyGroup@UiO demo session 

**When**: 21st September 2018, 14:00-16:00

### Dataset used for this lesson

We will be using example datasets from [Easy Linavis](https://ezlinavis.dracor.org/) (Easy Literary Network Analysis and Visualization). 
On this website, examples can be found in the tab "examples".

Easy Linavis (ezlinavis) generates CSV files with network data from simple segmentations of dramatic texts. 
In the left column, you can list segments (chapters, acts, scenes, etc.) and characters appearing or speaking in a given segment. 
Segments are indicated with a hashtag and they can be hierarchical, e.g.:
~~~
# First Act
## First Scene
Character 1
Character 2
~~~
{: .language-python}

This will automatically generate a CSV file with node-node relations (source, type, target, weight) in the column in the centre. Data changes as you type: 
as soon as you change something in the first column, the mid-column changes accordingly. The "type" column in the CSV file is always "undirected" here, 
but we inserted it so you can directly work with the CSV files in Gephi. The network graph in the right column is also generated live, using a 
spring-embedded layout, just to give you a first impression of what your network data looks like. To make it easier to understand how ezlinavis works, we provide some example files which can be accessed via the corresponding drop-down menu in the right upper corner.
ezlinavis was developed in 2017 by Carsten Milling and Frank Fischer, using the React and Sigma JS libraries. It is mainly meant for didactic purposes 
(we are mainly resorting to it in our workshops on the network analysis of literary texts), although in principle it is also suited to handle bigger network 
data. If you want to contact us, please drop a line to ffischer(at)hse.ru.

### Other datasets and information

- [https://textology.hypotheses.org/37](https://textology.hypotheses.org/37)
- [https://github.com/arockenberger/InnsbruckEasterplay](https://github.com/arockenberger/InnsbruckEasterplay)
- [Complex Netowkr Analysis in Python](https://pragprog.com/book/dzcnapy/complex-network-analysis-in-python): based on NetworkX but version 1.X 
and not the new version 2.X. Information on how to migrate from 1.X to 2.X can be found at
 [https://networkx.github.io/documentation/stable/release/migration_guide_from_1.x_to_2.0.html](https://networkx.github.io/documentation/stable/release/migration_guide_from_1.x_to_2.0.html).

### Other tools

Another tool that is freely available [https://gephi.org/](https://gephi.org/). It is a very handy tools for creating nice network plots. To use it, 
download one file from Easy Linavis (as a csv file) and use it in Gephi.


### Codes used for the demo

Annika has prepared several jupyter notebooks:

- [https://github.com/arockenberger/InnsbruckEasterplay/blob/master/CNA_tests.ipynb](https://github.com/arockenberger/InnsbruckEasterplay/blob/master/CNA_tests.ipynb)

**Facts**:

- no weight by default (need to ask NetworkX to compute them)
- not directional by default; use DiGraph() and/or MultiGraph() for directional networks.

In all the examples, csv python package is used.

- csv.reader() --> add information on how to skip header

- if you remove a node, it does not removes all the connections; you end up having selfloop node. So you need to clean it.
--> have a look on how to remove connection.

#### Examples


- Add an example with several columns. Choose 2 columns.
- https://github.com/arockenberger/NB_API_Python For visualization
- nbtext library --> will be released so we can use it for plotting.
- Make an example to plot with WordCloud.

### AOB

We also discuss on how to write a blog: [https://hypotheses.org/](https://hypotheses.org/)



- Add info on where to buy domain (not take the cheapest one).





