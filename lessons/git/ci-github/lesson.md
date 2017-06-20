---
layout: page
title: Continuous integration on GitHub
visible: true
tags:
  # languages
  - git
  # levels
  - intermediate
---

 - **Authors**: Luke Johnston ([@lwjohnst86](https://github.com/lwjohnst86))
 - **Research field**: Diabetes epidemiology
 - **Lesson topic**: Using continuous integration within GitHub
 - **Lesson content URL**: <https://github.com/UofTCoders/studyGroup/tree/gh-pages/lessons/git/ci-github>

## What is Continuous Integration (CI)?

[CI](https://en.wikipedia.org/wiki/Continuous_integration) historically is a
system/workflow/practice of merging a codebase that developers work on
individually into a main stream, usually several times a day. This ensures that
there are few to no conflicts within the code base. However, CI presently is
often used in the context of automated builds of a git repository to ensure that
everything runs/tests/builds as expected in a clean, new environment (aka on a
server). For this reason, I will only refer to CI in the context of git repos.

Automated CI services are available on GitHub through [Travis CI](https://travis-ci.org/).
Travis is a service independent (as a company) of GitHub, however they currently
only work with GitHub. There is the `.org` version of Travis for public GitHub
repos and a `.com` version for private repos. There are other CI's available on
GitLab or BitBucket (services similar to GitHub). Through Travis, you can get
your git repo and associated code/files/documents (really, any thing that is
command based, including things such as pandoc, rmarkdown, or website build tools)
to be built, tested, or whatever else you want it to do!

The main use of CI is for automated testing of your code in a separate environment,
to ensure that any new additions to the code don't cause any breaks or conflicts.
Other common uses are to build websites that first require code or documents to
be generated before pushing to the live website.

## Why should you use it?

There are [many reasons](https://about.gitlab.com/2015/02/03/7-reasons-why-you-should-be-using-ci/)
to use CI, especially if your codebase is large and complex, when multiple people 
work on the code, when it is relied on by others, or if it is for production
(industry or commercial) purposes. If your code is small or simple or a one-time 
thing, it is often not necessary to use CI. BUT! Using CI will make sure that your 
code is robust and more likely to be accurate and correct... which is especially
important in most if not all scientific fields.

## Travis and the `.travis.yml` file

As I mentioned, you use Travis for GitHub. In order to use Travis, you need to
sign up and follow the [getting started](https://docs.travis-ci.com/user/getting-started/)
steps. Travis has many supported [languages](https://docs.travis-ci.com/),
including [R](https://docs.travis-ci.com/user/languages/r/) and 
[Python](https://docs.travis-ci.com/user/languages/python/). 

The two main things you need for Travis are to include a `.travis.yml` file in
your GitHub repo and link Travis to it via the [Travis website](https://travis-ci.org/).

### Example R `.travis.yml` file

```
language: r
cache: packages # to reduce the build time for dependent packages
r:
    - release
    - devel
script:
    # If building packages
    - R CMD build .
    - R CMD check *.tar.gz
    # If running from an R or shell file
    - Rscript test.R
    # or:
    - sh ./deploy.sh
```

Package dependencies are by default searched for in the 
[`DESCRIPTION`](http://r-pkgs.had.co.nz/description.html) file. Otherwise,
specific packages can be installed by including this in the `.travis.yml` file:

```
r_packages:
    - "packagename"
```

If you are creating packages and want to use Travis to test your packages, use
the R command `devtools::use_travis()` to get you started.

Building websites via R Markdown is relatively straight forward. You first need
to create a `deploy.sh` file of some sort (see 
[this file](https://github.com/codeasmanuscript/rworkshops/blob/master/deploy.sh) as
an example) and include Travis commands to push to a `gh-pages` branch (see
[this file](https://github.com/codeasmanuscript/rworkshops/blob/master/.travis.yml) as
an example). For a more detailed example and walkthrough, see 
[this Gist](https://gist.github.com/willprice/e07efd73fb7f13f917ea.html).

### Example Python `.travis.yml` file

```
language: python
python:
    - "3.6"
# install dependencies
install:
    - pip install -r requirements.txt # if you put your dependencies in a file
script: pytest
```

I am not nearly as familiar with Python, however, the same things that apply to R
also apply to Python. You need to install dependencies and use the `script` option
to specific what commands or file to run.

## Lesson flow and other remarks

In the live version of the lesson, I'll cover simple examples of using Travis
for R and Python. Since I am more familiar with R, I'll be covering R examples
in more detail. In general, the lesson will go over setting up Travis, creating
the `.travis.yml` file, getting Travis to run, and seeing the results for the 
CI build.

There are so many things you can do with Travis (or any CI for that matter)! 
Simple reasons are pretty straight forward, though there is a learning curve. 
More complex uses are, well, more complex to set up. In the end, setting up Travis/CI
can save you time and reduce your workload as it automates many of the repetitive 
tasks you many do when creating code or code-dependent documents.
