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

 - **Authors**: Serena Jeblee; Kathy Chung
 - **Research field**: Computational Linguistics; Post-Doc in Digital Humanities
 - **Lesson topic**: Collaborating on GitHub
 - **Lesson content URL**: <https://github.com/UofTCoders/studyGroup/tree/gh-pages/lessons/git/collaboration>
 - **Lesson video stream**: <https://www.youtube.com/watch?v=vrftiQcqIYM>

## Collaborating with Git
Kathy Chung, 2017-08-02

#### QUESTIONS TO ASK PARTICIPANTS TO GAUGE KNOWLEDGE LEVEL
1. How familiar are you with the unix command line? How often do you work with it?
2. Have you used git before?
2. On a scale of 1-5 (1=novice/beginner, 5=expert) what kind of git user are you?  (how often do you use git in your work? once a week, once a day, once a month)
3. Have you used GitHub before?
4. Have you collaborated on a project on GitHub before?

### Git vs GitHub
#### Git
- Git is the command line version control system (VCS) software which works on your local computer.
- Git was created by Linus Torvalds in 2005 for development of the Linux kernel, with other kernel developers contributing to its initial development.
- You need Git to use GitHub. You can use Git locally without GitHub.

#### GitHub
- GitHub is an internet hosting service for git repositories. Public repos are free; private repos are paid.
- As a shared space for repos, it allows you to do collaborative work.


### Two Common Collaborative Work Flows
#### Shared Repository Model
- For small projects where you are basically in the same physical space (e.g. lab with offices near each other).
- Be careful! You are cloning the main repository.
- Everyone has push and pull access to the central repo, so be careful and:
  - Never commit to the master directly.
  - Always do your work on a different branch from master.

#### Basic Shared Repository Workflow
- update your local repo with `git pull origin master`,
- create a working branch with `git checkout -b MyNewBranch`
- make your changes on your branch and stage them with `git add`,
- commit your changes locally with `git commit -m "description of your commit"`, and
- upload the changes (including your new branch) to GitHub with `git push origin MyNewBranch`
- Go to the main repo on GitHub where you should now see your new branch
- click on your branch name
- click on "Pull Request" button (URC)
- click on "Send Pull Request"


#### Fork and Pull Model
- This is the model used by U of T Coders on its own website and repos.
- The "owner"/"Project Leader" of the upstream repo assigns rights to "Collaborators"
- Collaborators do not have push access to main (upstream) repo
- Project Lead accepts Pull Requests (PRs) fro collaborators, reviews them, then merges them into main repo.


#### Fork and Pull Workflow  
- to be demonstrated during lesson


### Some Git Terminology/Jargon
#### Repos and Branches

Term | Description
----- | ------------
Origin (repo) | Your remote repo (on Github); it is the "origin" for your local copy. Either it is a repo you created yourself or it is a fork of someone else's GitHub repo.
Upstream (repo)| The main repo (on GitHub) from which you forked your GiHub repo.
Local (repo) | The repo on your local computer.
Master | The main branch (version) of your repo.


#### Basic Commands/Actions

Term | Explanation
---| ---
Fork | Make a copy of someone else's GitHub repo in your own GitHub account.
Clone | Make a copy of the your GitHub repo on your local computer.  In CLI: 'git clone' copies a remote repo to create a local repo with a remote called `origin` automatically set up.
Pull | You incorporate changes into your repo.
Add | Adding snapshots of your changes to the "Staging"  area.
Commit | Takes the files as they are in your staging area and stores a snap shot of your files (changes) permanently in your Git directory.
Push | You "push" your files (changes) to the remote repo.
Merge | Incorporate changes into the branch you are on.
Pull Request | Term used in collaboration. You "issue a pull request" to the owner of the upstream repo asking them to pull your changes into their repo (accept your work).



### Configuring git global settings on your local computer
You only have to do this once; global settings apply to all your git repos.  
Note: Any Local settings you initiate within individual git repositories will over ride global settings.  
- username
- email
- display colours
- preferred text editor


Command line git syntax is: ```git verb```

>```$ git config --global user.name "Albert Einstein"```  
>```$ git config --global user.email   "bertie@worlduniversity.edu"```  
>```$ git config --global color.ui "auto"```  

Use your own name and email address instead of Einstein's. This user name and email will be associated with your subsequent Git activity, which means that any changes pushed to a Git host server will include this information.

For this lesson, we will be interacting with GitHub and so the email address used should be the same as the one used when setting up your GitHub account. If you are concerned about privacy, please review GitHub’s instructions for keeping your email address private. If you elect to use a private email address with GitHub, then use that same email address for the ```user.email``` value, e.g. ```username@users.noreply.github.com``` replacing ```username``` with your GitHub one. You can change the email address later on by using the ```git config``` command again.

Set up your favorite text editor (default editor):

>```$ git config --global core.editor "nano -w"```  
>```$ git config --global core.editor "atom --wait"```  

