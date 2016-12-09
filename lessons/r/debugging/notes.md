# RStudio - beyond the editor

- **Author**: Thea Van Rossum
- **Lesson Topic**: RStudio Debugging

## Set-up
1. Open a new project in RStudio, save it somewhere
2. Download these two files: [printTriangle.R](https://raw.githubusercontent.com/theavanrossum/debuggerRMarkdownLesson/master/printTriangle.R), [crazify.R](https://raw.githubusercontent.com/theavanrossum/debuggerRMarkdownLesson/master/crazify.R)
3. Add these files to your project


## Pre-test 
Let's get a feel for the room. Who here:
* knows what an IDE is?
* has used RStudio before?
* has used a debugger before?
* has written an R function before?
* who is here for debugging? (this will be the focus today!)
* who is more interested in Rmarkdown or making packages? - maybe for a future lesson or quickly at the end


## Motivation
RStudio is a kind of software that programmers call an "IDE": integrated development environment. IDEs can (and do) exist for hundreds[1] of languages. The reason they're so ubiquitous is that they make your life SO MUCH EASIER. That's what they were designed to do: make coding easier. They do so with, typically, three main components: source code editor, build automation tools and a debugger. We'll look at some of these features today. 

[1] Totally guessing here. But there are lots, at least dozens.

## Getting Oriented
Say hello to RStudio.
Four main panels:
* Top left: Script viewer - this is the best place to write your code
* Bottom left: Console - this is where R is actually running, it's a dangerous place to write your code
* Top right: Variable/history displayer
* Bottom right: Files/plots/packages/help displayer 

Note that you can move these windows around, if you like.

## The Debugger
Let's not waste any time and push right into the good stuff.

### Dealing with unexpected results

1. open a the printTriangle.R script
2. click "source" in the top right

Read the description of what this method should do and look at the output. Does the output look right? Nope.

(Side note: yes this uses loops, and yes loops are a no-no in R. But they're great for watching a debugger work so just relax go with it, ok? ok.)

There aren't any errors... so we just did something wrong. We could put in a bunch of print statements but let's try something less painful: the debugger!

#### Breakpoints
The first thing we need to do is add a "breakpoint". A breakpoint tells R to pause ("break") while it's running and open up a hatch for us to crawl inside the machine amongst the cogs to look around.

We add a breakpoint by clicking next to the left of the line number. Then let's press "source" again.

(Thea will now describe the changes in the IDE that happen when you enter debugger mode. Including: describe control buttons, click through next to see what's going on)

Aha - we can see what's going wrong here: stars is growing, not being reset with every loop. An easy fix.

### Dealing with errors

1. open a the crazify.R script
2. click "source" in the top right

Oh no, a wild error has appeared!
Luckily, R gives us a great description of what went wrong and why:

```
Error in strsplit(word, "") : non-character argument 
```

Hm. Or not.
Let's see what "Show Traceback" gives us.

### Stack
The "traceback" shows us the series of commands (aka "stack") that led to the error.

```
 Error in strsplit(word, "") : non-character argument 
7 strsplit(word, "") at crazify.R#3
6 reverseLetters(vec[i]) at crazify.R#19
5 crazify("here i am") at crazify.R#24
4 eval(expr, envir, enclos) 
3 eval(ei, envir) 
2 withVisible(eval(ei, envir)) 
1 source("C:/Users/tvanrossum/Dropbox/ScientificProgrammingStudyGroupSFU/debuggerRMarkdownLesson/crazify.R", 
    echo = TRUE) 
```

Ok, so now we know where the script when wrong but the cause is still not clear. Let's see what RStudio's debugger can do for us. 

### Breakpoints
Let's add a "breakpoint" where the error occurred, at line 3. Or we can click "Rerun with Debug", which will rerun the last command and break when it encounters an error.

Now we're in debug mode again. Check out the "Traceback" window on the right -- this shows us where we are and allows us to jump to different parts of the code. Let's jump up a level and look around.

Ok, everything looks fine there, let's get back down to where the error occured.

The "word" entry in the "values" pane isn't very useful. But we can use the console to get a better look. (Fun note - we can also use the console to change values mid-execution!)

Let's type in "word" in the console to see what's going on.

Aha. word is a list here, not a vector. I forgot to call unlist on the results of strsplit (line 17). Easy to fix.

And let's not forget to remove our breakpoint.

# Challenge 

Try calling confuseTheCustomers() on the myMenu object in crazify.R:
```
confuseTheCustomers(myMenu) 
```

It fails! Try using the debugger to fix it.


##Other ways to debug
You can also call the debug() function on a function (like: debug(crazify)) and you can stick the browser() command into a function -- like a breakpoint. 

Check out https://vimeo.com/99375765 for more

# If time remains...

Vote: who wants to:

1. Work on some of your own code and force yourself to use the debugger when you hit any issues.
2. Look at how to create a package in RStudio
3. Get a breif intro to using RMarkdown



Answers:
> Triangle: stars<-"" should be in the i loop || Crazify:
(1) missing unlist from strsplit in crazify function
(2) missing stringsasfactors = F in definition of myMenu
(3) need to use sapply instead of trying to call: crazify(menu$Descriptions) 
