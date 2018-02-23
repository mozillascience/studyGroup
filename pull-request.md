---
layout: page
title: Submitting a Pull Request for Lessons
---

Lessons should be submitted as a Pull Request (PR) at least *one full day* before the
session. Submitting the lessons as a Pull Request is also a great way to find
out whether your lesson matches what is advertised in the Events repo. New lessons
should be created from a copy of the `lessons/template/lesson.md` file. Follow the
details and requests in the template lesson file and write up your lesson!

Please follow the instructions below before submitting your PR:

## Brief step-by-step

1. Fork the `studyGroup` repo
2. (Optional) `git clone` your forked version onto your computer
3. Use the lesson template and make your lesson
4. Follow the file/folder naming rules (see below)
5. `git add` and `git commit` that lesson
6. `git push` your lesson to your forked `studyGroup` repo
7. Submit a PR using Github's Pull Request button on your forked version

## Detailed step-by-step

1. Fork the `studyGroup` into your GitHub account. See
[this GitHub help for info on forking](https://help.github.com/articles/fork-a-repo/).
2. After it is forked, `git clone` from your terminal or Git Bash of your new
forked version of `studyGroup` onto your computer *from your account*. If you
want it on your Desktop do:
  ```
  cd Desktop
  git clone https://github.com/YOUR-USERNAME/studyGroup.git
  ```

  ...replacing YOUR-USERNAME with your own user name on GitHub (eg: mine would
  look like `git clone https://github.com/lwjohnst86/studyGroup.git`).
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
teaching. Files and folders should be named as such:
    - Create the lesson template under whichever programming language you are
    teaching (e.g. under `lesson/r` or `lesson/python`.). Use the `misc/` folder
    if you aren't sure.
    - Name the new lesson folder, all small caps, so that it simply explains
    what the topic is (e.g. `python/intro/`, `r/loops/`).
    - If you need more than one word, keep all small caps and use a dash (`-`)
    for a space (e.g. `misc/bash-intro/`, `misc/jekyll-ghpages/`).
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
9. Submit a Pull Request *from* your GitHub account *into* the UofTCoders.
Make sure the **base fork** is set to `UofTCoders/studyGroup` (and not `mozillascience/studyGroup`).
Check [the GitHub help on Pull Requests](https://help.github.com/articles/using-pull-requests/).

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
