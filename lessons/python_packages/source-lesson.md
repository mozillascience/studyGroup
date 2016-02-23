# Creating Packages in Python

- Presenter: John Ladan
- Sources: Elise Olson, [The Hitchhiker's Guide to Packaging](http://the-hitchhikers-guide-to-packaging.readthedocs.org/en/latest/quickstart.html), [Bill Mills](https://github.com/BillMills/pythonPackageLesson)
- Research Field: any
- Topic: A quick introduction to creating packages in Python

## Why are we doing this?

One of the most powerful things about coding for the sciences is that it costs us nothing to re-use code we've written in the past, allowing us to build on our past work rather than starting over every project or paper. Assembling our code in packages makes it really easy to re-use old code - when we're done, we'll be able to access all our hard work with a single import command, just like famous packages like numpy or matplotlib.

## Getting Set Up

This tutorial will walk you through a [demo Python package](https://github.com/BillMills/python-package-example), and explain all the details you'll need to know to create your own package. The demo is fully functional, so you can even use it as a template for your own packages.

We'll build up our own package in the lesson, but you can refer to the demo linked above for an example at any time.

## 1. The Basics

The basic directory structure for the simplest Python package looks like this:

```
project
|
|
|__ myPackage
|     |
|     |__ somePython.py
|     |__ __init__.py
|
|__ tests
      |__ test.py
```

Start by making those directories and empty files (note that there are two underscores before and after `init` in `__init__.py`). Once you have those, place your python functions and classes that you'd like to reuse in `somePython.py`:

```
import numpy

def fahrToKelv(temp):
    '''
    takes a temperature `temp` in fahrenheit and returns it in Kelvin
    '''

    kelvin = 5./9. * (temp - 32.) + 273.15

    return kelvin
``` 

import your python modules (you can have as many as you like) in `__init__.py`:

```
from . import somePython
```

and of course, always, always write a test for every function you create in `test.py`:

```
from myPackage import somePython

def test_fahrToKelv():
    '''
    make sure freezing is calculated correctly
    '''
    
    assert somePython.fahrToKelv(32) == 273.15, 'incorrect freezing point!'
```

You may already have examples of python code and tests you've written previously; these are no different, but just arranged tidily in a standard way. Now we can get down to the business of actually packaging things up.

## 2. Licensing

Packaging code is all about reuse and sharing - and in order to retain credit for your hard work and help everyone understand how and when they're allowed to reuse your work, you need a license. Note that not having a license at all does NOT mean anyone can do anything they want! Unlicensed code lives in a murky, ambiguous legal grey area, and should be avoided like the plague.

There are [numerous open source licenses](http://opensource.org/licenses/) out there; feel free to choose whichever one you like, but **don't write your own**, unless you are a lawyer; the licenses linked above have been carefully crafted by lawyers to protect your rights.

If you're not sure which license to choose, choose [MIT](http://opensource.org/licenses/MIT). The MIT license boils down to letting anyone use your code in any way they like, as long as they cite your copyright as the original author.

Whichever license you choose, cut and paste the **full** text of the license into a file called LICENSE.txt in the top directory of your project (`project` in the example above), and fill in your name and the date on the copyright line.

## 3. Describing Your Package

Your package is described in one file called `setup.py`, in the top directory of your package. Copy this example into your own `setup.py`, and change all the fields to suit; explanations are in the table below.

```
from setuptools import setup, find_packages

setup(
    name='python-package-example',
    version='0.1',
    packages=find_packages(exclude=['tests*']),
    license='MIT',
    description='An example python package',
    long_description=open('README.md').read(),
    install_requires=['numpy'],
    url='https://github.com/BillMills/python-package-example',
    author='Bill Mills',
    author_email='myemail@example.com'
)
```

This table contains descriptions of the parameters you may consider changing; others can be left as is.

Parameter | Comments
----------|---------
name      | the name package managers will use for your project, like `numpy` or `matplotlib`
version   | the current version number of your project; see [pep440](https://www.python.org/dev/peps/pep-0440/) for an explanation of how to choose these.
license   | name of the license you chose
description | A one sentence description of your package.
install_requires | A list of all the other packages this package depends on; package managers will install these automatically as needed
url | The website or repo for this package.
author | That's you!
author_email | An email where you or your team can be reached.

The `setup.py` file is the machine-readable description of your project; for humans, there's README.txt, at the top level of your project. Put anything in here that you like to describe what your project is, how to use it, and how to contribute to it.

## 4. Extra Data

If you need to include some data files with your package, you'll need to write a MANIFEST.in file at the top level of your project. First, put your data files in a `packageData` directory under `myPackage`; your project should now look something like this:

```
project
|
|
|__ myPackage
|     |
|     |__ packageData
|     |     |
|     |     |__ myData.dat
|     |__ somePython.py
|     |__ __init__.py
|
|__ tests
|     |__ test.py
|
|__ setup.py
|
|__ LICENSE.md
|
|__ MANIFEST.in
|
|__ README.md
```

where your data is in `myData.dat`; again, you can have as many of these files as you like. For each data file, include a line in `MANIFEST.in` that gives the path to the file you want to include:

```
include myPackage/packageData/myData.dat
```

All the files listed like this in `MANIFEST.in` will be included with your package when others install it.

## 5. Wrap It Up & Ship It

That's it, you're good to go! If everything is in place, run

```
python setup.py sdist
```

and Python will wrap your package up in a new `dist`(ribution) folder.

### Distributing on GitHub

For the git inclined, add everything in the above diagram plus the new `dist` directory to a git repository initialized in the top level directory (`project`), and push it to GitHub. Now, anyone in the world can install your package with (remember to replace `yourName` with your GitHub user name and `repoName` with the name of the repo on GitHub you pushed to):

```
sudo pip install git+git://github.com/yourName/repoName.git#egg=repoName
``` 

### Distributing on PyPI

Distributing on PyPI is simpler than on Git, but you'll have to maintain the package in two places if you intend on collaborating on development on GitHub and distributing through PyPI. To get set up on PyPI for the first time with a new package, [make a new account on PyPI](https://pypi.python.org/pypi), and then back in your `package` directory do

```
python setup.py register
```

to claim your package name - they must be unique. Then, upload your package; you'll do this every time you want to release a new version of your code:

```
python setup.py sdist upload
```

Now, you and anyone else in the world can install your package using the following:

```
sudo pip install your-package-name
```

## 6. Try out the Example

You can install the demo package as described above, by running:

```
sudo pip install git+git://github.com/billmills/python-package-example.git#egg=python-package-example
```

or from PyPI:

```
sudo pip install python-package-example
```

This demo package contains the same code illustrated in the examples above. After installing, try running the following script:

```
import myPackage

print myPackage.somePython.fahrToKelv(32)
```

with that single `import` statement, we (and all of our friends) are able to use the `fahrToKelv` function we wrote and tested in the past. There's no limit to how many functions and ideas you can pack into a package like this; just keep adding functions to `somePython.py` (and test them in `test.py`!), or adding more python files alongside `somePython.py` (remembering to include them in `__init__.py`), or adding more directories alongside `myPackage` following the same pattern, and you can build up as sophisticated a set of tools as you like.




