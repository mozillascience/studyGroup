## <- this is a comment

## general command line tips
## use tab completion: when you start typing something, hitting 'tab' will finish it for you.
## use the 'up' arrow to cycle through past commands (to avoid re-typing)
## for Git commands, typing git <command> --help will show a help page

## Configure your local git setup. This only needs to be done once. Only the first two are essential.
git config --global user.name "Your Name"
git config --global user.email "you@some.domain"
git config --global color.ui "auto" 
git config --global core.editor "your_editor"

## List all the configurations completed
git config --list

## cd = change directory (move to another folder)
## note: "cd .." moves you back one folder
cd ~/Documents

## mkdir = make directory (create a folder)
mkdir GitHub

## move to the GitHub folder
cd GitHub

## First, fork the 'studyGroup' repo from the UofTCoders group.  Forking
## just means copy over into your own account. Click "fork" in the top right corner.
## url: https://github.com/UofTCoders/studyGroup

## clone = copy the repo from GitHub to your computer
## In the terminal (still in the GitHub folder), type:
git clone https://github.com/your-account-name/studyGroup
cd studyGroup

## Those with internet problems can do this: create a folder called
## sandbox, move into that folder, and create an empty git repo (init)
## git init = initialize a git repo (start an empty git repo in that folder)
mkdir sandbox && cd sandbox && git init

## ls = list files and folders in the current location
ls

## pwd = print working directory (see what your current location is)
pwd

## git status = check the status of your folder - see if there are any changes.
git status

## move into the _data folder, see what's there
cd _data
ls

## cat = prints to the screen the contents of a file (also used to join files together)
cat members.yml

## Add yourself to the members list!
## typing "nano filename" opens the file in the editor nano. 
## you can use any editor you like, such as atom, notepad, vim, etc.
nano members.yml

## git status = check the status of your repository
## you'll see a changed file
git status

## add = track and put the file into the git staging area (staging
## just means ready to be saved into the history, but not actually
## saved)
git add members.yml
git status ## just to see what happened

## commit = save everything in the staging area into the history (the
## git repo).  -m = the commit message to be included in the history.
## Try to be descriptive with this message.
git commit -m "Added myself to the members list"

## log = check the saved history
git log
git status ## should be all clean again

## Make some more edits to the members file
nano members.yml
git status

## diff = compare the contents of the current file with the
## (essentially) previous commit.
git diff members.yml

## When you add a filename to the commit command, git will save that
## file directly into the history. This bypasses the staging area.
git commit members.yml -m "Added a line to my bio"

## Check your history of the saved commits.
git log

## Viewing history: git checkout

## checkout = go back, forward, or around to different commits (or
## branches) in your commit history.  c1361 is the (completely!!)
## unique commit hashtag (you can see the hash when you do git log; no
## one will have the same hash!). 

## open a file browser and look at the _members.yml file. 
## run the command below (with the right commit id) and then look at the file again.
git checkout c1361 ## this takes you back in time to the state at this commit id. 

## you are now in the legendary DETACHED HEAD state.
## If you make any changes and commit them here, you'll need to
## create a branch so that you can find them back later. 
## Otherwise they'll eventually disappear forever.
## git checkout --help has details about this. 

## -- = anything after this is a file.
## So basically, this command will take the file from c1361 and bring
## it into your current location... reviving a file from the
## dead! This takes ONLY the file members.yml, and no other changes. 
git checkout c1361 -- members.yml

git status ## will show the members.yml file as modified, 
## since now you have a different version than the last commit.

## If you want to go back to the state after the latest commit:
git checkout -- members.yml 
## since we didn't specify a commit, this assumes the latest commit, and give you that version

## If you like the old version better:
git commit -m "I'm keeping the old version"

## push = upload your git repo to GitHub, basically syncing it.
git push

## remote add = set another GitHub to download from.  This remote is
## called 'upstream'.  Having this remote allows you to keep
## up-to-date with the original repo.
git remote add upstream https://github.com/UofTCoders/studyGroup

## -v = verbose (show a detailed description of your remote
## -locations/urls)
git remote -v

## pull = download.  This syncs your local repo with the original
## repo.
git pull upstream master

## Sync your local repo with your own forked repo on your GitHub
## account (not the original).
git push

