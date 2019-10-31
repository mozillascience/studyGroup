---
layout: page
title: 'Code Review Overview'
visible: true
tags:
  - misc
  - beginner
---

## Why Do Code Review? ##

Code review is the process of having your code read by another programmer (or yourself; or better, in pairs) in order to:
- catch bugs
- making sure it is clear to someone who might take up the project after you (i.e. improve the documentation) 
- ensure efficiency/simplicity
- that all cases have been considered and appropriately addressed
- many other reasons!

Not only do we want to catch any bugs in code, but code review aims to make sure that there is a standard set of rules for code that you want to uphold within a lab, or collaborative group, allowing for consistent and higher quality code. 

Ideally you would want there to be good communication about what the standards are, and whether they are being met throughout the entire process from conception of the idea to the finished code. This involves sitting down and thinking carefully about the design of the project, and defining the standards of the code along with frequent code review as it is being written. 

If you often pair up to review eachother's code, you learn new tips and tricks, and you may find alternative approaches to the same task, and also to write a coherent script pipeline.  This is particularly important if you each code different parts of the project.  

Many studies have found code review to be effective not only to improve the code, but for knowledge transfer and team awareness (see [here](https://dl.acm.org/citation.cfm?id=314753) and [here](https://dl.acm.org/citation.cfm?id=2486882) for examples).


## Tips on Conducting Code Review

- Review code frequently and early on. This way you don't have to sit through huge chunks of code, and that way the code is still fresh in your mind.
- Review no more than 300-500 lines of code per hour, any more and you risk not taking the time to understand each line because you feel rushed to finish.
- Focus on the right things such as clarity and function. Differences in formatting and style should be addressed but leave that to linters and other tools designed to look for those types of mistakes.
- Use checklists if this will be a regular thing in your lab or group (which it should be!) that everyone refers to as they write the code and should be somewhat specific for your purposes, however many general items will be common to most lists. This might include:
  - are functions broken down into the simplest components as possible?
  - is the code efficient? is there a faster way to go about computing something?
  - is the current documentation (docstrings, comments) clear? If you did not have the writer explain it to you, would you understand?
  - are there edge cases that haven't been considered? You can discuss how to address these cases if they exist.
  - Is the code repetitive? If so, perhaps break it down to a function that can be reused.
  - Does the file structure, naming conventions match with the predetermined standards?
- Make sure that everyone is clear on what the final goal of the code is so feedback can attest to these goals as well instead of only addressing superficial bugs
- The process is not truly complete until the comments and suggestions made have all been addressed either by fixing the bugs (or restructuring the code if need be) and confirming that changes are sufficient to meet the standards agreed upon. This can take time and doesn't have to occur in just one sitting, but will save time in the long run!
- be nice, be objective, be collaborative. 

## Ways to Code Review

- Review your code yourself using your own checklist based off a general checklist including  common mistakes optimized for your project
- Review code with one, or if possible, many people at once as you walk through the code and give context while they make suggestions and context
- Another way to conduct code review includes distributing the code and having many people go over it on their own time or during a designated time, and then you go over the comments afterwards, making sure there is a process in place to then confirm fixes have been made

## Review using Github 
Code review is of course built on good version control. So, by now, you probably use Github (Gitlab) or other resources to do version control and share the work with collaborators. You can furthere utilize Github for reviewing each other's code. Using Github, the code review happens between the first pull request by the original author, before it is merged:
- The author (or the project manager) can manually request a review on the pending PR. You can also configure projects to *require* a review before a pull request can be merged. 
- The reviewer can make general or line-by-line comments
- Further discussion can continue under each comment thread  
- make changes to the code as per the decisions reached in comments
- make the merge (whether the author of the code, or the reviewer does the merge should be communicated between members of the project prior to the review process)




## Resources
https://mozillascience.github.io/codeReview/intro.html (and other links therein)  
https://blog.fogcreek.com/effective-code-reviews-9-tips-from-a-converted-skeptic/

https://the-turing-way.netlify.com/reviewing/reviewing.html

