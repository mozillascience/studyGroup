---
layout: page
title: 'Debugging in Python'
visible: true
tags:
  - python
  - intermediate
---

 - **Author**: John Ladan
 - **Lesson topic**: Introduction to Debugging in Python
 - **Lesson content URL**: <https://github.com/UofTCoders/studyGroup/tree/gh-pages/lessons/python/debugging>
 - **Lesson video stream**: <https://www.youtube.com/watch?v=E6UfaNyLdps>

## Preface: ##

Debugging is really an art form. In this tutorial, we'll cover some concepts and tools you can use for debugging, but the skills need time to develop.

The tutorial breaks debugging into three basic steps: testing code, finding bugs, and fixing them. Testing is a large topic on its own -- there's even a [blog/podcast about it](http://pythontesting.net/start-here/). We'll only cover some basics and the [`unittest`](https://docs.python.org/3.5/library/unittest.html) framework, so you may want to check out that blog to learn more.

The bulk of this tutorial is about finding bugs. The only tools required are Python (`pdb` is included) and a text editor. However, I will give a demo using [Spyder](https://github.com/spyder-ide/spyder) to show how an IDE can help. Many other IDEs have the same (or more) features, but Spyder was convenient for me and is FOSS (free as in beer and speech).

Fixing bugs is very code specific, thus not covered in detail.

Sources: [wikipedia](https://en.wikipedia.org/wiki/Debugging), [Python Testing](http://pythontesting.net/), [Python Conquers The Universe (Debugging in Python)](https://pythonconquerstheuniverse.wordpress.com/category/python-debugger/), [Python Documentation](https://docs.python.org/3.5/index.html)

## Outline: ##

- What is debugging?
- Hunting for bugs (testing)
    - interactive testing
    - unit tests
- Finding bugs (search)
    - stack traces
    - print statements everywhere!
    - using `pdb`
    - long-term debugging (user warnings)
    - reporting (to OS projects)

## What is debugging? ##

Quoting Wikipedia, "Debugging is the process of finding and resolving of defects that prevent correct operation of computer software or a system."
In reality, it is a very large topic with many different methodologies and steps. We're going to focus on finding bugs, and talk a little about prevention.

There are two forms of finding bugs: discovering their existence (testing), and searching for the cause in the code (finding). The debugging cycle typically goes

    test -> find -> fix -> test -> ...

## Testing ##

There's a whole range of things that fall under testing, from running the program and seeing if it gives you the output you want to a full suite of unit tests run every time you commit your changes. In Python, the most common form of testing is through *interactive debugging* using the REPL.

    # Demonstrate here

The REPL has been a major feature of interpreted languages like Python for good reason: quick and dirty testing.
 - Don't know how a library function behaves? Test it in the REPL.
 - Unsure of your syntax? Check it in the REPL.
 - Not sure how to tackle a problem? Try it step by step with some test data in the REPL.

Where this form of testing falls through is consistency and automation. Every time the developer makes a change, she has to remember what to test and type it into the command line. Even with tab completion, or copy and paste, this is repetitive and tests will be missed.

That's where unit tests come in. Unit tests are the smallest testable parts of a program. That smallness of them makes them easier to automate, and also (as we'll see) easier to debug. Python includes a module [`unittest`](https://docs.python.org/3.5/library/unittest.html) that can handle this work flow.

As an example, let's make a function that will split a list in the middle. It will take a list of arbitrary length, and return a tuple containing (first half, middle element, last half). We'll follow a Test Driven Design (TDD) style, and create the tests first. This clearly defines the behaviour.

```
import unittest

class TestSplitter(unittest.TestCase):

    def test_simple_case(self):
        self.assertTupleEqual(splitter([1, 2, 3]), ([1], 2, [3]))

    # TODO: More tests (hint: length of list)

if __name__ == '__main__':
    unittest.main()
```

A good testing suite should include a few examples of normal/expected input as well as any edge cases you can think of. Let's fill in more tests now.

Now, run the suite (which will get us into debugging/finding mode)

    python test_splitter.py
    # or
    python -m unittest
    # or
    python -m unittest -v test_splitter

(The `unittest` module has *test discovery* that will search for tests in the current directory using some rules.)

First, we'll suppress the errors by actually defining the function. Next, we'll come up with a solution (and hopefully make a few mistakes along the way.
    
## Finding bugs ##

After discovering that a bug exists, the next challenge is finding where the bug is in code. We've already seen how unit testing can help narrow it down to a function, but what if that function is more complicated, or we get an error, or the bug came up in use and not in testing?

There are a few tools for this.

Fist, stack traces. These are the messages the Python interpreter gives when there's an uncaught exception. At first, they may seem cryptic, but it's pretty straight-forward. From bottom to top, the trace prints:

 - the error type and message (e.g. SyntaxError, IndexError, ...)
 - [the line in which the error happened]
 - the function in which the error happened, along with the filename and line number
 - The filename, line number, and function that called the function with the error (and all the way up the stack)

We'll see an example of this with a partially working `splitter` function.

### Print debugging ###
Sometimes the stack trace isn't enough, like when a function returns the wrong value, or you're not sure if a loop is behaving properly. The quick fall-back for this is to insert print statements wherever you're unsure of the value.


Let's do a little debugging of a broken average-taking function.


### Using `pdb` ###

This is the more sophisticated way. You may have noticed that one annoyance with `print` is that you need to quit and restart python whenever the function definition is changed. Using `pdb`, the execution is interrupted, and we can check the values of variables whenever we like.

To use `pdb`, you first need to import it, and add the line `pdb.set_trace()` where you'd like to start doing introspection. e.g.

    import pdb

    def average(xs):
        pdb.set_trace()
        length = len(xs)
        acc = 0
        for i in range(1, length):
            acc = acc + xs[i]
        return acc/length

Next, when the execution is interrupted, use the commands

 - `p <variable>` for printing the value of a variable
 - `n` to execute the next line
 - `s` to step into a function call
 - `c` to continue execution
 - `!<code>` to run any line of python (including changing values)

Lets repeat the demo for `average()` using the debugger in Spyder (which just runs `pdb` for us).

Note: sometimes print debugging is still useful, like in a loop if you don't want to stop every iteration, but want to see the values as they come up.

### Helping the user ###

There are a couple other problems with using `print()` for debugging:

 - you may forget to remove a print statement
 - it messes up unit tests
 - it corrupts the useful output to the user with debugging output

For these reasons, it's better to use the [`logging`](https://docs.python.org/3/howto/logging.html#logging-basic-tutorial) module.

Using `logging.debug()` instead of `print()` lets you output the debugging statements to a file, instead of `stdout`. An example from the python docs,

    import logging
    logging.basicConfig(filename='example.log',level=logging.DEBUG)
    logging.debug('This message should go to the log file')
    logging.info('So should this')
    logging.warning('And this, too')

Creating logs this way will also automatically format the messages (which you can customize). This is a good way to provide debugging data to your users, like warnings that their data is in the wrong format or that another function is better.

### A brief mention of reporting bugs ###

It should also be mentioned that users can report bugs to developers. Each project likely has its own bug tracking system, but GitHub and other hosts provide issue trackers. It's a good idea to let users report bugs, and to report bugs in other projects that you use.

With more practice in fixing bugs, you'll also have a better idea of what should be included in a bug report.
