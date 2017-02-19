---
layout: page
title: 'Introduction to Databases and SQL'
visible: true
tags:
  - misc
  - beginner
---

- **Authors**: Ian Dennis Miller
- **Research field**: Social Psychology - Social Complexity
- **Lesson topic**: Databases and SQL
- **Lesson content URL**: <https://github.com/UofTCoders/studyGroup/tree/gh-pages/lessons/misc/sql-intro>

## Presentation

<https://iandennismiller.github.io/databases-sql>

- covers data, databases, and sql
- contains javascript for some exercises

## Notebooks

The following Jupyter notebooks contain a R and Python examples:

- [r-sql.ipynb](../r-sql.ipynb)
- [python-sql.ipynb](../python-sql.ipynb)

These can be run locally:

    make r-notebook
    make python-notebook

## Requirements

To follow along with the lesson, you will need a several R and Python libraries.  If you don't have R, Python, and sqlite3, see [Basic System Requirements](#basic-system-requirements).  For Python, consider creating a virtualenv for your workspace.

Now you are ready to install the required R and Python libraries.  Inspect and run the following files:

    pip install -r requirements/requirements.txt
    R --no-save < requirements/requirements.R

You can also automatically install requirements on Mac and Linux:

    make requirements

## Basic System Requirements

This lesson makes use of the following:

- Python (Jupyter)
- R (IRkernel for Jupyter)
- sqlite3

### Mac

MacOS already has Python and probably sqlite3 as well.  You need R.

    brew install R

### Linux

You need R.  Try `apt`, `yum`, or whatever:

    apt-get install r-base
    yum install R

You may need to install sqlite3.  You can test by running:

    which sqlite3

If it returns nothing, then it is not currently installed.  Try `apt`, `yum`, or whatever:

    apt-get install sqlite3 libsqlite3-dev
    yum install sqlite sqlite-devel

### Windows

You need Python, R, sqlite3, and maybe other things like a C compiler.  These links will get you started:

- https://cran.r-project.org/bin/windows/base/
- https://www.rstudio.com/products/rstudio/download/
- https://www.python.org/downloads/windows/
- https://sqlite.org/download.html
