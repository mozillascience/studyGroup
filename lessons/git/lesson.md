---
layout: page
title: 'Intro to Git'
visible: true
---

# (Brief) Introduction to Git + GitHub #

 - **Authors**: Luke Johnston
 - **Research field**: Nutritional and diabetes epidemiology
 - **Lesson topic**: Version control (Git)
 - **Lesson content URL**: <https://github.com/UofTCoders/studyGroup/tree/gh-pages/lessons/git>

## Preface: ##

Version control is a system that manages changes to a file or files.
These changes are kept as logs in a history, with detailed information
on what file(s) was changed, what was changed within the file, who
changed it, and a message on why the change was made.  This is
extremely useful, especially when working in teams or for yourself 6
months in the future (because you *will* forget things)!

To understand how incredibly powerful version control is, think about
these questions: How many files of different versions of a manuscript
or thesis do you have laying around after getting feedback from your
supervisor or co-authors? Have you ever wanted to experiment with your
code or your manuscript and need to make a new file so that the
original is not touched? Have you ever deleted something and wish you
hadn't? Have you ever forgotten what you were doing on a project?  All
these problems are fixed by using version control (git)!

We are going to go over a typical GitHub/collaborative workflow.  This
workflow doesn't have to be collaborative, it could also be a solo
workflow too!  Minus the Pull Requests, though.

## Checklist: ##

* Configure your git
* Fork the `sandbox` repo (via @UofTCoders)
* Clone your fork down into your computer
* Check the log and status
* Create a new file (your bio)
* Add that file to the 'staging' area
* Commit the file in the 'staging' area into the history
* Push your changes up
* Submit a Pull Request (have it rejected/asked for clarification)
* Revise the file and check the differences
* Add + commit to the history
* Push, have pull request accepted
* Update your cloned and forked repo from the upstream (original)

**Tips**:

* Make use of TAB-completion in the terminal!
* Up arrow on the terminal goes to the previous command you entered.

## Lesson topics and commands ##

For configuring your git, follow the "Initial setup" I've put
together:

* http://codeasmanuscript.org/lessons/git/cheatsheet/

Then, fork @UofTCoders's repository into your own GitHub
account. Afterwards do these commands:

    cd ~/Desktop
    git clone https://github.com/your-account-name/sandbox.git
    cd sandbox
    ls
    git log
    git status
    cd bios
    touch your-name-bio.txt

Open the bio.txt file and add:

* Your name
* Your program and year
* Your progamming language/statistical language of choice

Then:

    git add your-name-bio.txt
    git commit -m "Added my bio"
    git push

Submit a "Pull request".  Pretend like I asked you to also include
types of analyses you do.  Revise your file to include:

* Main/predominate types of analyses you do

Then:

    ## <- this is a comment
    git status  ## See that the file has been modified
    git diff your-name-bio.txt ## View the differences
    git commit -am "Edited bio to include types of analyses"
    git log ## See your commits
    git push

The Pull Request should already be updated after pushing.  I'll accept
some of the Pull Requests, then you need to update your local and
forked versions to match the master version:

    git remote add upstream https://github.com/UofTCoders/sandbox.git
    git pull upstream master
    git push

Now you know about a typical workflow!  There are **lots** of commands
and options in git, you really can do almost anything.  If you have
any questions, please check out
[StackOverflow](http://stackoverflow.com/questions/tagged/git) for
*literally* any question on or about Git!!

# Resources:

Here are a few great resources (excluding StackOverflow) to use if you
ever need help:

* [Hands-on tutorial, with web-based terminal](https://try.github.io/levels/1/challenges/1)
* [Official git documentation](https://git-scm.com/doc)
* [Simpler first-steps guide](http://rogerdudler.github.io/git-guide/)
* [Reference pages for all git commands](http://gitref.org/)

