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

Easy Linavis will automatically generate a CSV file with node-node relations (source, type, target, weight) in the column in the centre. Data changes as you type: 
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

Another tool that is freely available [https://gephi.org/](https://gephi.org/). To be fully ffunctional, you need an up to date version of java. Gephi is a very handy tools for creating nice network plots. To use it, 
download one file from Easy Linavis (as a csv file) and use it in Gephi.


### Codes used for the demo

Annika has prepared several jupyter notebooks:

- [https://github.com/arockenberger/InnsbruckEasterplay/blob/master/CNA_tests.ipynb](https://github.com/arockenberger/InnsbruckEasterplay/blob/master/CNA_tests.ipynb)


To make use of NetworkX python package, you need to import it:

~~~
import networkx as nx
~~~
{: .language-python}

We use `nx` as a shortcut to avoid writing networkx everytime we call a function from NetworkX python package.


- To define a new graph, use Graph method:

~~~
G = nx.Graph([("A", "eggs"),])
~~~
{: .language-python}

It defines a new graph with two nodes "A" and "eggs" connected to each other. You need to give a list of connections (one connection is represented by two "nodes").

To print all the nodes:
~~~
print(G.nodes)
~~~
{: .language-python}

To print all the connections:
~~~
print(G.edges)
~~~
{: .language-python}

To add new nodes:

~~~
G.add_node("spinach") # add a single node
G.add_node("Hg") # add a single node by mistake
G.add_nodes_from(["folates", "asparagus", "liver"]) # add a list of nodes
~~~
{: .language-python}

To add a new connection between nodes:

~~~
G.add_edge("spinach", "folates") # add one edge, both ends exist
G.add_edge("spinach", "heating oil") # add one edge 
G.add_edge("liver", "Se") # add one edge, one end does not exist
G.add_edges_from([("folates", "liver"), ("folates", "asparagus")]) # add list of edges
~~~
{: .language-python}


> ## **Tips**:
>
> - no weight by default (need to ask NetworkX to compute them)
> - not directional by default; use DiGraph() and/or MultiGraph() for directional networks.
> - when defining new connections( add_edge or add_edges_from), a new node is created 
>   if it does not exist yet. SO BE CAREFUL WITH THE NAMES OF THE NODES (typos, letter cases, etc.)
>
{: .callout}

To plot a graph with networkx:
~~~
nx.draw(G)
~~~
{: .language-python}

![networkx_plot](../fig/networkx_plot.png)

It plots nodes and associated connections.


- To delete nodes and connections:

~~~
G.remove_node("Hg") # removes this node
G.remove_nodes_from(["Hg",]) # removes a missing node from a list
G.remove_edge("spinach", "heating oil") # removes edge between these nodes
G.remove_edges_from([("spinach", "heating oil"),]) # removes edges from a list
G.remove_node("heating oil") 
~~~
{: .language-python}

> ## Tips
> 
> You get an error if you try to remove a node that does not exist (same with a connection)
> 
{: .callout}

#### Examples

We will now work with "real" examples i.e. read a network from a csv file. 
We are using "Elizabeth Inchbald: Lover's Vows (1798)" from [Easy Linavis](https://ezlinavis.dracor.org/).

To read a csv file, the easiest is to use pandas python package:

~~~
import pandas as pd
df = pd.read_csv("data/Elizabeth1798.csv")
df.head()
~~~
{: .language-python}

~~~
        Source	Type	       Target	     Weight
0	Agatha	Undirected	Amelia	        1
1	Agatha	Undirected	Anhalt	        2
2	Agatha	Undirected	Baron	        1 
3	Agatha	Undirected	Cottager	3
4	Agatha	Undirected	Countryman	1
~~~
{: .output}


The file contains quite a large number of rows so we printed only the first rows (5 first rows) using head().

- To create a Graph from a pandas dataframe:

~~~
# create a graph using Source and Target for connections.
G = nx.from_pandas_edgelist(df, 'Source', 'Target')
nx.draw(G)
~~~
{: .language-python}

![Elizabeth_plot](../fig/elizabeth_plot.png)

`from_pandas_edgelist` takes a pandas dataframe and the two column names used as "Source" and "Target".

See documentation online for more information on [from_pandas_edgelist](https://networkx.github.io/documentation/stable/reference/generated/networkx.convert_matrix.from_pandas_edgelist.html).


- Have a look at Annicka's jupyter notebook at [https://github.com/arockenberger/NB_API_Python](https://github.com/arockenberger/NB_API_Python) for visualization.

### AOB

We also discuss on how to write a blog: [https://hypotheses.org/](https://hypotheses.org/)

- Add info on where to buy domain (do not take the cheapest one).





