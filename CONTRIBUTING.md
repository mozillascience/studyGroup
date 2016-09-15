---
layout: page
title: Contributing to UofTCoders
---

## Running a lesson

### Making the lesson

The Mozilla Science Study Group
handbook [**here**](https://mozillascience.github.io/studyGroupHandbook/lessons.html#reuse)
and [**here**](https://mozillascience.github.io/studyGroupHandbook/event-types.html#workalong)
has several very good points about making a lesson. This section summarizes bits
of the handbook, but also adds pieces that are missing from it. Check out the 
[lesson bank too](https://github.com/mozillascience/studyGroupLessons/issues)

From the handbook:

- **Keep it short and simple**
- **Keep in mind the beginners**
- **Don't use slides and focus on writing the code**

Expanding on this are other things to keep in mind.

**Data**: External data *should not be used* unless it is absolutely necessary. 
Instead, rely on built-in or sample datasets provided by the respective 
programming language or package.

**Code**: This is the main thing that should be emphasized. How the code is
used, its specific applications, and its meaning should be the entire focus of
the lesson. Here are some tips:

- Keep the code as *simple* as possible while still covering the concept. The
session is, after all, only one hour.
- When making the code, make *no or few assumptions* about the knowledge of the
audience.
- Keep the code *generalizable*. Our members come from diverse fields of
research. What we share is the need to code.

Lessons should be submitted as a Pull Request (PR) at least *one full day* before the
session. Submitting the lessons as a Pull Request is also a great way to find
out whether your lesson matches what is advertised in the Events repo. New lessons 
should be created from a copy of the `lessons/template/lesson.md` file. Follow the 
details and requests in the template lesson file and write up your lesson!

Submitting a PR can be done by (**brief step-by-step**):

1. Forking the `studyGroup` repo
2. (Optional) `git clone` your forked version onto your computer
3. Use the lesson template and make your lesson
4. `git add` and `git commit` that lesson
5. `git push` your lesson to your forked `studyGroup` repo
6. Submit a PR using Github's Pull Request button on your forked version

In a more **detailed step-by-step**:

1. Fork the `studyGroup` into your GitHub account. See 
[this GitHub help for info on forking](https://help.github.com/articles/fork-a-repo/)
2. After it is forked, `git clone` from your terminal or Git Bash of your new
forked version of `studyGroup` onto your computer *from your account*. If you
want it on your Desktop do:
  ```
  cd Desktop
  git clone https://github.com/YOUR-USERNAME/studyGroup.git 
  ```

  ...replacing YOUR-USERNAME with your own user name on GitHub (eg: mine would
  look like `git clone https://github.com/lwjohnst86/studyGroup.git`)
3. Type `ls` to confirm that the `studyGroup` folder was created. Then 
`cd studyGroup` and `git status` or `git log` to confirm that you are now in the 
new repo.
4. Add the original Study Group repo using this command:
  ```
  git remote add upstream https://github.com/UofTCoders/studyGroup.git
  git fetch upstream
  ```

5. Create a new folder in the `lessons` folder of `studyGroup` on your computer,
naming it appropriately (without spaces) to the lesson you are planning on
teaching.
6. Copy the `lessons/template/lesson.md` into the new folder and write up your 
lesson in there, filling out requested information. This is a 
[Markdown](https://help.github.com/articles/markdown-basics/) file (`.md`).
The reason it should be Markdown or plain text is because GitHub
renders the Markdown file into HTML so it's nicer to read on the site and for
others. 

7. Save the new file in the git history:
  ```
  git add ./lessons/yourlesson/lesson.md
  git commit -m "Added file on lesson"
  ```

8. Push up to your GitHub repo:
  ```
  git push origin gh-pages
  ```
9. Submit a Pull Request *from* your GitHub account *into* the UofTCoders. Check
[the GitHub help on Pull Requests](https://help.github.com/articles/using-pull-requests/)

**Note**: For those wanting to contribute regularly or who edit their
repositories often, it's best to create a new branch for each PR you make.  For
example, if you want to clean up some bits of the repo, you can follow a
workflow such as this:

```
## Good to name the branch to reflect what you are doing.
git checkout -b cleaningUp 
## Make edits/changes/cleaning up
git add files-changed
git commit
git push origin cleaningUp
```

You can now make a pull request **of the `cleaningUp` branch**.  Once the pull
request has been completed, you can delete the now old branch via:

```
git checkout gh-pages ## Move back to main branch
git branch --delete cleaningUp
## If you want to delete the remote branch too do:
git push origin --delete cleaningUp
## Update your main branch from the new upstream branch
git pull upstream gh-pages
```

### Giving the lesson

**Come 10 min** early, to make sure everything is set up.

Before you begin:

- Introduce yourself and ask that everyone else state their name and maybe their 
program

A few tips:

- Start from the *(nearly) very beginning*. Open the program or IDE (RStudio/Jupyter/etc)
with everyone else and show how to do it (for beginner lessons).
- Make *no/few assumptions* about what the audience knows. Let them know what keys
you are using to run a particular piece of code (Ctrl-Enter for
Jupyter/RStudio/etc) (for beginner lessons).
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
- The built site can also be viewed at your forked version
(`https:://yourusername.github.io/studyGroup`).
