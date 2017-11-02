---
layout: page
title: Intro to Pandoc and Markdown
visible: true
tags:
  - misc
  - beginner
---

 - **Authors**: Dano Morrison
 - **Research field**: Neuroscience
 - **Lesson topic**: How to use Pandoc and Markdown for writing scientific manuscripts
 - **Lesson content URL**: <https://github.com/UofTCoders/studyGroup/tree/gh-pages/lessons/misc/pandoc-intro>

# Intro to Pandoc

Do you enjoy the spartan, academic aesthetic of LaTeX documents but not have the time to learn its unforgiving syntax? Does writing HTML documents by hand make you feel uncool? Do you enjoy automating difficult things? If so, Pandoc is what you're looking for. 

Pandoc is a command line tool that you can use to automatically convert files from markup format to another. With Pandoc, you can write in something easy like Markdown, Microsoft Word, or LibreOffice, and convert it something hard like:
- HTML
- Ebook formats
- LaTeX
- PDF
- and many others

# Intro to Markdown

Markdown is the best way to write things for Pandoc, and probably the best way to write things for publishing to the web. If you haven't heard of it, it's a lightweight, shortened version of HTML that uses simplified tags like `* ~ - #` to format documents. It's mostly writing plain text, but with a little practice you can easily implement the most common types of text formatting, like headings, lists, links, images, etc. The veritable bible of Markdown is [Daring Fireball.](https://daringfireball.net/projects/markdown/)

# The Value Proposition

With Markdown and Pandoc, you can write something that looks like this:

~~~
# Introduction

## The globular theory of matter

### A history of globbing
If we accept the philosophical (and now scientifically incontrovertible) position that the movement of all rotund entities are mediated by underlying interactions between globular units, then it follows that whenever a globby is stored in the world such that it can be reglobbed at a later time (ie. a glob-memory), there must be some concurrent change that occurs in the underlying structure of globby particles.

Many great scientists have dedicated their lives to the study of globs and greatly advanced the globular theory of matter. In the next decade, who knows what globular secrets will be unearthed?
~~~

That can be converted into HTML like this:

---

# Introduction

## The globular theory of matter

### A history of globbing
If we accept the philosophical (and now scientifically incontrovertible) position that the movement of all rotund entities are mediated by underlying interactions between globular units, then it follows that whenever a globby is stored in the world such that it can be reglobbed at a later time (ie. a glob-memory), there must be some concurrent change that occurs in the underlying structure of globby particles.

Many great scientists have dedicated their lives to the study of globs and greatly advanced the globular theory of matter. In the next decade, who knows what globular secrets will be unearthed?

---

and even converted into LaTeX so it looks like this:

![alt text](../simplelatexsample.png)

The real power of Pandoc, however, comes when, with style templates and a little extra formatting work, you're able to produce fully typeset and personally styled documents with a markdown file and a command line.

![alt text](../complexlatexsample.png)

Boom! Page numbers and everything!

# Getting Started

- Install [Pandoc](https://pandoc.org/installing.html)
- Install LaTeX: [TeXLive (Linux)](https://www.tug.org/texlive/), [MacTeX (Mac)](https://www.tug.org/mactex/), [MikTeX (Windows)](https://miktex.org/)
- Install XeTex?

Whether you're doing something like `sudo apt-get install pandoc && apt-get install texlive` or `brew install pandoc && brew cask install mactex`, if you can run `pandoc -v` and `pdflatex -v` in a terminal, you're good to go.

# Markdown

*italics*
**bold**

- one
- two
- three

1. one
2. two
3. three

[example link](https://example.com/)

![example image](/path/to/img.jpg)

refer to `code` inline with backticks

```JavaScript
console.log('or define a whole bunch of code with three back ticks')
```

# Pandoc 

Once Pandoc is installed, the easiest way to convert a file is to open up your terminal (in the folder where your file is) and call:
`pandoc <filetobeconverted> -o <newfilename.xx>`
Where `.xx` is the file extension of the new file you want

By default, this will produce a 'fragment' of the file type you want. If you'd like to create a standalone document you need Pandoc to generate some code for you rather than just have it convert the Markdown markup to another language. If you want to create an HTML page with Head and Body sections or a LaTeX document with all the necessary boilerplate, simply add `-s` after the file you want to convert in your terminal command.

For example,
`pandoc sample.md -s -o sample.tex`
will take this

```Markdown
# Just learning

Pretty *cool* stuff

![image](./image.jpg)
```

and produce all of this

```Tex
\documentclass[]{article}
\usepackage{lmodern}
\usepackage{amssymb,amsmath}
\usepackage{ifxetex,ifluatex}
\usepackage{fixltx2e} % provides \textsubscript

....

\begin{document}

\section{Just learning}\label{just-learning}

Pretty \emph{cool} stuff

\begin{figure}[htbp]
\centering
\includegraphics{./image.jpg}
\caption{image}
\end{figure}

\end{document}
```

That's sure better than writing all that stuff yourself! 
You can also go straight to pdf (if you have the right dependencies installed) with
`pandoc sample.md -s -o sample.pdf`

You may have figured out that `-o` stands for 'output' and `-s` stands for 'standalone.' There's also a lot of other pandoc command modifiers that you can take a look at any time by running `pandoc -h`

You can also combine multiple input files into one output files with the regular character `*` (it's not a special pandoc feature, but pandoc supports having multiple files thrown at from the terminal). 
`-H` Will let you include other files as the header of whatever you're producing
`-V` will let you pass variables (ie. fontsize, documentclass for LaTeX documents)

[This manual](https://pandoc.org/MANUAL.pdf) will be helpful for understanding these advanced features.

# Advanced: Custom LaTeX templates for Pandoc
Chances are, if you actually are trying to publish something in LaTeX, you're going to want to put your own style on things. It's not that hard to do with Pandoc, all it takes is:
1. saving a Pandoc LaTeX template somewhere
2. edit that template the way you want
3. tell pandoc to use that template in producing an output

## 1. Pandoc LaTeX Templates
These aren't just regular LaTeX templates but Pandoc-specific templates that instruct Pandoc how to convert files into LaTeX. Here's an [example of one](https://github.com/jgm/pandoc-templates/blob/master/default.latex)

## 2. Editing the templates
If you want to expand on what the template provides, you can go into it and change or add things, maybe specific fonts or packages you would like to use

## 3. Use that template to generate an output
The easiest step, simply add a `--template=yourtemplate.tex` modifier into your console command. Make sure that your template is either in your working directory or in `/.pandoc/templates` *NOTE: You have to make this directory yourself*.
You can use variables in the template such as `fontfamily` to style your own file. Example:
`pandoc sample.md -o sample.pdf --template=mytemplate.tex -V fontfamily=sans`



