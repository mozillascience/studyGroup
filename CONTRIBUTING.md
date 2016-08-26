---
layout: page
title: Contributing to UofTCoders
---

## Running a lesson

### Making the lesson

The Mozilla Science Study Group
handbook [**here**](https://mozillascience.github.io/studyGroupHandbook/lessons.html#reuse)
and [**here**](http://mozillascience.github.io/studyGroupHandbook/event-types.html#workalong)
has several very good points about making a lesson. This section summarizes bits
of the handbook, but also adds pieces that are missing from it.

From the handbook:

- **Keep it short and simple**
- **Keep in mind the beginners**
- **Don't use slides and focus on writing the code**

Expanding on this are other things to keep in mind.

**Data**: External data *should not be used* unless it is absolutely necessary. 
Instead, rely on built-in or sample datasets provided by the respective 
programming language or package.

**Code**: This is the main thing that should be emphasized. How the code is
used, it's specific applications, and it's meaning should be the entire focus of
the lesson. Here are some tips:

- Keep the code as *simple* as possible while still covering the concept. The
session is, after all, only one hour.
- When making the code, make *no or few assumptions* about the knowledge of the
audience.
- Keep the code *generalizable*. Our members come from diverse fields of
research. What we share is the need to code.

Lessons should be submitted as a Pull Request at least *one full day* before the
session. Submitting the lessons as a Pull Request is also a great way to find
out whether your lesson matches what is advertised in the Events repo.

### Giving the lesson

A few tips:

- Start from the *very beginning*. Open the program or IDE (RStudio/Jupyter/etc)
with everyone else and show how to do it.
- Make *no assumptions* about what the audience knows. Let them know what keys
you are using to run a particular piece of code (Ctrl-Enter for
Jupyter/RStudio/etc).
- Write the code *with the audience*. Start from an empty file and write the
code you planned. This forces you to slow down and allows the audience to follow
along much better. If need be, print off the code you wanted to go through to
have the paper beside you.
- Stay *on-topic*. There is only one hour. If an question arises that is
off-topic, say simply that you can talk about that later.

-----

## Fixing and updating the website

There are two ways of fixing or adding to the website, either by:

- Creating an [Issue](https://github.com/UofTCoders/studyGroup/issues/new)
describing the problem or enhancement. This is technically not doing anything
yourself, just recommending something to be done.
- Submitting a Pull Request from a clone of this repo. This way takes a bit more
work and requires knowledge of Git and likely HTML. But we would appreciate any
help! No harm in giving it a try! That's a beauty of using Git, it's hard to
mess up and break something.

If you want to view the website before submitting a Pull Request to make sure
your changes are as you expect, you'll need to:

- Install Jekyll by following these [instructions](https://help.github.com/articles/setting-up-your-github-pages-site-locally-with-jekyll/).
- To build the site locally, run `jekyll serve`.

