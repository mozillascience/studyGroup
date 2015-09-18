## <- this is a comment

## Configure your local git setup. This only needs to be done once.
git config --global user.name "Your Name"
git config --global user.email "you@some.domain"
git config --global color.ui "auto"
git config --global core.editor "your_editor"
git config --global push.default current

## List all the configurations completed
git config --list

## cd = change directory (move to another folder)
cd ~/Desktop

## mkdir = make directory (create a folder)
mkdir practice2/

## First, fork the 'sandbox' repo from the UofTCoders group.  Forking
## just means copy over into your own account.

## clone = copy the repo from GitHub to your computer
git clone https://github.com/your-account-name/sandbox
cd sandbox

## Those with internet problems can do this: create a folder called
## sandbox, move into that folder, and create an empty git repo (init)
## init = initialize a git repo (start an empty git repo in that folder)
mkdir sandbox && cd sandbox && git init

## ls = list files and folders in the current location
ls

## pwd = print working directory (see what your current location is)
pwd

## touch = create a new text file
touch your-name-bios.txt

## Edit the file and add stuff to it

## See the content of the file
cat your-name-bios.txt

## add = track and put the file into the git staging area (staging
## just means ready to be saved into the history, but not actually
## saved)
git add your-name-bios.txt

## commit = save everything in the staging area into the history (the
## git repo).  -m = the commit message to be included in the history.
## Try to be descriptive with this message.
git commit -m "Added my bio"

## log = check the saved history
git log

## Make some edits to the bio file

## status = check what is happening in non-saved files.  This shows
## things that have been modified or are untracked.
git status

## diff = compare the contents of the current file with the
## (essentially) previous commit.
git diff your-name-bios.txt

## When you add a filename to the commit command, git will save that
## file directly into the history. This bypasses the staging area.
git commit your-name-bios.txt -m "Added a line to my bio"

## push = upload your git repo to GitHub, basically syncing it.
git push

## remote add = set another GitHub to download from.  This remote is
## called 'upstream'.  Having this remote allows you to keep
## up-to-date with the original repo.
git remote add upstream https://github.com/UofTCoders/sandbox

## -v = verbose (show a detailed description of your remote
## -locations/urls)
git remote -v

## pull = download.  This syncs your local repo with the original
## repo.
git pull upstream master

## Sync your local repo with your own forked repo on your GitHub
## account (not the original).
git push

## Make edits and commit to the history.
git commit your-name-bios.txt -m "Added line on type of analysis"

## Upload and sync with your forked repo.
git push

## Check your history of the saved commits.
git log

## checkout = go back, forward, or around to different commits (or
## branches) in your commit history.  c1361 is the (completely!!)
## unique commit hashtag (you can see the hash when you do git log; no
## one will have the same hash!). -- = anything after this is a file.
## So basically, this command will take the file from c1361 and bring
## it into your current location... basically reviving a file from the
## dead!
git checkout c1361 -- your-name-bios.txt

## You can confirm that the file is different from before!
cat your-name-bios.txt

