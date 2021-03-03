---
layout: page
title: Collaborating on GitHub
visible: true
tags:
  # languages
  - git
  # levels
  - intermediate
---
<!-- change visible to true if you want it on the site -->
<!-- remove any tags listed above that are not relevant -->

 - **Authors**: Ahmed Hasan; Frances Wong
 - **Research field**: Genomics; Physiology
 - **Lesson topic**: Collaborating on GitHub
 - **Lesson content URL**: <https://github.com/UofTCoders/studyGroup/tree/gh-pages/lessons/git/collaboration>
 - **Lesson video stream**: n/a

# What are Git and GitHub?

## Git

Git is a version control system that allows users to track changes in files.
Git is used via the command line on your local computer. Once a given folder
has been designated as a Git _repository_ (or 'repo' for short), Git will start
looking for changes in files in that folder. Git is quite flexible: we can pick
and choose which files we would like to track in a repository. 

## GitHub

GitHub is a website that hosts Git repositories. Repositories are quite
flexible: a Git repo could be any of:

- Fully self contained software
- Research projects, containing scripts and logs
- Websites
- Educational content (e.g. material for one or more workshops)
- Just a place for you to keep a random collection of scripts!

Although repos can be created on GitHub and maintained there, it is much more
common for users to also have local copies of their repos as well and sync the
two as changes happen on either end. GitHub accounts are free to use.

GitHub also comes equipped with several additional features. Each repo has an
Issues page, for instance, where owners, collaborators, and other users can
submit feature requests, point out bugs, or simply have discussions pertaining
to the repo in some form. Moreover, GitHub also allows for _forking_ repos,
which is when users create a copy of a given repo that's associated with their
own GitHub accounts. Finally, GitHub features a full Pull Requests tab
associated with every repo that centralizes any proposed changes to the
contents of the repo.  We will explore both forks and pull requests below;
these are very important features for collaboration! 


# Solo GitHub workflow - the minimal case

Many researchers use GitHub repos simply as a place to keep all their scripts.
New scripts and changes to existing to scripts are both _committed_ to the repo
(saved changes are referred to as 'commits') and there tends to be a single
linear commit history. 

To accomplish this, it's common to have a local repo that one works on and
commits changes in, after which those changes are pushed to GitHub using
command line Git commands. 

Let's quickly review a few core commands:

```bash
# getting started with a repo
git init # initializing a repo at the command line
git clone [url] # creating a copy of an existing repo

# linking a repo to GitHub
git remote # listing any remotes - eg the repo on GitHub
git remote add origin [url] # add link to repo at specific url

# committing (saving) changes to files
git add [file] # telling git to track changes in a file
git commit # saving those changes
```

# Collaborative work flows

## Branches and pull requests

However, collaborative workflows (and even solo software development) is often
not done this way. Both make use of what are known as _branches_: a snapshot of
the repo at a given time that has an independent commit history. Branches can
be thought of as copies of a repo that can then be worked on without actually
affecting the 'main' repo itself. This 'main' repo is itself a branch, and one
that is typically called `master` or `main` by default.

A branch can be created and switched to using `git checkout`:

```bash
git checkout -b patch-1
# Switched to new branch 'patch-1'
```

after which branches can be switched between using `git checkout`:

```bash
git checkout main # switches back to main branch
```

Branches can be listed using `git branch`:

```bash
git branch
git branch -v # for more details on branches
```

Why not work in `master`/`main` directly? By working in branches instead, users
are free to make whatever changes they would like without fear of breaking the
existing codebase, or causing some kind of similar problem. Instead, once one
is done making changes in and ideally testing the changes in a given branch, a
_pull request_ (PR) can be submitted, essentially requesting for the changes in the
branch to be merged with `master`/`main`.

A pull request functions as a means of merging the new commit history of a
given branch to the `master`/`main` branch. This is the core concept behind
collaborating in Git: collaborators working in branches and then submitting
pull requests to have their changes incorporated into the codebase. 

There are two separate workflows by which this is done, each with a specific
set of circumstances in which they are the appropriate choice: the 'shared
repository' model as well as the 'fork and pull' model. We will touch on both
before demonstrating the latter.

