---
title: "Learning Markdown"
author: Lina Tran
date: June 28, 2018

# for including LaTeX packages
header-includes:
    - \usepackage{fullpage}
    - \usepackage{setspace}
    - \usepackage[section]{placeins}
    - \doublespacing

# for citations
bibliography: library.bib
citation-style: nature.csl
---


# Header 1
## Header 2

This is a test of *pandoc* **formatting**.

# Unordered Lists

- list one
- list two
- list three


* list one
* list two
* list three

# Ordered Lists

1. ordered list one
    1. subitem
    2. subitem
2. ordered list two
5. The numbers themselves are ignored

# Horizontal Rules

--------------------

lines

---------------------

# New Lines and Paragraphs

This is one line with two spaces after the end.  
This will be a new line.
This will not be.

This will also be a new line.

## Block Quotes

> This is a block quote. this
> paragraph has two lines. There
> must be a space after the `>`.
>
> 1. This is a list inside the block quote
> 2. Second subitem

> This is also
possible

> 1. First
2. Second

# Code Chunks

```python
num_list = [12,3 + 4, 1]
def random_function(param):
    return param*param
```


## Tables using pipe_tables

`pandoc document_1.md -o document_1.pdf -f markdown+pipe_tables`

| Right | Left | Default | Centered |
|------:|:---------|---|:--------:|
|12|12|12|12|
|132|12|2|12|


# Links
## Automatic and In Line Links

<http://google.com>
<jane.doe@email.com>

This is an [inline link](https:/pandoc.org)

## Reference Links
[my-label-1]: test1.pdf

Here is [my link][my-label-1].

## Internal Links

See the section on [Code Chunks].

[Code Chunks]: #new-lines


# Images
![picture](picture.jpg){ width=50% }


# Citations

`pandoc --filter pandoc-citeproc document_1.md -o document_1.pdf`

This is a fact [@Srivastava2014]
This fact is proven by many papers [@Joyce2013; @Omer2018; @Noor2010]

# \LaTeX

$H=\sum\limits_{i=1}^k |x_{i} - y_{i}|$  

# Pandoc Commands

For simple conversions, pandoc can infer based on file Extensions

`pandoc document_1.md -o document_1.pdf`

If you have a reference word document with custom styles:

`pandoc document_1.md -o document_1.docx --reference-doc reference.docx
`

For using an extension:

`pandoc document_1.md -o document_1.pdf -f markdown+extension_name`

To use citations add ` --filter pandoc-citeproc`:

pandoc document_1.md -o document_1.pdf -f markdown+pipe_tables -t pdf --filter pandoc-citeproc


# References
