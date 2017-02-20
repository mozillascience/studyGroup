---
layout: page
title: Creating Packages in Python
visible: true
tags:
  - python
  - advanced
---

- **Presenter**: John Ladan
- **Sources**: [*Bill Mills*](https://github.com/BillMills/pythonPackageLesson), Elise Olson, [The Hitchhiker's Guide to Packaging](https://the-hitchhikers-guide-to-packaging.readthedocs.org/en/latest/quickstart.html)
- **Research Field**: any
- **Topic**: A quick introduction to creating packages in Python
- **Lesson content URL**: <https://github.com/UofTCoders/studyGroup/tree/gh-pages/lessons/python/packages>


## Why are we doing this?

One of the most powerful things about coding for the sciences is that it costs
nothing to re-use code we've written in the past, allowing us to build on
past work rather than starting over every project or paper.

However, one practice we see again and again is copying and pasting code from one project into another. Sometimes it will just be a function, other times (*cough*MATLAB*cough*) it's files.

Assembling
code in packages makes it really easy to re-use old code: all the scripts and functions end up in a central location and can be called and imported from anywhere on the computer -
just like the famous packages `numpy` or `matplotlib`.

## Setting up

In this tutorial, we'll walk through the creation of a simple package from some code that's just lying around. You can view and clone the [demo package](https://github.com/jladan/package_demo). For an unpackaged state, checkout the `unpackaged` tag.

## 1. The basics

The most basic directory structure for a Python package looks like this:

```
project
|
|__ setup.py
|
|__ myPackage
     |
     |_  somePython.py
     |_  __init__.py
```

But at the moment, we've just got some flat files.

```
project
|
|__ norms.py
|__ metrics.py
```

So, the first step is to move files around. First comes the hardest part: choosing a package name. I'll call mine `measure`. Create a directory with that name, and move the python files in there.

```
project
|
|__ measure
     |__ norms.py
     |__ metrics.py
```

There is one more crucial file: `__init__.py` lets the Python interpreter know that there are importable modules in this directory. This is the script that gets run when you execute `import measure`. For more about what you can do with modules, you can see the (Python docs)[https://docs.python.org/3/tutorial/modules.html]. After adding `__init__.py`, the project directory should be

```
project
|
|__ measure
     |__ __init__.py
     |__ norms.py
     |__ metrics.py
```


## 2. setup.py

At this point, the library can be imported if we're in the same directory, but it isn't a package. To let setuptools and `pip` know how to handle it, we need to add the `setup.py` file.

A very basic version of `setup.py` is

```
from setuptools import setup

setup(
    # Whatever arguments you need/want
)
```

If you were to run that file, you'd get a whole bunch of warnings, and nothing would actually get packaged. As a bare minimum, here is our `setup.py` for it to work.

```
from setuptools import setup

setup(
    # Needed to silence warnings (and to be a worthwhile package)
    name='Measurements',
    url='https://github.com/jladan/package_demo',
    author='John Ladan',
    author_email='jladan@uwaterloo.ca',
    # Needed to actually package something
    packages=['measure'],
    # Needed for dependencies
    install_requires=['numpy'],
    # *strongly* suggested for sharing
    version='0.1',
    # The license can be anything you like
    license='MIT',
    description='An example of a python package from pre-existing code',
    # We will also need a readme eventually (there will be a warning)
    # long_description=open('README.txt').read(),
)
```

## 3. Installing?

Technically, you can install the module by running `python setup.py install`, however it's much more convenient to wrap it all up and distribute online.

### Using git

This is my preferred way of sharing/storing/installing packages. Simply create a git repo of the project directory, and put it somewhere. Then, use `pip` to install it from that repo directly

```
pip install git+https://github.com/jladan/package_demo.git#egg=measurements
```

An advantage of this is that you can also install to particular branches, tags, and commits. A common practice is add a tag for the version release `git tag v0.1`. Users of the library can then lock into that particular version,

```
pip install git+https://github.com/jladan/package_demo.git@v0.1#egg=measurements
```


### Distributing via PyPI

In my opinion, distributing on PyPI is more complicated than with git, and not much more useful.

You'll have to maintain the
package in two places if you intend on collaborating on development on GitHub
and distributing through PyPI.

So why distribute on PyPI? If you're proud of your software and want others to use it, this is the best place. It's more visible, easier for your users, and more tightly controlled. The stricter version control (not just whatever commit to whatever repo like git) makes the software more robust and easier to support as a developing team.

For those interested, to upload to PyPI, you'll need

```
python setup.py sdist
```

This creates a `dist` directory and adds an archive file (a.k.a. a distribution) of your package.


To get set up on PyPI for the first time with a
new package, [make a new account on PyPI](https://pypi.python.org/pypi) (or for trying it out, the [testing PyPI site](https://testpypi.python.org/pypi)), and
then back in your `package` directory do

```
python setup.py register
```

to claim your package name - they must be unique. Then, upload your package; you'll do this every time you want to release a new version of your code:

```
python setup.py sdist upload
```

Now, you and anyone else in the world can install your package using the following:

```
pip install your-package-name
```

## 4. Document!

We've already begun the documentation by adding a short description, author/maintainer name, and version... but there's a lot more to add. At a minimum, a `README` file should be included, but so should a license text, changes between versions, and actual software documentation.

### README

A readme file summarizes the software. For Python packages, this can named `README`, `README.rst`, or `README.txt`. The recommendation is to use [reST]
(http://docutils.sourceforge.net/rst.html), as this is the standard on PyPI

```
===================
Measurements Module
===================

**A demo for how to create a python package from existing code**

The actual software provides L1, L2, Supremum, and Hamming metrics and norms for numpy arrays.
```

### Long Description

Now is a good time to uncomment that `long_description` argument in `setup.py`.

### License

The typical thing is to put the license you choose in `LICENSE.txt`. There are a few choices for licenses, I usually end up using MIT or simple BSD. If you're using github, you can add most standard open source licenses through the website.

**a demo of adding the license file here**

### Changes

Changes between versions are usually tracked in `CHANGES.txt`. This is more of a concern if you're planning to distribute the software.


## 5. Other things to think of

A good package should also include full documentation and testing. I won't cover this here, but unit tests can be performed with the [`unittest`](https://docs.python.org/3.5/library/unittest.html) library, with the tests stored in the directory `tests`. Many people use [Sphinx](http://www.sphinx-doc.org/en/stable/) for documentation, and that can be stored in the `doc` directory.

There's a further step required for distributing. If you want to include these files in the distribution (the archive file in `dist`), you'll need a `MANIFEST.in` file.

```
# MANIFEST.in

include *.txt
recursive-include docs *.rst
```

### Scripts

Suppose you want to include a script that can be executed from the command line. Create a directory `scripts`, and put it there. Next, add the `scripts` argument to `setup.py`

```
setup(
    #...
    scripts = ['scripts/hello.py']
    # ...
)
```

## 6. Where to go from here?

So, at this point, we've got a pretty good project skeleton, and most of the basics are covered. Your package should look something like this:

```
project
|
|__ setup.py
|__ MANIFEST.in
|
|__ measure
|    |__ __init__.py
|    |__ norms.py
|    |__ metrics.py
|
|__ tests
|    |__ test_suite.py
|
|__ doc
|    |__ docs.rst
|
|__ scripts
|    |__ hello.py
|
|__ README.txt
|__ CHANGES.txt
|__ LICENSE.txt
```


If you have software that covers all these points, then congratulations! You're well on your way to a well-maintained software package.

### So where do I actually go?

To get a detailed look at packaging, check out the official [Python docs](https://docs.python.org/3.5/distributing/index.html); they're complete, accessible, and generally more up to date.