See https://swcarpentry.github.io/git-novice/02-setup/ for settings for other text editors

------------------------------------------------------
## Exercise 1
### Two Person Collaboration via the CLI - Shared Repo Workflow (without branches)
This exercise is based on the SWC Git Novice lesson https://swcarpentry.github.io/git-novice/08-collab/

One of you will be the "Owner" and one of you will be the "Collaborator."

#### A. Owner gives collaborator access to their repo.
1. Go to your GitHub repo
2. Add a file called "tenlines.txt" and put the text from the etherpad into the file. Commit your changes.
2. Click on **Settings** tab.
3. Click **Collaborators**
4. Enter collaborataors username

#### B. Collaborator clones Owner's Repo
1. Go to https://github.com/notifications and accept access to Owner's repo.
2. On the CLI, clone the owner's repo but issuing the commmand:  
```$ git clone URL-of-Origin-Repo Directory-Address-of-Local-Repo```  

#### C. Collaborator works on clone of Owner's Repo
Go to your cloned repo:  
```$ cd ~/.../yourClone```  

Open editor and revise working file:   
```atom tenlines.txt```  

Commit your changes to your local repo:  
```$ git add tenlines.txt```  
```$ git commit -m "your commit message"```  

Push your changes to the Owner's repo on GitHub:  
```$ git push origin master```  

#### D. Owner review and accepts changes from Collaborator
Look at Owner's GitHub repo and see new commit(s) from Collaborator.  

Download (pull) Collaborators changes to Owner's local repo:  
```$ git pull origin master```  

---------------------------------  
## Exercise 2
### Dealing with Merge Conflicts
This section is based on the SWC Git Novice lesson https://swcarpentry.github.io/git-novice/09-conflict/  

When two or more people work on the same files, conflicts are bound to occur. Version control will help notify us when there are conflicts. It will be up to the humans to sort out which changes to retain.  

The file "tenlines.txt" currently looks like this:  
```$ cat tenlinestxt```  

Let's say **Person A** adds a line to the file and review:  
```$ atom tenlines.txt```  
```$ cat tenlines.txt```  

and pushes changes to GitHub:  
```$ git add tenlines.txt```  
```$ git commit -m "added a line in local copy and pushed to remote"```  
```$ git push origin master```  

Now, **Person B** modifies her local file without first updating it (pulling the repo) from GitHub:  
Add a line to the file and review:  
```$ atom tenlines.txt```  
```$ cat tenlines.txt```  

Commit the changes locally:  
```$ git add tenlines.txt```  
```$ git commit -m "added a line in local copy"```  

But when we push, Git will not allow this because there were changes to the same line in the two files:  
```$ git push origin master```  

To resolve the conflict, you need to **pull** the changes from GitHub, **merge** them into your local copy, and then **push** it back to GitHub  
```$ git pull origin master```  

Git tells us there is a conflict and tells you the file it's in.  
Let's look at the file:  
```cat tenlines.txt```  

Git has put some new info in our file:  

```<<<<<<<<<<<<< HEAD```  
```our text```  
```========```  
```Other persons's text```  
```>>>>>>>>```  

You need to open your text editor and make the changes which is the accepted version by you and your collaborator:  
```atom tenfiles.txt```  

Then, to finish mergining, you need to **add**, **commit**, and **push** your changes back to GitHub:  
```$ git add tenlines.txt```  

You can verify the status of your repo first, then commit and push:  
```$ git status```  
```$ git commit -m "Merged changes from GitHub"```  
```$ git push origin master```

Git keeps track that a conflict has been resolved and what was merged into what so when Person A who made the first changes pulls from GitHub, she doesn't have to fix things and merge again.  

Person A pull and sees new version of the file:  
```$ git pull origina master```  
```$ cat tenlines.txt```  

---------------------------------

## Exercise 3
### Solo Practise via the GitHub GUI
This exercise is based on the 10 mins GitHub "Hello World" tutorial
https://guides.github.com/activities/hello-world/

#### A. Create a Remote Repo in your GitHub Account

  1. In URC, click **+**, then select **New repository**
  2. Name your repository ```Kathy's Project```.
  3. Write a short description.
  4. Select **Initialize this repository with a README**.

#### B. Create a Branch

1. Click drop down at top of file list that says **branch: master**.
2. Type a branch name, `readme-edits`, into the new branch text box.
3. Select the blue **Create branch** box or hit "Enter" on your keyboard. Notice you are now on the code view of your `readme-edits` branch, which is a copy of `master`.

#### C. Make and commit changes
You are now on your `readme-edits` branch.  

  1. Select the `README.md` file.
  2. Click on the pencil icon (URC) of the file view.
  3. Edit the file. Write something about yourself and your project.
  4. Write a commit message at bottom of screen.
  5. Click the **Commit changes** button.

#### D. Open a Pull Request (PR)

