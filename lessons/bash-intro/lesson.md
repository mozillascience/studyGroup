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
- head/tail (-nf)
- grep
- man

Many command names are the first two consonants of what they do: **c**o**p**y, **l**i**s**t, **m**o**v**e, **r**e**m**ove. Others are acronyms/abbreviations: **c**hange **d**irectory, **man**ual, **s**tream **ed**itor.

## Explanations

To list files, use `ls`. Common flags include `-a` for all files, `-l` for the full details (size, date, permissions...), `-h` for "human-readable" file sizes,  `-S` to sort by filesize.

Change directories with `cd`. On many systems, `cd` with no arguments changes to your home directory (`cd ~`), and `cd -` changes to your previous directory.

Copy and move files with `cp` and `mv`. The last argument is the new filename/directory. E.g. `cp a.py b.py c/` copies files `a.py` and `b.py` into the `c` directory. **Warning** `cp` and `mv` will overwrite files without warning you.

Remove files with `rm`. The files cannot be recovered easily, and you won't be asked for confirmation. Directories won't be removed unless you use `-r` (for **r**ecursive.

Probing contents of files with `head`, `tail`, `grep`. `head -n 10` shows the first 10 lines, and `tail` shows the last few lines in a file. To search for every line that contains a string, use `grep`. E.g. `grep pony animals.txt` finds the string "pony" in the file `animals.txt`.

Finally, `man` provides manual pages for most commands that you can use from bash. Syntax: `man <command-name>`.

# Files

Many commands end up using files, so it's good to have an idea of how to name them. Files are specified in arguments with a *pathname*.

    [directory-name/]filename

Except for a few cases, the pathname is relative to the *current working directory*. So if you are in your home directory, `Desktop/my_script.py` refers to the `my_script.py` file in your own Desktop folder, not anyone else's. If you're in your `Desktop` folder, then `Desktop/my_script.py` refers to a file inside the Desktop folder inside your Desktop folder (which probably isn't there), but `my_script.py` refers to the previous file.

Try it out: from your home directory, run the following commands (`touch` creates a file):

```
mkdir tmp
touch tmp/file_a
ls
```

In the list of files, you should see the `tmp` directory, but no `file_a`. Now execute

```
ls tmp
```

you should see the files in the `tmp` directory (`file_a`). Now try

```
cat tmp/file_a
cd tmp
cat tmp/file_a
```

What went wrong?


## Absolute paths

Sometimes, you'll need to access files from another location in the file hierarchy. With relative paths, you can use `..` to access the parent directory, so `../../src/include/` goes up two directories, then down through `src` and `include`. This can get cumbersome if you're not sure exactly how many times you need to go up. 

Instead, there are absolute paths.

TODO: talk about `/home/...` and `~/`

Most of the time working with scripts, you should use relative paths, because one cannot assume the state of another's filesystem.


# Globbing

For when you want more than one file.

# Pipes (stdin/out)

- people with R might be familiar with the concept
- pass grep to wc?

## Multiple commands in a line

# Variables

- No spaces around `=`!
- path variable
- everything's a string
- using ${} to get the value

# Loops

- for loop syntax
- `for fn in *.py; do echo $fn; done`

# Wrapping up

At first, using the command line might seem cumbersome, and like a lot to remember. But this is just like learning any language: at first you will be limited by your vocabulary, but with time and practice you'll be able to do much more.

A tools you may want to look into when working with more files/strings are:
 - Regular expressions. Used in tools like `grep` and `sed` are great for searching in strings/files.
 - `find` can do some really powerful things when working with files.
 - `xargs` creates/executes commands built from `stdin`
