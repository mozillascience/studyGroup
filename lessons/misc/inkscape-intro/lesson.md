---
layout: page
title: 'Intro to Inkscape for graphic design'
visible: true
tags:
  - misc
  - beginner
---

# Vector Graphics vs. Rasterized (Bitmap) Graphics

In general, diagrams are usually best made in a *vector* format, while photo-realistic images or paintings are better served with *bitmaps*. A rasterisation is the conversion of a vector-graphics format to bitmap. This has to be done to display it (in editors, browsers, print, etc.), but preferably as a last step.

## Features

<style>
table.content-tab {margin: 1em; width:100%;}
.content-tab td, .content-tab th {padding:1ex; border: .1ex solid black;}
.content-tab th:first-child {border: none;}
.content-tab td:first-child {text-align: right;
</style>
<table class="content-tab">
<tr><th></th> <th>Vector </th><th> Bitmap </th></tr>
<tr><td>data type   </td><td>shapes</td><td> pixels </td></tr>
<tr><td>stored as   </td><td>object and parameters </td><td> arrays of colours </td></tr>
<tr><td>editing   </td><td> lossless editing </td><td> loss due to rasterization (e.g. aliasing) </td></tr>
<tr><td>uses   </td><td> diagrams </td><td> photos </td></tr>
</table>

## Example

![Vector vs. Bitmap](./vector_bitmap.svg)

Notice how at its regular size, all copies look the same for screen/printing resolutions lower than 96dpi. The difference is noticeable once we try to zoom in, or view it at higher resolutions.

# Closed/Proprietary vs. Open Source

There are all sorts of philosophical reasons for opening source code and toolsets, and others for opening up content created. When it comes down to practice, the reasons are basically:
- **it's free**;
- you can open and change it in the future;
- other people can make new work from yours.

Inkscape is the most mature, and most cross-platform vector graphics program.

# Interface Tour

The interface of inkscape tends to be quite crowded, so it can be overwhelming when you first open the application. In fact, it's so crowded, I don't think it will help much to include a screenshot.

Instead, here are the important things to notice (in order of importance):
- Tool palette, typically on the left
- Tool-specific options, typically top-left
- Tool tips (e.g. modifier keys), at the bottom
- General toolbar (save, copy, group, **show panels**), maybe top or right
- Transform/Format/etc. panels, typically hidden, but on the right when shown
- Snaps, typically bottom or right
- Colour palette, at the bottom

# Keyboard and mouse
The other tricky part is that it's optimized for keyboard and mouse. Most tools have different behaviour when a modifier key is held down. For example, with the selector tool, shift+click adds to the selection, Alt+Drag does a path-selection instead of rectangle, and shift+alt+drag adds to the current selection with a path-selection.
**Note**: if something is already selected, alt+drag moves the object.

Right-clicks and middle-clicks will also have different behaviours.

A notable modifier key is *Ctrl* (^). This will often force more "regular" shapes/orientations. For example, horizontal/vertical lines and moves, 45-degree rotation, and aspect-ratio locked scaling.

Often, *Shift* is used as a secondary modifier for opposite behaviour. Examples,
- ctrl+z is undo, shift+ctrl+z is redo
- ctrl+g groups objects, shift+ctrl+g ungroups 

## Notable hotkeys

Most hotkeys can be seen in the menus, or hovering over buttons on the interface. The following are ones that I use frequently.

- Escape will change tools and/or deselect. Keep pressing it until you're back at the selection tool with nothing selected.
- The number row handles zooming 
  - `=`, `-` zoom in and out
  - `5` zooms to fit document
  - `1` goes 1:1
  - back-tick (`) goes to the previous zoom (like undo) 
- ctrl-z for undo
- ctrl-d for duplicate
- alt-d for clone
- ctrl-g for group
- ctrl-c for copy
- shift-ctrl-c for past style (stroke and fill)


# Demo Tutorials

Everything else is probably best learned through using it. Here are some samples of what we'll make in the tutorial.

<style>
div.demo-table {width: 90%; display:flex; flex-flow: row wrap; justify-content: center; align-items: stretch;}
div.demo-table>div {width: 40%;}
div.demo-table>div img {max-width: 100%}
</style>
<div class="demo-table">
<div class="left">
![flow chart](./flow_chart.svg)
</div>
<div class="right">
Demonstrates rectangles, transforms, lines, clone, and gradients
</div>

<div class="left">
![phages (group and clone)](./phage_demo.svg)
</div>
<div class="right">
Demonstrates rectangles, transforms, lines, clone, and gradients
</div>

<div class="left">
![equations](./phage_flow_demo.svg)
</div>
<div class="right">
Demonstrates rectangles, transforms, lines, clone, and gradients
</div>

<div class="left">
![lattice](./lattice_demo.svg)
</div>
<div class="right">
Demonstrates rectangles, transforms, lines, clone, and gradients
</div>

<div class="left">
![beaker drawing](./beaker_demo.svg)
</div>
<div class="right">
Demonstrates rectangles, transforms, lines, clone, and gradients
</div>

<div class="left">
![dna diagram](./dna_demo.svg)
</div>
<div class="right">
Demonstrates rectangles, transforms, lines, clone, and gradients
</div>

</div>




## Python extensions

There may be a problem related to python versions when running extensions. Be sure to have Python 2.7 installed, and then specify the interpreter in `~/.config/inkscape/preferences.xml`

The interpreter option will likely not be there initially.

```
  <group
     id="extensions"
     python-interpreter="/usr/bin/python2.7"
     ...
  >
```
