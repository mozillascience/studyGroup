# Overview

This is a very brief introduction to programming for the web, focused on the "front end". We'll talk about
- how websites are structured -- the *Document Object Model* (DOM)
- a brief overview of HTML/CSS
- an introduction to JavaScript *using ECMAScript 2015 (ES6)*

## Resources

First, some resources to go more in depth after this primer.

- [Mozilla Developer Network](https://developer.mozilla.org/en-US/docs/Learn) for comprehensive documentation on HTML, CSS, JS, and relevant APIs.
- [caniuse.com](http://caniuse.com/) If you're concerned about compatibility.
* [JSfiddle](https://jsfiddle.net/) for quickly trying and sharing snippets.
    - There are other sites like fiddle out there.
- [Accessibility guidelines](https://www.w3.org/WAI/eval/preliminary)

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

A website is separated into 3 parts:
  - content and semantics: HTML
  - style/appearance: CSS
  - behaviour: JavaScript

## In the browser

<figure>
![rendering a website](./img/rendering.svg)
<figcaption>source: [MDN](https://developer.mozilla.org/en-US/docs/Learn/CSS/Introduction_to_CSS/How_CSS_works)</figcaption>
</figure>

The HTML/CSS are used to create the DOM, while JavaScript interacts with it.

We can inspect the DOM using *Developer tools* in any browser, by menu, or right-click > inspect.

## Exploring the DOM

Things to notice:
- Tree-like structure (root is `document`)
- Each element has 
    - tagName
    - classList
    - id
    - attributes (if applicable)
    - rendering information (e.g. `offsetHeight`)
    - events
- Nodes can be elements, but also text, etc.
    - have children and parents and siblings

# HTML

HyperText Markup Language

- A way of adding semantics to text
- First designed for static documents based on SGML
  - tags for: h1-7, paragraphs, tables, links, emphasis
- Now on HTML 5, fully made with the modern web in mind
  - main, nav, section, article, header, footer, video, etc.

```html
<tag-name attribute="value">innerHTML</tag-name>
<tag-name attribute="value" />
<!-- comments -->
```

## Sample HTML Document

Things to note in this document:

- doctype is html
- `<head>` contains metadata about the page, including
  - title
  - linked files (like css)
  - scripts to run before the contents
- `<body>` contains the actual page
- Things are nested, like `section` in `body`, and `h1` in `section` and text in `h1` **like the DOM**

## What are the semantics?

- The purpose of text is described by the tags surrounding it *e.g.*
  - `h1` is a heading
  - `p` is a paragraph
  - `ul` is an unordered list with `li` elements inside of it
  - `a` is an "anchor" (a link, or a marker in the current document)
  - `nav` is a navigation bar/menu
- built in semantics can be extended with `class` or `id`
  - classes describe properties that many elements might have
    - an element can have multiple classes in a space-separated list
    - ususally using lower-case with dashes like `red-box` 
    - e.g. `<div class="hidden slide">`
  - ids are meant to be a unique identifier for an element
    - e.g. `<nav id='main-nav'></nav>`
- also attributes like `href`, `alt`, or anything else

## Why provide semantics?

- Describes what elements are
  - So the browser knows how to render/place them
- Describes what actions they can do
  - video, img, canvas, svg...
  - links, text input, buttons...
- [Accessibility!](https://www.w3.org/WAI/eval/preliminary)
  - tools like screen-readers can navigate the page
  - tabs and associated keys work as expected

## HTML pre-languages

Writing raw HTML with all the opening and closing tags can be be quite tedious.

 - so a lot of developers use **Markdown** to write content. The text in `.md` format can be passed through a parser and compiled into HTML. This can be done with most markup languages.

- Even with the content written in a nicer language, the boiler-plate and layout is often repetitive, so templating languages like [mustache](https://mustache.github.io/) are popular.
  - especially with server-side processing


# CSS

Cascading style sheets describe the *appearance* of elements.

"Cascading" refers to the way rules/declarations are applied:
 - some declarations **cascade down the hierarchy to children**
 - the rule with the *most specific* selector takes precedence
    - otherwise, rules are applied in order of the CSS file

Syntax:

*`selector`* **`{`** *`property: value;`* ... **`}`**

The whole statement is a "*rule*". Each `property: value;` pair is a "*declaration*".
 
## Selectors

Describe the elements in the DOM. There are,

- Type selectors (element name)
  - `a`, `div`, `p`, `section`, `asdf`, ...
- Class selectors start with a dot
  - `.class-name`, `a.class1.class2`
- ID selectors start with a hashmark `#`
  - `#main-nav`, `#start-button`
- Universal selector *

## Combinators

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

## Other selections

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

## Declarations (`property: value;`)

These describe the way an element is drawn. Different elements can have their own special properties, but no error will be given if a property doesn't apply. 

Common properties include:
 - `color` : values can be like `red`, `#f00`, `#fa0000`, `rgba(255, 0, 0, .5)`
 - `background` : as above
 - `display` : `block`, `inline`, `block-inline`, `flex`, etc.
 - `margin-top`: a length `0em`, `0.3rem`, `4px`, `1%`
 - 'visible'

You'll have to look up a reference for all the possibilities.

## Box model

It's worth mentioning the box model for element sizing/spacing. 

<figure>
![box model illustration](./img/box-model-standard-small.png)
<figcaption>source: [MDN](https://developer.mozilla.org/en-US/docs/Learn/CSS/Introduction_to_CSS/Box_model)</figcaption>
</figure>

- `margin`'s are the spaces between objects
- `border`'s are the size of the drawn border
- `padding` is the space between the border and the content
- `width` and `height` describe the size of the element
  - `box-sizing: content-box` is default where width/height does not include margins, borders or padding.
  - `box-sizing: border-box` makes width/height include padding and borders (easier math in many cases)

Sites with more complicated layout will often use 

```* { box-sizing: content-box; }```, 

to make the sizes consistent regardless of borders and padding.

## CSS pre-languages

CSS lacks some features that can be very useful/convenient, like
 - constants
 - nested rules for hierarchies
 - conditional logic
 - include statements

This is good for browser performance, but a pain for developers. There are lots of pre-processors for CSS that add all these features and more
 - [Stylus](http://stylus-lang.com/) ← *my preference*
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

## Javascript types

There are primitive types:
- Boolean
- null
- undefined (*not assigned a value*)
- Number (*floating point*)
- String

Then there are notably,
- function (callable object)
- Array (mutable and extendable)

## Declaring variables

Variables can be declared with `var` or `let`. You'll probably use `var` most. 

```js
var x = 1;
var s = 'hello world';
var u; // undefined
var f = function() {
    console.log('function f called');
};
var o = {name: 'some object', callMe: f, 1: 'one'}
```

`let` is for block-scope which is good for loop variables.

```
for (let i=0; i<10; i++) {
    console.log(i)
}
console.log(i) // error

```

## Functions

Can be anonymous:

```js
(function() {console.log('hello world')})()
```

Named throughout current scope ("hoisted"):
```js
foo() // logs "bar"
function foo() { 
    console.log('bar'); 
}
```

Attached to a variable:

```js
bar() // error
var bar = function () {
    console.log('foo')
}
bar() // logs "foo"
```

## Lexical scope

The *scope* describes what variables are accessible and their names. In JavaScript, the scope of a variable defined with `var` is the current function. JS also has a lexical scope, so functions inherit the scope of their parents.

```js
// example of isolating scope with a function
var x = 10;
(function () {
    var x = document.createElement('section');
    x.innerHTML = '<h1>From Demo</h1>';
    x.className = 'slide shown';
    document.getElementById('content').appendChild(x);
})()
console.log(x);
```

## More with scope rules

Variables can become private.

```js
// Example of a closure
var counter = (function() {
    var i = 0;
    return function () {
        return i++;
    };
})();
console.log(counter())
console.log(counter())
```

## More with scope rules

We can make factories

```js
// Bigger example of a closure
var countBy = function(inc) {
    var count = -inc;
    return function() {
        count += inc;
        return count;
    }
};
c = countBy(6);
d = countBy(2);

console.log(c())
console.log(d())
console.log(c())
console.log(d())
```
    

## Objects

Object properties can be accessed with either `.` or `[]`.

```js
o.name;
o['callMe']();
o[1]
```

And properties can always be added/reassigned

```js
f.name = 'asdf';
f.obj = o;
```


## Methods/Calling

Object properties that are methods have a special variable `this` added to scope.

```js
var f = function (arg1, arg2) {
    arg2 = arg2 || 'earth';
    console.log(`called by ${this.name}`)
    console.log('object', this);
    console.log('arg1', arg1);
    console.log('arg2', arg2);
}
var foo = {name: 'bar', method: f}
```

The following are equivalent

```js
foo.method('hi');
f.bind(foo)('hi');
f.apply(foo, ['hi');
f.call(foo, 'hi');
```

## Conditional statements

The if/else if/else statement is same as in C

```js
if (condition) {
    codeBlock;
}
else if (condition2)
    statement;
else {
    codeBlock;
}
```

There is also `switch..case`, which we'll see in this app's code.

## Casting in comparison

There are two equalities in JavaScript
 - `==` or `!=` perform casting when comparing values so `12 == true` is `true`
 - `===` or `!==` don't cast, so `1 === true` is `false

Casting also happens for `<`, `<=`, etc. 

A logical "not" is the operator `!`, which does cast to booleans. So you can do `!!undefined` to get `true`.

## Loops

There are `while`, `do...while`, and `for` loops. All follow classic C syntax, but there are special forms of `for` loops

```js
var shoppingList = ['banana', 'apple', 'bread'];
shoppingList.title = 'My Groceries';

/* This will print the object's properties */
for (let i in shoppingList)
    console.log(i);

/* and this prints the elements in the _iterable_ object */
for (let x of shoppingList)
    console.log(x);

/* for arrays you could still do */
for (let i=0; i<shoppingList.length; i++) {
    console.log(shoppingList[i]);
}
```

The `for...of` syntax behaves most like Python's `for...in` loop.

## Interacting with the DOM

Go over the code for this "app".

Note:
- Not organized well ("global" variables, weird scope, etc.)
- `Element.getElementById` and `.getElementsByClassName`
- `classList.add/remove()`
- slide creation and navigation bar element creation
- this [link](#10) should go to slide 10. 


## Classes/Objects

JavaScript is *prototype*-based. This is different from *class*-based, but has similar functionality.

- An Object is like a key-value store,
- A constructor is a function applied to a prototype object
    - `var obj = new MyClass();`
- methods/properties can be through the prototype
    - `MyClass.prototype = {foo: function() { return 'foo';}, bar: 'bar'}`
- or just `ownProperty`
    - `function MyClass() { this.asdf = function() {return this.bar;}`
- properties go up the property chain
    - `obj.toString()` would go to `Object.prototype.toString.apply(obj)`

## Prototype example

```js
function A() {
    this.varA = 'a';
}

function B() {
    A.call(this);
    this.varB = 'b';
}

A.prototype = { foo: 1, bar: function(x) { return this.foo + 1;}};
B.prototype = Object.create(A.prototype);
B.prototype.foo = 3;

a = new A();
b = new B();

a.bar(1);
b.bar(1);

B.prototype.foo = -1;
b.bar(1);
```

## Class syntax

Just a syntactic wrapping of what we covered before.

```js

class C extends B {
    constructor(c) {
        super();
        this.foo = -1
        this.varC = c;
    };

    get foo() {
        return this._foo;
    };

    set foo(b) {
        this._foo = b;
    };
}
```

## Modules

The current state of modules is a bit complicated because of many players coming up with many solutions. See *AMD*, *CommonJS*, *RequireJS*, *Browserify*, or home-spun versions.

I won't be covering those here, because it is so complicated.

However, after all of that, a module is often accessible as an *object* with the supplied functions as *properties*. (*e.g.* [`marked`](https://github.com/chjj/marked) and [`hljs`](https://github.com/isagalaev/highlight.js) in the current site).

Many libraries can be installed with `npm`.

## JavaScript pre-languages

- [TypeScript](http://www.typescriptlang.org/) superset of ES6 that adds static (duck) typing
- [Dart](https://www.dartlang.org/) a very C/C++ inspired language from Google
- [CoffeeScript](http://coffeescript.org/) -- JS with "nicer" syntax
- [PureScript](http://www.purescript.org/) inspired by Haskell
- [comprehensive list](https://github.com/jashkenas/coffeescript/wiki/list-of-languages-that-compile-to-js)

