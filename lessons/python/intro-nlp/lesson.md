---
layout: page
title: Intro to NLP
visible: True
tags:
  # languages
  - python
  # levels
  - intermediate
---
<!-- change visible to true if you want it on the site -->
<!-- remove any tags listed above that are not relevant -->

 - **Authors**: Derek Howard
 - **Research field**: Neuroscience
 - **Lesson topic**: Text processing with NLTK
 - **Lesson content URL**: <link>

 The lesson was uploaded as a Jupyter notebook.

If you want to follow along, make sure you have the correct packages installed and download the associated data for nltk
   - pip install nltk
   - to download only tools/data used in this lesson:

> python -m nltk.downloader stopwords porter_test vader_lexicon tagsets punkt wordnet

   - Alternatively, this will download ~2gb of data, but should ensure all components of nltk work if you're interested in exploring other functionalities of nltk:

> python -m nltk.downloader all

Also save this text as book.txt in a place you can easily access:
https://www.gutenberg.org/cache/epub/3070/pg3070.txt

If you'd like to follow along in Jupyter Notebook, do the following:

   - Install [Jupyter Notebook](https://jupyter.readthedocs.org/en/latest/install.html)
   - Run the notebook by typing `jupyter notebook` into command line.
   - In the web application that opens, navigate to the folder containing the files you downloaded, and open 'intro_NLP.ipynb' to follow along.
   - A pre-rendered version of the notebook may be [viewed here](https://nbviewer.jupyter.org/github/UofTCoders/studyGroup/blob/gh-pages/lessons/python/intro-nlp/intro_NLP.ipynb).
