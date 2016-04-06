---
layout: page
title: 'Web design with Jekyll/Github Pages'
visible: false
---
<!-- change visible to true if you want it on the site -->

 - **Authors**: Dawn Walker [@dcwalk](https://github.com/dcwalk)
 - **Research field**: Information Studies (Information System Design)
 - **Lesson topic**: Introduction to using Github Pages and Jekyll for website design
 - **Lesson content URL**: <https://github.com/UofTCoders/studyGroup/tree/gh-pages/lessons/githubPages>

## Preface
This is a basic introduction to using Github Pages and Jekyll to host a web page. Github Pages are a feature of Github that allows users to host websites for individuals, projects, or organizations right from their repositories! The engine Github uses to accomplish this is Jekyll, a ["simple, static, blog-aware, site generator"](https://jekyllrb.com/), but it also supports regular HTML content.

In this code-along we'll cover what Github Pages are, why you might want to use them, and how to do so both online and locally with some jekyll basics!

### Pre-requisites

- A github account (if you don't already have one go to [github.com/join](https://github.com/join))
- git installed, and configured on your machine ([git-scm.com](https://git-scm.com/downloads) and UofT Coders lessons **[Intro to Git](https://uoftcoders.github.io/studyGroup/lessons/git/lesson/)** and **[More on Git](https://uoftcoders.github.io/studyGroup/lessons/git2/lesson/)**)

### Bluebird Conditions (AKA would be great to have!)
- jekyll and its requirements installed on your machine ([jekyllrb.com/docs/installation](https://jekyllrb.com/docs/installation/))
  - ruby ([ruby-lang.org/en/documentation/installation](https://www.ruby-lang.org/en/documentation/installation/))
  - rubygems ([rubygems.org/pages/download](https://rubygems.org/pages/download))
  - some familiarity with **markdown** and **html**


<div class="alert alert-dismissible alert-info">
  <i class="fa fa-info-circle"></i>&nbsp;&nbsp;&nbsp;<strong>Running Jekyll on Windows</strong><br />Unfortunately Windows is not officially supported, however there are instructions for <a href="https://jekyllrb.com/docs/windows/#installation" target="_blank"><!--_ -->Jekyll on Windows</a>, but it might be finicky.
</div>

## Lesson Overview
The lesson will cover:

- What Github Pages are, why you might want to use them
- Creating a Github Pages site
  - Online: using the Automatic Page Generator
  - Locally: using Git and Jekyll
- Jekyll Basics


## Why (and What) are Github Pages
Github Pages are a feature of Github that allows users to host static websites for individuals, projects, or organizations from a repository

### Static vs. Dynamic Websites

- **Dynamic** ones have pages that are generated in real-time
- **Static** ones have pages that are converted (or written directly) as static HTML.

- What about _static vs. 'interactive'?_ doesn't have to be the case!

### Reasons to Use

- Free!
- Static sites are more secure(ish*)
- Manage all the different content for your project(s) in the same place
- ... others?

### Examples
- **Github Developer** [developer.github.com](https://developer.github.com/)  [`github.com/github/developer.github.com`](https://github.com/github/developer.github.com)

- **Open Knowledge Foundation: Open Data Handbook** [opendatahandbook.org/guide](http://opendatahandbook.org/guide/en/)  [`github.com/okfn/opendatahandbook`](https://github.com/okfn/opendatahandbook)

- **Grimoire** [ephe.github.io/grimoire/](https://ephe.github.io/grimoire/)  [`ephe.github.io/grimoire/`](https://ephe.github.io/grimoire/)   
"Grimoire is a mobile-friendly [D&D] 5e spellbook that organizes spell lists by class and level."

- **2048** [gabrielecirulli.github.io/2048/](https://gabrielecirulli.github.io/2048/) [`github.com/gabrielecirulli/2048/`](https://github.com/gabrielecirulli/2048/)

### Naming Conventions

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
  - There are 4 types of Github Pages site (in the table above and on **[GitHub](https://help.github.com/articles/user-organization-and-project-pages/)**)
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

~~~
$ git --version
git version X.X.X
$ jekyll -v
jekyll X.X.X
~~~

2. We'll have to create (or choose) a repo for a project

~~~
$ git init first-website
Initialized empty Git repository in <path/to/current/directory>/first-website/.git/
~~~

_Note: There are a few extra steps if you want a project page for an existing repository! Please see: [help.github.com/articles/creating-project-pages-manually/](https://help.github.com/articles/creating-project-pages-manually/)_

### Jekyll Basics

Jekyll is a package (ruby gem) that makes a `jekyll` executable available from your command line.

There aren't too many commands to start off, let's test them out:

`jekyll new`  
`jekyll serve`

and another one:  
`jekyll build`  
but when you use `serve` it calls build, so the command is not often needed

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

#### Front matter


#### Anatomy of a Jekyll Project


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

### Glossary
- a **dynamic** website "contains web pages... that are generated in real-time. These pages include Web scripting code, such as PHP..." (from [techterms](http://techterms.com/))
- **"static site generator"** tools that help with the creation of static websites by converting input (usually written in a markup language like **markdown**) into static HTML through the use of templates.
- a **static** website "contains web pages with fixed content. Each page... displays the same information to every visitor" (from [techterms](http://techterms.com/))



### Relevant Links

- [GitHub Pages](https://pages.github.com/)
  - [Creating Pages with the automatic generator](https://help.github.com/articles/creating-pages-with-the-automatic-generator/)
  - [Creating Project Pages manually](https://help.github.com/articles/creating-project-pages-manually/)

- [Jekyll](https://jekyllrb.com/docs/installation/)
- [jekyllthemes.org](http://jekyllthemes.org/)  

### Other fun Web Stuff

- Icon Font Kit [Font Awesome](https://fortawesome.github.io/Font-Awesome/)
- Popular Framework [Bootstrap](https://getbootstrap.com/)
- [GitBook](https://www.gitbook.com/), open source book format using Git and Markdown
- [StaticGen](https://www.staticgen.com/), ranking of Open-Source Static Site Generators (there are <span class="label label-warning">so many</span>&nbsp;)