## Shared repository

The shared repository model is usually (but not always) put into practice on
smaller projects with smaller amounts of collaborators. The key requirement for
a shared repo model is that _all contributors have write access to the repo_,
which is not always the case (e.g. when contributing to a large open source
project). 

The shared repository model involves working _directly in the main repository_.
Branches are still used to keep proposed changes separate, and then pull
requests are submitted once a collaborator wishes for their changes to be
merged into `master`/`main`.  The `master`/`main` branch is still never written
to directly -- any changes must go through the PR workflow (detailed further below)

We won't be demoing this today, especially since much of this workflow is covered
in the more extensive fork and pull workflow regardless. 

Here's the full workflow, for reference:

1. Collaborator creates a branch on the main repo
2. Collaborator makes changes in the branch
3. Collaborator submits a PR, requesting changes from the branch to be merged into `master`/`main`
4. Repo owner reviews PR and requests further changes if needed.
5. If further changes are requested, collaborator makes them *in the branch*.
6. When PR is good to go, owner merges PR into `master`/`main`
7. The branch is deleted. 

This model is good for beginners to Git collaboration, since there is no need
to sync anything after changes have been merged. 

## Fork and pull model

In this model, collaborators _fork_ the repo: creating entirely separate copies of
the repo altogether. It is common practice to also _clone_ (make a local copy of)
the fork, especially for one of the two methods of syncing forks we'll learn below. 

Upon cloning the repo, the main repository is also added as a _remote_ to the fork.
This will be used to sync the fork later:

```bash
git remote add upstream [main repo url]
```

Within their fork, a collaborator creates a new branch and adds in their proposed changes.
Once the branch is ready, a pull request is submitted _from the branch of the fork_ to
`master`/`main` _on the main repo_. This sort of 'cross-repo' pull request is only possible
between forks, and since anyone can make a fork without necessarily having write access to a repo,
this is the much more commonly used model of collaboration on GitHub.

Once a PR is submitted, repo owners can use the pull request dialog on GitHub to
request further changes if needed. If this is the case, the collaborator can continue making
changes in their branch; GitHub will automatically update the PR with any new changes.

Once the PR is ready, the owner will merge the PR into `master`/`main`. The changes have been
merged! All that remains is for the collaborator to sync their fork: since the collaborator
worked on a branch, the fork's `master`/`main` branch has not been updated at all. 

Forks can be updated in two different ways - first, on the command line:

```bash
# run in the repo dir
git checkout master # or main - this will switch back out of the experimental branch
git fetch upstream/master # fetches the updated codebase from the main repo
git merge upstream/master # merges the updates from the main repo
git push origin master # sends the updates to the *fork* 
```

However, it can also be done via GitHub:

1. Head to your fork of the repo.
2. Click on 'Pull request' in the bar above the file list.
3. Set the Base Repository to the fork, and the base to `master`/`main`.
4. Set the Head Repository to the main repo, and the base to `master`/`main`. 
5. Create the pull request and merge it! 

This can be quite confusing at first glance! But it's important to sync the
fork like so, since it updates it for any further changes if needed. It's good
practice to do this both after changes are merged and before starting on a
fresh branch. It is also entirely possible to simply delete and remake the fork
instead, but that can be tiresome if you find yourself collaborating on the
same repo for a long period of time.

We'll now be demoing the fork and pull model for the remainder of the lesson!

## Merge conflicts

Merge conflicts can unfortunately arise during this process. A _merge conflict_
happens `master`/`main` on the main repo is updated *after* being forked, and
the changes a collaborator submits a PR for conflict with the current state of
the main repo (e.g. if the same line is modified differently on the main repo
than on the PR). Git won't know which of the changes to stick with, and will
ask for the conflict to be manually resolved.

We won't be demoing merge conflicts today given time constraints, but a guide
on how to resolve them can be found [here][merge-conf]. The best way to avoid
merge conflicts, however, is to make sure that your fork remains synced! 

[merge-conf]: https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/resolving-a-merge-conflict-on-github

