## <- this is a comment

## general command line tips
## use tab completion: when you start typing something, hitting 'tab' will finish it for you.
## use the 'up' arrow to cycle through past commands (to avoid re-typing)
## for Git commands, typing git <command> --help will show a help page

## Configure your local git setup. This only needs to be done once. Only the first two are essential.
git config --global user.name "Your Name"
git config --global user.email "you@some.domain"

## other optional configurations
git config --global color.ui "auto" 

## setup an editor for text files (if you need one)
## you can use any editor you like, such as atom, notepad, vim, etc.
## more help on setting up editors
## https://help.github.com/articles/associating-text-editors-with-git/
git config --global core.editor "your_editor"

## List all the configurations completed
git config --list

## cd = change directory (move to another folder)
## note: "cd .." moves you back one folder
cd ~/Documents
## for windows users with full path
cd C:/Users/user_name/Documents

## mkdir = make directory (create a folder)
mkdir git-training

## move to the new folder
cd git-training

## convert folder to git repo
git init

## check remote configuration of new git repo
git remote -v

## setup new remote for empty remote
git remote add origin sandbox_repo_remote_url

## check remote configuration again
git remote -v

## once the text file is created and saved as my_cred.txt in new repo
## check file status
git status

## let us add this new file to the git index
git add ~/Documents/git-training/my_cred.txt

## check changed file status again
git status

## commit new file to be tracked by git
git commit -m "initial commit with my info"

## clone = copy the repo from GitHub to your computer
## In the terminal (still in the GitHub folder), type:
git clone https://github.com/your-account-name/studyGroup
cd studyGroup

## creating a local git repo and pushing it to your origin on GitHub
cd ..
mkdir new_local_repo
cd new_local_repo




## First, fork the 'studyGroup' repo from the UofTCoders group.  Forking
## just means copy over into your own account. Click "fork" in the top right corner.
## url: https://github.com/UofTCoders/studyGroup





