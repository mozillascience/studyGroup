# Creating Packages in Python

- Presenter: John Ladan
- Sources: Elise Olson, [The Hitchhiker's Guide to Packaging](http://the-hitchhikers-guide-to-packaging.readthedocs.org/en/latest/quickstart.html), [*Bill Mills*](https://github.com/BillMills/pythonPackageLesson)
- Research Field: any
- Topic: A quick introduction to creating packages in Python

## Why are we doing this?

One of the most powerful things about coding for the sciences is that it costs
nothing to re-use code we've written in the past, allowing us to build on
past work rather than starting over every project or paper.

However, one practice we see again and again is copying and pasting code from one project into another. Sometimes it will just be a function, other times (*cough*MATLAB*cough*) it's files.

Assembling
code in packages makes it really easy to re-use old code: all the scripts and functions end up in a central location and can be called and imported from anywhere on the computer -
just like the famous packages numpy or matplotlib.

## Setting up

In this tutorial, we'll walk through the creation of a simple package from some code that's just lying around. You can view and clone the [TODO demo package](). For an unpackaged state, checkout the `TODO` tag.

## 1. The basics

The most basic directory structure for a Python package looks like this:

```
project
|
|__ setup.py
|
|__ myPackage
     |
     |__ somePython.py
     |__ __init__.py
```

But at the moment, we've just got some flat files.

```
project
|
|__ norms.py
|__ mse.py
```

So, the first step is to move files around.

XXX Add the procedure for adding files.


Now, mse.py is actually a script that we can execute from the command line, so create a directory `bin`, and put it there. *The name `bin` short for 'binary file' - a convention pulled from posix: the standalone programs were binaries.*

## 2. setup.py

At this point, the library can be imported if we're in the same directory, but it isn't a package. To let setuptools and `pip` know how to handle it, we need to add the `setup.py` file.

XXX Dummy setup.py file with explanations of the different lines

## 3. Document!

## 4. Tests

## 5. Installing

Distributing in a git repo, XXX can use versions and tags???
