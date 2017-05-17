# Contents file

Look at me!

# Outline

## Overview
- A website's information is divided into 3 components
  - HTML: content and semantics
  - CSS:  description of appearance (based on semantics)
  - javascript: perform actions

## HTML

- A way of adding semantics to text
- First designed for static documents based on SGML
  - h1-7, paragraphs, tables, links, emphasis
- Now on HTML 5, fully made with the modern web in mind
  - main, nav, section, article, header, footer, video, etc.

### Sample HTML Document

Things to note in [our sample](./sample/index.html):

- doctype is html
- `<head>` contains metadata about the page, including
  - title
  - linked files (like css)
  - scripts to run before the contents
- `<body>` contains the actual page
- Things are nested, like `section` in `body`, and `h1` in `section` and text in `h1` **this suggests a tree-like structure**.

### What are the semantics?

- The purpose of text is described by the tags surrounding it
  - `h1` is a heading
  - `p` is a paragraph
  - `ul` is an unordered list with `li` elements inside of it
  - `a` is an "anchor" (a link, or a marker in the current document)
  - `nav` is a navigation bar/menu
- built in semantics can be extended with `class` or `id`
  - classes describe properties that many elements might have
    - an element can have multiple classes in a space-separated list
    - ususally using lower-case with dashes like `red-box` 
    - e.g. `<div class="hidden aside">`
  - ids are meant to be a unique identifier for an element
    - e.g. `<nav id='main-nav'></nav>`

### Why provide semantics?

- Describes how to render elements
- Describes what actions they can do
- [Accessibility!](https://www.w3.org/WAI/eval/preliminary)

