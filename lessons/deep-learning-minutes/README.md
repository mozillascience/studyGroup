---
layout: page
title: work along session on deep learning
text: 
link: https://github.com/uio-carpentry/studyGroup/issues/8
visible: true
tags:
  # languages
  - python
  - r
  # levels
  - intermediate
---

<!-- change visible to true if you want it on the site -->
<!-- remove any tags listed above that are not relevant -->

 - **Leader**: Ana Costa
 - **Lesson Topic**:  Deep learning with R and python
 - [![License: CC BY 4.0](https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)


# Minutes of the studyGroup@UiO work along session

**When**: 19th October 2018, 14:00-16:00

### Setup

#### Setup for R

The following packages need to be install for this work along session:

~~~
install.packages("devtools")
install.packages("neuralnet")
install.packages("GGally")
install.packages("tidyverse")
install.packages("car")
install.packages("curl")
install.packages("tensorflow")
~~~
{: .language-r}


For using `tensorflow`, you also need an additional step to initialize it:

~~~
library(tensorflow)
install_tensorflow(method = "auto")   # if not installed before
~~~
{: .language-r}

-  To test tensorflow installation

~~~
sess = tf$Session()
hello <- tf$constant("Hello, Tensorflow!")
sess$run(hello)
~~~
{: .language-r}

#### Setup for python 3

The following python packages will be used for this work along session:

~~~
numpy
pandas
matplotlib
scikit-learn
tensorflow
~~~
{: .language-python}


### neuralnet with R

See jupyter notebook with [neuralnet example](https://github.com/anacost/neuralRPy/blob/master/neuralnet_sensitivity_met_data.ipynb).

### Tensorflow with python

See jupyter notebook with [tensorflow in python](https://github.com/anacost/neuralRPy/blob/master/tensorflowPy.ipynb).

### Other materials

- [A Beginner's Guide to Neural Networks and Deep Learning](https://skymind.ai/wiki/neural-network)
