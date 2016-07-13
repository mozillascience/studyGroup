---
layout: page
title: 'Debugging in Python'
visible: true
---

# Overview of Python

 - **Authors**: John Ladan
 - **Research field**: Physics
 - **Lesson topic**: Introduction to Debugging in Python
 - **Lesson content URL**: <https://github.com/UofTCoders/studyGroup/tree/gh-pages/lessons/python_debugging>

## Preface: ##

Debugging is really an artform. In this tutorial, we'll cover some concepts and tools you can use for debugging, but the skills need time to develop.

The tutorial breaks debugging into three basic steps: testing code, finding bugs, and fixing them. Testing is a large topic on its own -- there's even a [blog/podcast about it](http://pythontesting.net/start-here/). We'll only cover some basics and the [`unittest`](https://docs.python.org/3.5/library/unittest.html) framework, so you may want to check out that blog to learn more.

The bulk of this tutorial is about finding bugs. The only tool required are Python (`pdb` is included) and a text editor. However, I will give a demo using [Spyder](https://github.com/spyder-ide/spyder) to show how an IDE can help. Many other IDEs have the same (or more) features, but Spyder was convenient for me and is FOSS (free as in beer and speach).

Fixing bugs is very code specific, thus not covered in detail.

Sources: [wikipedia](https://en.wikipedia.org/wiki/Debugging)

[Gord Strombola - The Bug](https://www.youtube.com/watch?v=0J4424OxRZo)

## Outline: ##

- What is debugging?
- Hunting for bugs (testing)
    - stack traces
    - unit tests
    - reporting (to OS projects)
- Finding bugs (search)
    - print statements everywhere!
    - using pdb
    - long-term debugging (user warnings)
- Fixing bugs

## What is debugging? ##

Quoting Wikipedia, "Debugging is the process of finding and resolving of defects that prevent correct operation of computer software or a system."
In reality, it is a very large topic with many different methodologies and steps. We're going to focus on finding bugs, and talk a little about prevention.

There are two forms of finding bugs: discovering their existence (testing), and searching for the cause in the code (finding). The debugging cycle typically goes

    test -> find -> fix -> test -> ...

TODO: introduce some code?

## Testing ##

### Interactive testing/debugging (with the shell) ###

### Unit tests ###

### A brief mention of reporting bugs ###

## Finding bugs ##

### Print debugging ###
### Using `pdb` ###

This is the more sophisticated way.
sometimes print debugging is still useful, like in a loop if you don't want to stop every iteration.

### Helping the user ###
This includes providing good error messages and warnings. Perhaps by logging or catching and throwing exeptions.
