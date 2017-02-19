---
layout: page
title: 'Web design with Jekyll/GitHub Pages'
visible: true
tags:
  - misc
  - beginner
---

- **Authors**: Dawn Walker [@dcwalk](https://github.com/dcwalk)
- **Research field**: Information Studies (Information System Design)
- **Lesson topic**: Introduction to using GitHub Pages and Jekyll for website design
- **Lesson content URL**: <https://github.com/UofTCoders/studyGroup/tree/gh-pages/lessons/misc/jekyll-ghpages>
- **Lesson video stream**: <https://www.youtube.com/watch?v=oCCwtyH3SL4>

## Preface

This is a basic introduction to using GitHub Pages and Jekyll to host a web page. GitHub Pages are a feature of GitHub that allows users to host websites for individuals, projects, or organizations right from their repositories! The engine GitHub uses to accomplish this is Jekyll, a ["simple, static, blog-aware, site generator"](https://jekyllrb.com/), but it also supports regular HTML content.

In this code-along we'll cover what GitHub Pages are, why you might want to use them, and how to do so both online and locally with some jekyll basics!

### Pre-requisites

- GitHub account (if you don't already have one go to [github.com/join](https://github.com/join))
- git installed, and configured on your machine ([git-scm.com](https://git-scm.com/downloads))
- comfort with material covered in UofT Coders lessons **[(Brief) Introduction to Git + GitHub](https://uoftcoders.github.io/studyGroup/lessons/git/intro/lesson/)**, **[An Intermediate Look at Git + GitHub](https://uoftcoders.github.io/studyGroup/lessons/git/advanced/lesson/)**, and **[Using Branches in Git](https://uoftcoders.github.io/studyGroup/lessons/git/branches/lesson/)**

### Bluebird Conditions (AKA would be great to have!)

- jekyll and its requirements installed on your machine ([jekyllrb.com/docs/installation](https://jekyllrb.com/docs/installation/))
  - ruby ([ruby-lang.org/en/documentation/installation](https://www.ruby-lang.org/en/documentation/installation/))
  - rubygems ([rubygems.org/pages/download](https://rubygems.org/pages/download))

- some familiarity with **[markdown](https://help.github.com/articles/basic-writing-and-formatting-syntax/)** and **[HTML](https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/Introduction)**

<div class="alert alert-dismissible alert-info">
  <i class="fa fa-info-circle"></i>&nbsp;&nbsp;&nbsp;<strong>Running Jekyll on Windows</strong><br />Unfortunately Windows is not officially supported, however there are instructions for <a href="https://jekyllrb.com/docs/windows/#installation" target="_blank"><!--_ -->Jekyll on Windows</a>, but it might be finicky.
</div>

## Lesson Overview

The lesson will cover:

- What GitHub Pages are, why you might want to use them
- Creating a GitHub Pages site
  - Online: using the Automatic Page Generator
  - Locally: using Git and Jekyll
- Jekyll Basics

## Why (and What) are GitHub Pages

Github Pages are a feature of GitHub that allows users to host static websites for individuals, projects, or organizations from a repository

#### Static vs. Dynamic Websites

- **Dynamic** ones have pages that are generated in real-time
- **Static** ones have pages that are converted (or written directly) as static HTML.

- Does this mean it is also _static vs. 'interactive'_? No, doesn't have to be the case!

#### Reasons to Use

- Free!
- Static sites are more secure(ish*)
- Manage all the different content for your project(s) in the same place
- ... others?

#### Examples

- **Github Developer** [developer.github.com](https://developer.github.com/)  [`github.com/github/developer.github.com`](https://github.com/github/developer.github.com)
- **Open Knowledge Foundation: Open Data Handbook** [opendatahandbook.org/guide](http://opendatahandbook.org/guide/en/)  [`github.com/okfn/opendatahandbook`](https://github.com/okfn/opendatahandbook)
- **2048** [gabrielecirulli.github.io/2048/](https://gabrielecirulli.github.io/2048/) [`github.com/gabrielecirulli/2048/`](https://github.com/gabrielecirulli/2048/)

#### Naming Conventions

<table class="table table-striped table-hover ">
  <thead>
    <tr>
      <th align="left">Type of GitHub Pages site</th>
      <th align="left">Pages default domain &amp; host location on GitHub</th>
      <th align="left">Publishing branch</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td align="left">User Pages site</td>
      <td align="left"><code>username.github.io</code></td>
      <td align="left">master</td>
    </tr>
    <tr>
      <td align="left">Organization Pages site</td>
      <td align="left"><code>orgname.github.io</code></td>
      <td align="left">master</td>
    </tr>
    <tr>
      <td align="left">Project Pages site owned by a <strong>user account</strong></td>
      <td align="left"><code>username.github.io/projectname</code></td>
      <td align="left">gh-pages</td>
    </tr>
    <tr>
      <td align="left">Project Pages site owned by an <strong>organization</strong></td>
      <td align="left"><code>orgname.github.io/projectname</code></td>
      <td align="left">gh-pages</td>
    </tr>
  </tbody>
</table>

## Online Editing: Automatic Page Generator

1. Create a new repository ([github.com/new](https://github.com/new))
  - There are 4 types of GitHub Pages site (in the table above and on **[GitHub](https://help.github.com/articles/user-organization-and-project-pages/)**)
  - **following naming conventions is really important!** `.github.io` for user and organizations
2. Navigate to **Settings** and click **Automatic Page Generator**  
Or just go to generated_pages url for your repository:  
`https://github.com/<username>/<repository>/generated_pages/new`
  - Make some edits to the content
  - Select a theme/layout
  - Publish!
3. We have a website!  
`<username/orgname>.github.io/<projectname>/`
  - Let's check it out
4. Make an update
5. Check out the commit history

## Working Locally: Git and Jekyll

1. First, we need to make sure we have everything installed

        $ git --version
        git version X.X.X
        $ jekyll -v
        jekyll X.X.X

2. We'll have to create (or choose) a repo for a project

        $ git init first-website
        Initialized empty Git repository in <path/to/current/directory>/first-website/.git/

_Note: There are a few extra steps if you want a project page for an existing repository! Please see: [help.github.com/articles/creating-project-pages-manually](https://help.github.com/articles/creating-project-pages-manually/)_

#### Jekyll Basics

Jekyll is a package (ruby gem) that makes a `jekyll` executable available from your command line.

There aren't too many commands you need to get going: `jekyll new` and `jekyll serve`   
and another one: `jekyll build` but `serve` calls build, so the command is not often needed

let's test them out:

~~~
$ jekyll new first-website
New jekyll site installed in <path/to/current/directory>/first-website.
~~~

So we have a project, let's check out what's there!

~~~
$ cd first-website
$ ls -lFA
$ git status
~~~

Lots of files. Before we dig in let's try to get our website built

~~~
$ jekyll serve
... <lots of details including file paths>
Server address: http://127.0.0.1:4000/
Server running... press ctrl-c to stop.
~~~

...and check it out in the browser.

Why don't we try to make some changes and see how it looks?
Let's edit `index.html`, see how it updates in the browser automatically

If we want to make more substantial edits to the site name, our contact details we'll have to modify `_config.yml`, but it won't update in the browser until we re-serve the page

#### Anatomy of a Jekyll Project

Before doing more let's take a look at all those files and folders in our directory again. [Jekyll](https://jekyllrb.com/docs/structure/) docs and the `tree` command can do a better job than me...

~~~
$ ls -lFA
$ tree
~~~

A clumsy equation for jekyll:   
`_*` files and folders * `*.html/markdown/md/textile` = your static site (in `_site`)

#### Front matter & Liquid Tags

In order for those `*.html/markdown/md/textile` files to be transformed into working static pages, jekyll makes use of:

**YAML Front Matter** (<strike>Yet Another Markup Language</strike> YAML Ain't Markup Language), once again I'll lean on [jekyll](https://jekyllrb.com/docs/frontmatter/) docs

~~~
$ cat about.md
---
layout: page
title: About
permalink: /about/
---
...
~~~

and **[Liquid](https://shopify.github.io/liquid/) Filters and Tags** (A templating Language for handling dynamic content), thrice those handy [jekyll](https://jekyllrb.com/docs/templates/) docs

{% raw %}
~~~
$ cat about.md
---
...
{% include icon-github.html username="jglovier" %}
...
~~~
{% endraw %}

I hope that is enough to start, there are lots more fiddly bits, but the docs and additional resources (below), as well as google, have lots to offer!

#### Making your site live

`<movie training montage>`

Okay, we've got a great site, spent some time on the content and now we want everyone on the internet to see it too.

Before we get this up on GitHub we should make sure that the repo is set up to not commit the static version of the site. GitHub does not need it to host your site, as they use jekyll to generate sites on their end too:

~~~
$ git status
...
.gitignore
...
$ <cat/touch> .gitignore
~~~

Github helpfully publishes all sorts of template .gitignores, the [jekyll](https://github.com/github/gitignore/blob/master/Jekyll.gitignore) one only has three items...

While on GitHub let's set up our repo, remember the naming conventions above: `<username/orgname>.github.io/<projectname>/`

now, to commit our changes...

~~~
$ git checkout -b gh-pages
$ git add .
$ git commit -m '<some meaningful commit message>'
~~~

and push them to GitHub...

~~~
$ git remote add origin <repo address>
$ git push --set-upstream origin gh-pages
~~~

success! (hopefully...?)

#### Using Themes

Many times you won't want to build up your site from scratch, instead you'll continue the lofty tradition of standing on the shoulders of giants and use a pre-made **theme**:

[jekyllthemes.org](http://jekyllthemes.org/)  

If you are feeling overwhelmed <span class="label label-warning">so many</span> I selected a couple:

- [jekyllthemes.org/themes/twenty/](http://jekyllthemes.org/themes/twenty/)  
- [jekyllthemes.org/themes/read-only/](http://jekyllthemes.org/themes/read-only/)  
- [jekyllthemes.org/themes/end2end/](http://jekyllthemes.org/themes/end2end/)  

#### And more...

- [Custom Domains (help.github.com on CNAME records)](https://help.github.com/articles/custom-domain-redirects-for-github-pages-sites/)
- Securing your Site with SSL! [Not easy unfortunately (github/issues)](https://github.com/isaacs/github/issues/156)
- ... others?

## Resources

- [GitHub Pages](https://pages.github.com/)
  - [Creating Pages with the automatic generator](https://help.github.com/articles/creating-pages-with-the-automatic-generator/)
  - [Creating Project Pages manually](https://help.github.com/articles/creating-project-pages-manually/)

- [Jekyll](https://jekyllrb.com/docs/installation/)
- [Liquid](https://shopify.github.io/liquid/)
- [jekyllthemes.org](http://jekyllthemes.org/)  
- Icon Font Kit [Font Awesome](https://fortawesome.github.io/Font-Awesome/)
- Popular Framework [Bootstrap](https://getbootstrap.com/)
- [GitBook](https://www.gitbook.com/), open source book format using Git and Markdown
- [StaticGen](https://www.staticgen.com/), ranking of Open-Source Static Site Generators (there are <span class="label label-warning">so many</span>&nbsp;)

### Glossary

- a **dynamic** website "contains web pages... that are generated in real-time. These pages include Web scripting code, such as PHP..." (from [techterms](https://techterms.com/))
- **"static site generator"** tools that help with the creation of static websites by converting input (usually written in a markup language like **markdown**) into static HTML through the use of templates.
- a **static** website "contains web pages with fixed content. Each page... displays the same information to every visitor" (from [techterms](https://techterms.com/))
