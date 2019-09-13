---
layout: page
title: instructor development
text: first installment of a monthly instructor development session
link: https://github.com/uio-carpentry/studyGroup/issues/15
visible: true
tags:
  # languages
  - misc
  # levels
  - all
---

<!-- change visible to true if you want it on the site -->
<!-- remove any tags listed above that are not relevant -->

 - **Leader**: Karin Lagesen
 - **Participants**: Anne Fouilloux, Annika Rockenberger, Eve Zeyl Fiskebeck, Eszter Agnes Papp
 - **Notes**: Annika Rockenberger
 - **Lesson Topic**: instructor development
 - [![License: CC BY 4.0](https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)


# Notes from Session 1 - Sep 12, 2019

We are going through the [Programming in Python](http://swcarpentry.github.io/python-novice-inflammation/index.html) lesson from the Software Carpentry core lessons to identify parts that will get the learners stuck or need extra explanation. We also discuss which parts could be skipped or omitted entirely.

## Python - 1 episode [Analysing Patient Data](http://swcarpentry.github.io/python-novice-inflammation/01-numpy/index.html)

- check for correct Python version with print statement - use sticky notes

- explaining numpy can cause confusion
- loadtxt can create issues
  - spelling wrong
  - learner in wrong directory
  - installation guide information overflow
  - alternatives to using numpy for the import?
- explain data types --- clarify "expectations" for Python when dealing with variables
- Indexes
  - where are []
  - why do we start from 0 not 1
  - TASK for next instructor dev lesson: where to find character map on different OS (on screen keyboard)
- Slicing
  - could be skipped or omitted (keep up until "tripledata")
- Numpy functions min / max / std
  - usually create positive feedback in learners
- Axes
  - which axis is 0 and which is 1
  - refer to "this is convention in Python" to not confuse learners
- Matplotlib
  - spelling can cause issues
  - plot might have a different colour depending on version of Matplotlib
  - reasoning behind the data and the plots is confusing (inflammation data)
  - perhaps change data to something more relatable?
  - making subplots in a row: use copy-and-paste with Etherpad to avoid lots of typing and spelling issues
- Exercises
  - instead of at the end of the episode, weave them in where they belong
  - chose a couple, not all (too time consuming)
  - perhaps make use of Mentimeter, Sokrativ, Kahoot or use screenshot on GooglePresentations and discuss in class
  - TASK: share Sokrativ or similar within the Carpentry@UiO community to avoid double work; create exercise corpus
  - libraries (numpy) --- call up documentation to have as reference for learners
  - pick and chose exercises that fit the learning objectives and address typical learner misconceptions and mistakes
