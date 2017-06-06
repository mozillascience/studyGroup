---
layout: page
title: Machine Learning with scikit-learn
visible: true
tags:
 - python
 - intermediate
---
<!-- change visible to true if you want it on the site -->



# Machine learning in Python

 - **Authors**: Nil Sahin
 - **Research field**: Computational Biology and Molecular Genetics
 - **Lesson topic**: Machine Learning using Python's Sklearn packages
 - **Lesson content URL**: <https://github.com/UofTCoders/studyGroup/tree/gh-pages/lessons/python/scikit-learn>



## Introduction to Machine Learning

"Machine learning gives computers the ability to learn without explicitly programmed." - Arthur Samuel, 1959

Machine learning originated from pattern recognition and computational learning theory in AI. It is the study and construction of algorithms to learn from and make predictions on data through building a model from sample input.



### Some uses of learning algorithms

* Classification: determine which discrete category the example is
* Recognizing patterns: speech recognition, facial identity ...
* Recommender Systems: noisy data, commercial pay-off (e.g., Amazon, Netflix)
* Information retrieval: find documents or images with similar content
* Computer vision: detection, segmentation, depth estimation, optical flow ...
* Robotics: perception, planning ...
* Learning to play games: AlphaGO
* Recognizing anomalies: Unusual sequences of credit card transactions, panic situation at an airport
* Spam filtering, fraud detection: The enemy adapts so we must adapt too



### Types of learning tasks

* **Supervised Learning**: correct output known for each training example for predicting output when given an input vector
	* Classification: 1-of-N output, e.g. object recognition, medical diagnosis
	* Regression: real-valued-output, e.g.predicting market prices, customer ratings

* **Unsupervised Learning**: for learning an internal representation of the input to capture regularities and structure in the data without any labels
	* Clustering: dividing input into groups that are unknown beforehand
	* Dimensionality reduction: extract informative features, e.g. PCA, t-SNE

* **Reinforcement Learning**: perform an action with the goal to maximize payoff by the feedback of reward and punishments, e.g. playing a game against an opponent



### Packages to be installed

* `numpy, pandas, matplotlib, sklearn, scipy, itertools`
* `tpot`: For installation, please refer to [TPOT.](https://rhiever.github.io/tpot/installing/)



### In this tutorial, we will cover:

* Regression (e.g. Linear Regression)
* Classification (e.g. SVM, Logistic regression)
* Clustering (e.g. K-means)
* Dimensionality Reduction (e.g. PCA)
* Sklearn's TPOT package for optimized machine learning pipelines
##### We won't cover:
* Other classification and clustering algorithms (e.g. Neural Networks, Hierarchical Clustering)
* Model selection (such as Bayesian Information Criteria - BIC)
* Hyper-parameter selection



### Useful websites

* [Sklearn](http://scikit-learn.org/stable/modules/classes.html#module-sklearn.linear_model) class and function reference page
* [Machine Learning course](http://www.cs.toronto.edu/~urtasun/courses/CSC411_Fall16/CSC411_Fall16.html) from Computer Science Department, UOFT
* [TPOT](https://rhiever.github.io/tpot/) for optimized machine learning pipelines
* [KERAS](https://keras.io/) package for Neural Networks
* [Tensorflow Playground](http://playground.tensorflow.org/#activation=tanh&batchSize=10&dataset=circle&regDataset=reg-plane&learningRate=0.03&regularizationRate=0&noise=0&networkShape=4,2&seed=0.69754&showTestData=false&discretize=false&percTrainData=50&x=true&y=true&xTimesY=false&xSquared=false&ySquared=false&cosX=false&sinX=false&cosY=false&sinY=false&collectStats=false&problem=classification&initZero=false&hideText=false) for Deep Neural Networks

