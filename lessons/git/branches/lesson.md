---
layout: page
title: 'Using branches in Git'
visible: true
tags:
  - git
  - intermediate
---

# Why and how branches are used in Git

 - **Authors**: Luke Johnston
 - **Research field**: Nutritional and diabetes epidemiology
 - **Lesson topic**: Git branches
 - **Lesson content URL**: <https://github.com/UofTCoders/studyGroup/tree/gh-pages/lessons/git/branches>
 - **Lesson video stream**: <https://www.youtube.com/watch?v=FwxbMxXHb0c>

## Preface: ##

Version control systems like Git help manage changes to files. Sometimes, you'll
want (or need) to make some 'feature' or 'patches' to a collaborative research
project. Or maybe you want to make some experimental changes to your code, but
don't want to touch your main code. This, and more, is where branches come into
play.

In this code-along we'll go over what branches are, and how and why you would use
them.

### Pre-requisites:

* Obviously, have [Git installed](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
* Make sure to [configure your git](http://codeasmanuscript.org/lessons/git/cheatsheet/)


## What are Git branches

In very simple terms, git branches are individual projects within a git
repository. Different branches within a repository can have completely different
files and folders, or it could have everything the same except for some lines of
code in a file.

Let's use a few real world examples (at least that I've used before, others may
have used them differently):

- Pretend you submitted a research article to a journal and they want you to
revise it based on some reviewers comments. There are several ways to deal with
the comments, so instead of changing your main manuscript, you create a
`revision` branch in your manuscript git repository. In that branch you make the
changes to your manuscript in response to the reviewers. Once you are satisfied,
you merge the branch into the `master` branch and resubmit the article.
- Imagine you have a dataset that multiple people work off of but that is also
often updated with more data. You think you found a problem with the dataset,
but aren't sure. So you create a new branch `fixing` to fix the problems without
messing with the master dataset. After you confirm the problem is real and that
you have the solution, you submit a pull request of the `fixing` branch to be
merged with the `master` branch.
- What is often the case in software development, a bug or missing feature in
the software gets identified. Because the software is already in production use
(fairly stable, other people rely on it, etc), you can't just make changes to
the main software code. So a `hotfix` or `feature` branch is created to address
these problems, which will eventually get merged in with the `master` branch for
the next version of the software. This ensures that other people's code isn't
broken everytime a bug gets fixed.

There are many uses of branches in Git. The nice (and very powerful) thing about
Git is the fact that branches are very cheap compared to other version control
systems. By cheap, I mean they don't take up much disk space, it's
computationally easy to move between branches, and it's (relatively) easy to
merge branches together. This is because of how Git represents branches, since
they are simply *pointers* or an individual commit. *That's it.* Just a
pointer... Git commit history is a 
[directed acyclic graph](https://en.wikipedia.org/wiki/Directed_acyclic_graph), 
which means that every single commit always has a 'parent' commit (the
previous commit in the history, or multiple parents when a merge happens), and
any individual commit can have multiple 'children'. This history can be traced
back through the 'lineage' or 'ancestry'. The branch just gives a name to each
'lineage' when a commit has multiple children.

When you merge two branches together, the commit histories get merged together
as well. Which means that all the changes you made in each branch gets combined
back into a single lineage, rather than two. This makes it easier to work
collaboratively on a project, since each individual could work on their own
branches, without dealing with the messiness that could come from working all on
one branch.

## Commands used with branches

Branches are best understood visually. So let's first start with using 
[this website](https://onlywei.github.io/explain-git-with-d3/) to see what the 
`branch`, `checkout`, and `merge` commands are doing.

After we've tried that, let's do it locally (on your own computer). Here is a
sequence of commands to try out:

    cd ~/Desktop
    mkdir git-branches
    cd git-branches
    git init # start a repo
    git add .
    git commit -m "First commit" # make the first commit
    git branch testBranch # create branch
    git checkout testBranch # move to branch
    ## can also do git checkout -b testBranch
    echo "Some text" > file.txt 
    git add file.txt
    git commit -m "Added a file with text"
    git checkout master
    echo "Text in another file" > new-file.txt
    git add new-file.txt
    git commit -m "Added another file"
    git log --graph --oneline --decorate --all
    # This command is long, so shorten it using aliases
    git config --global alias.lg 'log --graph --oneline --decorate --all'
    git merge testBranch
    git lg
    git branch -d testBranch # delete the branch
    
## Using branches for pull requests 

I mentioned this already, but branches are best used when doing a 
[pull request](https://help.github.com/articles/using-pull-requests/)
(unless the pull request is very small or few people work on the repository).

The steps to take would be:

1. Fork a repository on GitHub
2. Clone it onto your computer
3. Make a branch and move to it: `git checkout -b fixingBranch`
4. Make changes to the files
5. Commit the changes to the history
6. Push the branch up to your forked version: `git push origin fixingBranch`
7. On GitHub, submit a Pull Request of your `fixingBranch`
8. Once the pull request is merged, 
[delete](https://github.com/blog/1377-create-and-delete-branches) 
the `fixingBranch` on your forked repo on GitHub and on your computer 
(`git checkout master && git pull upstream master && git branch -d fixingBranch`)

# Resources: #

If you have any questions, often one of the best places to start is either  
[StackOverflow](https://stackoverflow.com/questions/tagged/git) or Google (which
more likely links to StackOverflow).

## Glossary: ##

* `cd` - change directory
* directory - the same thing as a folder
* `mkdir` - make a directory
* `echo` - print a message to the screen or to a file if `>` (redirect) is
present.
* `git init` - start or initialize a git repository
* `git add` - put a file into the staging area, so that git starts
  tracking it
* `git commit` - send files in the staging/index area into the history
  (the git repository)
* `git log --graph --oneline --decorate --all` - view the commit history in the
git repository and the branches, with each commit as one line.
* `git branch` - An individual line of commit history that contains files that may
differ from other branches.
* `git checkout` - A way to move across the git commits and branches.
* `git merge` - Combine a branch into the current checked out branch (i.e. the
branch you are on).

## Links: ##

* [Interactive, visual tutorial on branching](https://pcottle.github.io/learnGitBranching/)
* [Brief explanation of branching](https://www.atlassian.com/git/tutorials/using-branches/git-branch)

