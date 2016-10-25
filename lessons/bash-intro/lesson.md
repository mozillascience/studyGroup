---
layout: page
title: Introduction to Bash
visible: false
---
<!-- change visible to true if you want it on the site -->

# My Lesson Title

 - **Authors**: John Ladan
 - **Research field**: Physics
 - **Lesson topic**: Introduction to shells and the command-line with bash.
 - **Lesson content URL**: <link>

In this tutorial, we cover the basics of interacting with a computer using Bash (the Bourne Again Shell). You may have heard the terms "command line", "terminal", "console", "shell", "interactive prompt", "git-bash", etc. To be imprecise, they all refer to using the keyboard to control your computer by typing commands.

**Preparation for this lesson**: To follow along with this lesson, you will need to have `bash` installed. For Linux and OSX users, `bash` is included as part of the operating system. In OSX, it can be accessed with `terminal`, but I recommend [iTerm2](https://www.iterm2.com/), because it has many more features that make it consistent with the Linux experience.

For Windows users, there are many options. Many people will use `git bash`, which is packaged with [git](https://git-scm.com/) (a common version control system). Others might use [Cygwin](https://www.cygwin.com/). As of August 2016, the Windows Subsystem for Linux (WSL) provides access to most command line tools provided by Ubuntu. See [here](https://msdn.microsoft.com/en-us/commandline/wsl/install_guide) for instructions to enable/install the WSL.

# Why use a command line?

- precise input
- access to new, powerful tools
- run your own programs

# Available shells

- Bash
- Zsh
- Fish (the Friendly Interactive Shell)
- rc   ("run commands" - the Plan 9 shell)
- cmd.exe
- Powershell (the better Windows shell)

# Bash command syntax

The basic unit for a command line interpreter (CLI) is a *command*. This is a line that starts with a *commmand name* followed (optionally) by *arguments*. Examples of commands are,

```
ls
ls -a
date
man date
cd Documents
rm unwanted_file
vim hello.txt
sed -e 's/cat/dog/g' pets-file
echo 'hello world'
find . -not -name '*.py' -type f -exec rm {} +
which python
cal
```

Some arguments activate/deactivate options. Usually they are prefixed by a dash `-`. For example, `ls -a` lists **a**ll files, even hidden ones. Sometimes they are longer than one character, in which case they *usually* have two dashes e.g. `--help`.

The command line options (aka flags or switches) can usualy be found in the man pages. Often there will be a `-h` or `--help` flag to display common usage.

# Common commands/tasks

There are many commands available -- any executable or built-in command. The following are some that I use more often.

- ls (-alhS...)
- cd (-)
- cp
- mv
- mkdir
- rm (-r)
- head/tail (-f)
- grep
- man

Many command names are the first two consonants of what they do: **c**o**p**y, **l**i**s**t, **m**o**v**e, **r**e**m**ove. Others are acronyms/abbreviations: **c**hange **d**irectory, **man**ual, **s**tream **ed**itor.

## Explanations

To list files, use `ls`. Common flags include `-a` for all files, `-l` for the full details (size, date, permissions...), `-h` for "human-readable" file sizes,  `-S` to sort by filesize.

Change directories with `cd`. On many systems, `cd` with no arguments changes to your home directory (`cd ~`), and `cd -` changes to your previous directory.

Copy and move files with `cp` and `mv`. The last argument is the new filename/directory. E.g. `cp a.py b.py c/` copies files `a.py` and `b.py` into the `c` directory. **Warning** `cp` and `mv` will overwrite files without warning you.

Remove files with `rm`. The files cannot be recovered easily, and you won't be asked for confirmation. Directories won't be removed unless you use `-r` (for **r**ecursive.



# Pipes (stdin/out)

- people with R might be familiar with the concept
- pass grep to wc?

# Variables

- No spaces around `=`!
- path variable
- everything's a string
- using ${} to get the value

# Loops

- for loop syntax
- for fn in *.py; do echo $fn; done
