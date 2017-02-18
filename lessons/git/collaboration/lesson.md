---
layout: page
title:
visible: true
tags: 
  # languages
  - git
  # levels
  - beginner
---
<!-- change visible to true if you want it on the site -->
<!-- remove any tags listed above that are not relevant -->

# Collaborating on GitHub

 - **Authors**: Serena Jeblee
 - **Research field**: Computational Linguistics
 - **Lesson topic**: Collaborating on GitHub
 - **Lesson content URL**: <link>

## Overview
- A brief review of basic git usage
- Some helpful git commands
- Help! I've made a mistake! (aka how to unstage changes and undo commits)
- Merge conflicts

If we have time:
- Stashing changes
- Branches
- Rebasing

## Whirlwind Overview of Github
- What is GitHub?
- What is version control?
    - version control helps you collaborate on code especially when your changes might overlap
    - master repo vs local repos
    - master - shared version stored on github or a server
    - local - your local copy that you can play with and make changes to, only seen by you until you push your changes
- How to contribute code
    git clone [repo-url]
    git pull
        - syncs latest version from the master repo to your local repo
    - edit code
    git add [file]
        - stages code for commit (git remove does no unstage, it stages a deletion, we'll get to unstaging in a bit)
    git commit
        - create a record of the changes you've made
    git push
        - sync your local changes to the master repo
	- fork and pull request if you can't push directly
- Some rules for good commits
    - commit should represent one change or a small set of related changes (like a bug fix or new feature)
    - all committed code should be functional and tested
    - make sure the commit message is descriptive

## Code commit process
- Create a new repo on github
- Open up a terminal
- Create a folder for your git repo
  git clone [repo-url]
- Create a new text file, you can use whatever editor you want (I'm using emacs)
- hello.sh
          #!/bin/bash
          echo "Hello, world!"
    chmod +x hello.sh
    ./hello.sh
    git add hello.sh
    git commit
    git push

## Managing your repo
    git status
    git diff
    git log

- Add to helloworld.sh
     echo "Fancy code will go here"
     echo "More fancy code"
- run it and commit it


## Help! I messed up and now nothing works!
    - add junk code to hello.sh and run it
    - Undo the changes
      git checkout -- [file]
    - Unstage the changes, but keep them
      git reset --hard HEAD and git reset HEAD~x
    - hard vs soft reset

## Oops, I didn't mean to commit that
    - Add the junk code back and commit it
    - Undo a local commit
      git reset --soft HEAD~1 (keeps changes, but undoes the commit)
    - pushed commits - do a revert commit
      git revert [commit-hash]

## The dreaded merge conflict
   - Clone a new copy of your repo
   - Change a line and commit it
   - Go back to your original repo
   - Change same line to "My version is better!"
   - Commit it
     git pull
   - Resolve the merge conflict, add and commit

# Use the markdown syntax:

If you want to include code blocks, please with indent with **four
spaces** (not a tab) like so:

    Code here

Or you can use three tilde's:

~~~
Code here
~~~


# Header 1

## Header 2

### Header 3

**bolding** and *italizing*

Inline `code`

[links](url)
