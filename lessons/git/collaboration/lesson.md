---
layout: page
title: Collaborating on GitHub
visible: true
tags:
  # languages
  - git
  # levels
  - beginner
---
<!-- change visible to true if you want it on the site -->
<!-- remove any tags listed above that are not relevant -->

 - **Authors**: Serena Jeblee
 - **Research field**: Computational Linguistics
 - **Lesson topic**: Collaborating on GitHub
 - **Lesson content URL**: <https://github.com/UofTCoders/studyGroup/tree/gh-pages/lessons/git/collaboration>
 - **Lesson video stream**: <https://www.youtube.com/watch?v=vrftiQcqIYM>

## Overview
- A brief review of basic git usage
- Some helpful git commands
- Help! I've made a mistake! (aka how to unstage changes and undo commits)
- Merge conflicts
- Branches
- Forking and Pull Requests

If we have time:
- Stashing changes
- Rebasing

## Whirlwind Overview of GitHub
- What is GitHub?
- What is version control?
    - version control helps you collaborate on code especially when your changes might overlap
    - master repo vs local repos
    - master - shared version stored on GitHub or a server
    - local - your local copy that you can play with and make changes to, only seen by you until you push your changes
- How to contribute code
~~~
git clone [repo-url]
git pull # syncs latest version from the master repo to your local repo
[edit the code]
git add [file] # stages code for commit (git remove does not unstage, it stages a deletion, we'll get to unstaging in a bit)
git commit # create a record of the changes you've made
git push # sync your local changes to the master repo
~~~
- Fork and pull request if you can't push directly
- Some rules for good commits
    - commit should represent one change or a small set of related changes (like a bug fix or new feature)
    - all committed code should be functional and tested
    - make sure the commit message is descriptive

## Get Started
- Create helloworld.sh
~~~
echo "Fancy code will go here"
echo "More fancy code"
~~~
- Run it and commit it

## Help! I messed up and now nothing works!
- Add junk code to hello.sh and run it
- Undo the changes to a file
~~~
git checkout -- [file]
~~~
- Unstage the changes, but keep them
~~~
git reset --soft HEAD
~~~
- Undo the changes and go back x commits
~~~
git reset --hard HEAD~x
~~~

## Oops, I didn't mean to commit that
- Add the junk code back and commit it
- Undo a local commit
~~~
git reset --soft HEAD~1 # keeps changes, but undoes the commit
~~~
- Pushed commits - do a revert commit
~~~
git revert [commit-hash]
~~~

## The Dreaded Merge Conflict
- Clone a new copy of your repo
- Change a line and commit it
- Go back to your original repo
- Change same line to "My version is better!"
- Commit it
~~~
git commit
git pull
~~~
- Resolve the merge conflict, delete >>> <<< lines, add and commit

## Branches
- Branches allow you to have different commit histories in the same repo
- Useful for feature work
- For more info see: <https://github.com/UofTCoders/studyGroup/blob/gh-pages/lessons/git/branches/lesson.md>

## Forking and Pull Requests
- Used when you don't have direct push access to a repo
- Fork: creates your own version of the repo that you can commit to
- When you're finished committing all of your changes, create a pull request
- Pull Request: tells the main repo that you have some commits you would like to merge, and allows others to review them first

## Reviewing Code
- Look for:
  - errors (typos, potential infinite loops, concurrency issues, etc)
  - overly complicated code
  - unclear variable names
  - missing comments or documentation
- Provide constructive suggestions for how to fix it

## Updating the Pull Request
- Try to address all comments, if you're not going to change something, say why not
- Make a new commit and push it to the branch your pull request is on

## Merging the Pull Request
- Requires push access to the repo
- If there are conflicts, you'll have to check out the pull request and resolve them, otherwise you can merge online
- For more info on how to merge a pull request, see <https://help.github.com/articles/merging-a-pull-request/>
