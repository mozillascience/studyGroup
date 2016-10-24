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
date
cd Documents
rm unwanted_file
vim hello.txt
sed -e 's/cat/dog/g' pets-file
echo 'hello world'
find . -not -name '*.py' -type f -exec rm {} +
which python
cal
```

# Pipes (stdin/out)

