# Overview

This is a very brief introduction to programming for the web, focused on the "front end". We'll talk about
- how websites are structured (the DOM)
- a brief overview of HTML/CSS
- an introduction to JavaScript *using ECMAScript 2015 (ES6)*

## Resources

First, some resources to go more in depth after this primer.

- [Mozilla Developer Network](https://developer.mozilla.org/en-US/docs/Learn) for comprehensive documentation on HTML, CSS, JS, and relevant APIs.
- [caniuse.com](http://caniuse.com/) If you're concerned about compatibility.
* [JSfiddle](https://jsfiddle.net/) for quickly trying and sharing snippets.
    - There are other sites like fiddle out there.

## Tools

You don't need much to start

- Localhost simple webserver with a text editor
  - `http-server` (installed with `npm`)
  - `python3 -m http.server`
- Developer tools in the browser
- JSFiddle or the like

For more serious work, you'll need
- `node` the stand-alone JavaScript runtime
- `npm` the package manager included with node.js


# A website's structure

A website's source is divided into 3 components
  - HTML: content and semantics
  - CSS:  description of appearance (based on semantics)
  - JavaScript: perform actions

## In the browser

The HTML/CSS are used to create the DOM, while JavaScript interacts with it.
![rendering a website](./img/rendering.svg)

We can inspect the DOM using *Developer tools* in any browser, by menu, or right-click > inspect.



# HTML

- A way of adding semantics to text
- First designed for static documents based on SGML
  - h1-7, paragraphs, tables, links, emphasis
- Now on HTML 5, fully made with the modern web in mind
  - main, nav, section, article, header, footer, video, etc.

## Sample HTML Document

Things to note in [our sample](./sample/index.html):

- doctype is html
- `<head>` contains metadata about the page, including
  - title
  - linked files (like css)
  - scripts to run before the contents
- `<body>` contains the actual page
- Things are nested, like `section` in `body`, and `h1` in `section` and text in `h1` **this suggests a tree-like structure**.

## What are the semantics?

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

## Why provide semantics?

- Describes what elements are
  - So the browser knows how to render/place them
- Describes what actions they can do
  - video, img, links, buttons, etc.
- [Accessibility!](https://www.w3.org/WAI/eval/preliminary)

## How the browser interprets HTML

- Parsed and used to form the Document Object Model (DOM)
- The DOM is how the website is stored in memory
- Basically a tree with each `Node` an `Element`.
- Provides an API to read and edit the document in situ

## HTML pre-languages

- Opening and closing tags can be be tiresome when writing content, so a lot of developers use **Markdown** to write content. The text in `.md` format can be passed through a parser and compiled into HTML. This can be done with most markup languages.

- Even with the content written in a nicer language, the boiler-plate and layout is often tiresome, so templating languages like [mustache](https://mustache.github.io/) are popular.



## CSS

Cascading style sheets describe the *appearance* of elements.

"Cascading" refers to the way rules/declarations are applied:
 - they **cascade down the hierarchy to all children**
 - the rule with the most specific selector takes precedence
    - otherwise, rules are applied in order of the CSS file

Syntax:

*`selector`* **`{`** *`property: value;`* ... **`}`**

The whole statement is a "*rule*". Each `property: value;` pair is a "*declaration*".
 
### Selectors

Describe the elements in the DOM

- Type selectors (element name)
  - `a`, `div`, `p`, `section`, `asdf`, ...
- Class selectors start with a dot
  - `.class-name`, `a.class1.class2`
- ID selectors start with a hashmark `#`
  - `#main-nav`, `#start-button`
- Universal selector *

### Combinators

Selectors can also be combined to describe where an element falls in the DOM hierarchy.

- descendent ` ` (space)
- child `>` is an immediate descendent
- adjacent sibling `+`
- general sibling `~`
- same element: no space (e.g. `div.red-box` vs. `div .red-box`)

I read these from right to left: the selected element matches the rightmost selector, the rest describes its place in the DOM
Example:

```css
section > p + h1 {
    color: blue;
}
```

Selects the top-level heading directly adjacent to a paragraph which is the child of a section.

### Other selections

- Attribute selectors: i
  - `[attr]` has the attribute `attr`, 
  - `[attr=val]` has the attribute `attr` with the value `val`,
  - `[attr~=val]` has the attribute `attr` containing `val` in a space-separated list.
- Psuedo-classes preceded by a colon
  - `div:hover` affects a div if the mouse is hovering over it
  - `h1:first-child` only selects `h1` if it is the first child too
  - `h1:first-of-type` selects the first `h1` of its siblings
  - `p:nth-of-type(2n+1)` selects all odd paragraphs
- Psuedo-elements preceded by two colons `::`
  - Often used to add decoration ``[href^=http}::after { content: '⤴'; }

### Declarations (`property: value;`)

These describe the way an element is drawn. Different elements can have their own special properties, but no error will be given if a property doesn't apply. 

Common properties include:
 - `color` : values can be like `red`, `#f00`, `#fa0000`, `rgba(255, 0, 0, .5)`
 - `background` : as above
 - `display` : `block`, `inline`, etc.
 - `margin-top`: a length `0em`, `0.3rem`, `4px`, `1%`
 - 'visible'

You'll have to look up a reference for all the possibilities.

### Box model

It's worth mentioning the box model for element sizing/spacing.

XXX include a picture

- `margin`s are the spaces between objects
- `border`s are the size of the drawn border
- `padding` is the space between the border and the content
- `width` and `height` describe the size of the element
  - `box-sizing: content-box` is default where width/height does not include margins, borders or padding.
  - `box-sizing: border-box` makes width/height include padding and borders (easier math in many cases)

Sites with more complicated layout will often use `* { box-sizing: content-box; }`. To make the sizes consistent regardless of borders and padding.

## CSS pre-languages

CSS lacks some features that can be very useful/convenient, like
 - constants
 - nested rules for hierarchies
 - conditional logic
 - include statements

This is good for browser performance, but a pain for developers. There are lots of pre-processors for CSS that add all these features and more
 - [Stylus](http://stylus-lang.com/) *my preference*
 - [SASS](http://sass-lang.com/) 
 - [less](http://lesscss.org/)


# JavaScript (ECMAScript)

JavaScript is the scripting language supported by modern browsers. It's specified as ECMAScript, the latest standard being ECMAScript 2015 (aka ES6). All modern browsers support ES5.1, and most of (ES6)[http://caniuse.com/#search=ES6]

JavaScript is a scripting language with 
 - C-like syntax (curly braces), 
 - function scope and [lexical scoping](http://pierrespring.com/2010/05/11/function-scope-and-lexical-scoping/),
 - dynamic typing,
 - objects, and
 - first-class functions

ES6 adds
 - syntax for classes
 - template strings with the back tick \` (think  `"""`  in Python, but with `${expressions}`)
 - block-level scope with `let` instead of `var`
 - modules (not implemented in browsers as of writing)

## JavaScript pre-languages

- [TypeScript](http://www.typescriptlang.org/) superset of ES6 that adds static (duck) typing
- [Dart](https://www.dartlang.org/) a very C/C++ inspired language from Google
- [CoffeeScript](http://coffeescript.org/) -- JS with "nicer" syntax
- [PureScript](http://www.purescript.org/) inspired by Haskell
- [comprehensive list](https://github.com/jashkenas/coffeescript/wiki/list-of-languages-that-compile-to-js)

