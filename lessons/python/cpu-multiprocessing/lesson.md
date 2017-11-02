---
layout: page
title: CPU Multiprocessing in Python
visible: true
tags:
  # languages
  - python

  # levels
  - intermediate
---
<!-- change visible to true if you want it on the site -->
<!-- remove any tags listed above that are not relevant -->

 - **Authors**: Lina
 - **Research field**: Physiology
 - **Lesson topic**: CPU Multiprocessing in Python
 - **Lesson content URL**: <https://github.com/UofTCoders/studyGroup/tree/gh-pages/lessons/python/cpu-multiprocessing>

## Resources:
- Lesson material adapted from [PYMOTW lesson](https://pymotw.com/3/multiprocessing/basics.html)
- [Joblib documentation](https://pythonhosted.org/joblib/parallel.html)
- [Introduction to Parallel/Concurrent Programming in Python](https://code.tutsplus.com/articles/introduction-to-parallel-and-concurrent-programming-in-python--cms-28612)

Making use of multiple CPU cores on your machine can vastly speed up your computing. In Python, it is not technically possible to acheive true parallelism in Python due to the Global Interpretor Lock (GIL), which in Python serializes access to different threads, meaning a single thread in python can never use more than 1 CPU core (see [this](https://en.wikipedia.org/wiki/Global_interpreter_lock) for more information). However, Python has a number of packages that can help with concurrent programming by using multiple concurrent processes instead of multithreading.


In this lesson we will go over the basics of how you might achieve concurrency in Python with brief examples using the following packages:
- multiprocessing
- joblib
- dask.distributed

And of course, while there are many uses for the Python package `threading` which has some high-level control over threads, we will not be going over it in this lesson.