1. Click on the **Pull Request** TAB, which takes you to the PR page
2. Click on the green **New Pull Request** button.
3. Select the branch you made, `readme-edits`, to compare with the original, `master`.
4. Review your work.
5. Name your pull request and give it a brief description. You can use @mention in your description to ask for feedback by specific persons.
6. Click on the green **Create Pull Request** button.

#### E. Merge your Pull Request
You will merge your  `readme-edits` branch into your `master` branch.  

1. Click on the green **Merge pull request** button.
2. Click **Confirm merge**.
3. You can now delete the branch

--------------------------------

## Exercise 4
### Two Person Practise via GitHub GUI  
This exercise is based on the Mozilla Science WOW lesson on GitHub for Collaborating on Open Projects   
http://mozillascience.github.io/working-open-workshop/github_for_collaboration/  

One of you is the Project Lead. The other will be the Contributor.

#### A. Project Lead: Create a Remote Repo in your GitHub Account

  1. In URC, click **+**, then select **New repository**
  2. Name your repository ```Kathy's Project```.
  3. Write a short description.
  4. Select **Initialize this repository with a README**.\
  5. Give your partner the URL to your repo.

#### B. Project Lead: Add a File
1. Click **New file**
2. Give the file a name.
3. Put some content in the file.
4. Write a commit message at bottom of screen.
5. Click the **Commit changes** button.

#### C. Project Lead: Make a Label
1. Click on **Issues** tab.
2. Click on the **Labels** box.
3. Add a label called ".............."

#### D. Project Lead: Make an Issue
1. Click on **New Issue** button.
2. Give it a title and brief description. You can use @mention in your description to ask for specific feedback.
3. Give it a label.

#### E. Contributor: Comment on an Issue
1. Go to the PL's repo.
2. Click on the **issues** button to see all the issues.
3. Select the one you wish to respond to.
4. Make a comment, introduce yourself and volunteer to work on the issue.

#### F. Project Lead: Reply to a comment
1. From your own repo, select the commented issue.
2. Write a reply.
3. Assign the issue to yourself so you can monitor it and answer questions, etc.

#### H. Contributor: Fork and Branch
1. Go to your own GitHub account.
2. Find the Lead's repo and fork it.
3. Create a branch in your forked repo (see previous Solo practise for instructions)
4. Give the branch a name which indicates the feature or change you're working on.

#### I. Contributor: Do Work and Commit
1. Make changes in this branch.
2. When you are done, write a commit message, and click on the **Commit changes** button.

#### J. Contributor: Make a Pull Request to the Upstream Repo
1. Select **Pull Request** tab.
2. Click on **New Pull Request**
3. Make sure you've selected the correct branch where you've made your edits.
4. Name your pull request and provide a brief description (you might wish to include a reference to the related issue #).
5. Click on the green **Create Pull Request** button.

#### K. Project Lead: Review the Pull Request
1. Review changes made by contributor.
2. You can send comments back and forth to discuss the work. Thank your contributor.

#### L. Project Lead: Merge the changes
1. Click on the **Merge pull request** button.
2. Close the issue; additional remarks and thanks.

----------------------------------

## Miscellaneous Tasks
#### Create a Local Git Repo (via CLI)
1. Go to the directory which you wish to make into a Git repo: `$ cd ~/GitRepos/MyProject`  
2. Initialize the directory as a Git repo: `git init`.
3. Confirm that it worked by looking for the hidden `.git` file in your directory: `ls -a`


#### Forking Someone Else's Repo (via GitHub website)
1. Go to someone else's repo and click on the **fork** button on the URC.
2. Wait while GitHub does its work.
3. Check that you now have a new repo in your GitHub account.


#### Cloning a Repo onto Your Local computer (via CLI)
```git clone URL-of-Origin-Repo Directory-Address-of-Local-Repo```  
e.g.  
```git clone https://github.com/chungkky/2017-08-02_Collaborating-with-Git.git ~/GitHubRepros_KC/2017-08-02_Collaborating-with-Git```  

--------------
## Userful Resources
* Git Cheat Sheet (CLI) https://services.github.com/resources/cheatsheets/
* Visualizing Git Concepts with D3 https://onlywei.github.io/explain-git-with-d3/
* Collaborative Development Models/Workflows https://help.github.com/articles/about-collaborative-development-models/
* SWC's Version Control with Git Lesson (CLI) https://swcarpentry.github.io/git-novice/
* Mozilla Science Working Open Workshop (WOW) lesson GitHub for Collaborating on Open Projects https://mozillascience.github.io/working-open-workshop/github_for_collaboration/
* The Pro Git Book https://git-scm.com/book/en/v2
* Atlassian has several good tutorials on Git:
  * Index of All Tutuorials https://www.atlassian.com/git/tutorials  
  * Getting Started https://www.atlassian.com/git/tutorials/setting-up-a-repository
  * Collaborating https://www.atlassian.com/git/tutorials/syncing
  * Git Workflows https://www.atlassian.com/git/tutorials/comparing-workflows


---------------

## Collaborating with Git
**Serena Jeblee, 2017-02-22**   

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
