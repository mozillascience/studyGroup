---
layout: page
title: Contributing to UofT Coders
---
Welcome to the Contributing guideline for UofT Coders. Thanks for taking the time to contribute! 

The following is a set of guidelines for contributing to the UofT Coders community, whether it be by teaching a lesson, fixing the website, helping to plan and organize our various events, or taking on a leadership role.

### Table of Contents

1. [About UofT Coders](#about-uoft-coders)
    - [Code of Conduct](#code-of-conduct)

2. [How You Can Contribute](#how-you-can-contribute)
    - [Leading a Lesson](#leading-a-lesson)
        - [Creating the Content](#creating-the-content)
        - [Teaching in Class](#teaching-in-class)
    - [Fixing and Updating the Website](#fixing-and-updating-the-website)
    - [Other Ways to Get Involved](#other-ways-to-get-involved)

-----
# About UofT Coders

UofT Coders was formed to share and learn about coding techniques and
best practices for computing and analysis in research. We hold weekly sessions
in the format of code-alongs, coworking sessions or journal clubs/discussions.
To see our previous and upcoming events, you can visit our [Events repo](https://github.com/UofTCoders/Events/issues) or [website](https://uoftcoders.github.io/studyGroup/#events).
To learn more about our group, you can read our [constitution](https://github.com/UofTCoders/council/blob/master/Constitution.md).

## Code of Conduct

We adhere to a [Code of Conduct](https://github.com/UofTCoders/studyGroup/blob/gh-pages/codeOfConduct.md)
and by participating, you agree to also uphold this code. Please report any 
unacceptable behaviour to uoftcoders@gmail.com. If you feel that a member of 
the executive team has been violating the Code of Conduct, please email 
groups.officer@utoronto.ca to report.

-----
# How You Can Contribute

## Leading a Lesson

The Mozilla Study Group
handbook [**here**](https://mozillascience.github.io/studyGroupHandbook/lessons.html#reuse)
and [**here**](https://mozillascience.github.io/studyGroupHandbook/event-types.html#workalong)
has several very good points about making a lesson. This section summarizes bits
of the handbook, but also adds pieces that are missing from it. Check out the
[lesson bank too](https://github.com/mozillascience/studyGroupLessons/issues).

### Creating the Content

+ **Minimal use of slides**: The most effective sessions are ones that are very
hands-on. We strongly encourage [*live-coding*](#more-on-live-coding) as a 
teaching method; it's best to keep slides to a minimum or avoid them completely.
+ **Keep in mind beginners**: Make few assumptions about the knowledge of the audience,
unless specified that this is an intermediate level lesson, requiring prior knowledge.
Keep it simple. Don't attempt to cover too much material in a single session.
+ **Use Built-in Datasets**: Use built-in sample datasets instead of requiring
attendees to download files. 
+ **Code Review**: The lesson code is posted to GitHub along with a pull request to
[UofTCoders/studyGroup](https://github.com/UofTCoders/studyGroup) repository at
least 1 full day prior to the lesson date to allow for review.
See [Submitting a Pull Request](https://uoftcoders.github.io/studyGroup/pull-request/)

#### More on Live-Coding

Live-coding is a hands-on method of teaching coding to a group in which the instructor 
shares their screen with the group and types all commands on their computer while the 
group follows along. Live-coding is a very effective teaching technique: it forces the 
instructor to go slowly and ensures that participants get to try out every command 
being used. It allows learners to experience common errors themselves and debug them 
in a supportive environment, to explore variations on material as they go, and to 
immediately check their understanding by trying things hands-on. 

Live-coding is a technique used by [Software Carpentry](https://software-carpentry.org/about/). 
Software Carpentry has lots of great resources explaining the why and how of live-coding:
+ [10 tips and tricks for instructing and teaching by means of live coding](https://software-carpentry.org/blog/2016/04/tips-tricks-live-coding.html)
+ The Software Carpentry [instructor training manual](http://carpentries.github.io/instructor-training/) 
includes many resources about programming education.

To see live-coding in action in the UofT Coders group, watch a portion of the 
[Intro to R livestream](https://www.youtube.com/watch?v=b74V54VFL98) taught by 
[Ahmed](https://github.com/aays), or look over the code that was covered in an 
[R lesson](https://github.com/UofTCoders/studyGroup/blob/gh-pages/lessons/r/intro/Intro_R_Sept21.R) 
created by [Luke](https://github.com/lwjohnst86). 

### Teaching in Class

+ **Arrive early**: Come 10 minutes before the lesson starts to set up.
+ **Introduce yourself**: Start by introducing yourself and perhaps why you're teaching this lesson.
+ **Stay on time**: Keep mindful of the time, lessons are 50-60 minutes long.
+ **Start from the very beginning**: Briefly explain all aspects of the what you are doing when live-coding including:
    - show how to open the program or IDE (e.g. RStudio/Jupyter Notebook/Shell or Terminal/etc)
    - how to run code (e.g. press `Shift+Enter` in the Jupyter Notebook)
    - if this is an intro lesson, explain the concept of an IDE or shell
    - importing modules and packages such as  `import numpy as np` or `library(dplyr)`

+ **Live-coding**: Use of slides is minimal, majority of lesson involves writing the code WITH the audience during the lesson
+ **Stay on topic**: There is only one hour, if a question arises that is off-topic, you can always suggest discussing afterwards.
+ **Check in with participants**: We distribute coloured sticky notes to each 
participant so that they can flag problems with one colour and success with 
another colour. Use these indicators to stay aware of your pacing and where the group is at, 
and/or verbally ask how everyone is doing and leave time for questions.

-----

## Fixing and updating the website

There are two ways of fixing or adding to the website, either by:

- Creating an [Issue](https://github.com/UofTCoders/studyGroup/issues/new)
describing the problem or enhancement. This is technically not doing anything
yourself, just recommending something to be done.
- Submitting a Pull Request from a clone of this repo. This way takes a bit more work and requires knowledge of Git and likely HTML. But we
 would appreciate any help! No harm in giving it a try! That's a beauty of using Git, it's hard to mess up and break something.

If you want to view the website before submitting a Pull Request to make sure
your changes are as you expect, you'll need to:

- Install Jekyll by following these [instructions](https://help.github.com/articles/setting-up-your-github-pages-site-locally-with-jekyll/).
- To build the site locally, run `jekyll serve`.
- The built site can also be viewed at your forked version
(`https:://yourusername.github.io/studyGroup`).

----

## Other Ways to Get Involved

### Helping Out at Our Events

We hold various sessions that incorporate code-alongs, and having the help of more advanced users to help out the beginners is very much appreciated.
- If you see a session topic that is more beginner than your current level, we highly encourage you to attend anyway and help answer questions or provide more one-on-one support during lessons.
- You can also lend a hand at our co-working sessions to people who have come to work on their own projects.
- We do a call for helpers for all our Software Carpentry workshops, and we definitely wouldn't be able to run these without the help of volunteers like you!

### Taking On A Leadership Role

The planning and organization of our the group and our various events are done by our executive council. We hold elections every April to elect the executive council members, however, we are always open to suggestions on new roles and positions for interested members of the UofT Coders community who wish to take on more a leadership role. To read more about these positions, please see our [Council Roles](https://github.com/UofTCoders/council/blob/master/Council_Roles.md) document.
