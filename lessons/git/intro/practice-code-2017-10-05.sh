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
git remote add origin https://github.com/UofTCoders/git-training.git

## check remote configuration again
git remote -v

## once the text file is created and saved as my_cred.txt in new repo
## check file status
git status

## let us add this new file to the git index
git add my_cred.txt

## check changed file status again
git status

## commit new file to be tracked by git
git commit -m "initial commit with my info"

## if remote is set and you have an internet connection
## push changes to remote repo
git push -u origin master

## create another repo on github to test cloning/copying function of git
## let us call this repo sandbox-2017
cd ~/Documents

## clone using 
git clone https://github.com/UofTCoders/sandbox-2017.git
cd sandbox-2017

## see all files in directory
ls

## open file example_file.md in notepad or any other text editor of your choice
## you can do so from the command line using
notepad example_file.md

## after saving and closing file add file to git index and commit
git add example_file.md
git commit -m "add one new line to file"

## using diff to visualize differences between commits
git diff example_file.md

## check all the commits made to this repo
git log

## get ore info a cleaner format
git log --online

## chaneck remote version
git remote -v

## push changes to remote repo
git push origin 






