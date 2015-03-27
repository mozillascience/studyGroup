Study Groups
============

Welcome to [Mozilla Science Lab](http://www.mozillascience.org/)'s Study Group project! From here, we'll set you up with everything you need to start your own study group.

### Wait What's a 'Study Group'

Study groups are fun, informal meetups of your friends and colleagues from around your local institution or town to share skills, stories and ideas on using code for research. The goal is to create a friendly, no-pressure environment where people can share their work, ask for help on a coding problem, and learn and work together with their peers.

### It's Broken, I Need Help

If anything in these instructions doesn't work or doesn't make sense, open an issue [here](https://github.com/billsTestOrg/studyGroup/issues) or email bill@mozillafoundation.org.

## How to Set Up Your Own Study Group Website

Everything you need to set up your own study group website for organizing events is right here - follow the following steps and you'll be up and running soon:

 1. **Make yourself an account on GitHub.** The free one is just fine.
 2. **Make an Organization for your study group.** This is like making a club on GitHub. To do this:
   - On GitHub, click on the gear in the top right hand corner.
   - Click on 'Organizations' in the list on the left.
   - Click 'New Organization' near the top right.
   - Name your organziation `yourInstitutionOrCity-study-group`, where `yourInstitutionOrCity` is the place you're organizing your study group from.
   - Put your email in the 'Billing Address' field; don't worry, you're going to stick with the free plan, so you'll never actually get a bill.
 3. **Fork this repository.** Up in the top right corner of this page, there's a button that says 'Fork'; press it! It'll ask you where you want to fork to - choose the new Organization you just made. This makes your very own copy of all this stuff in your Organization space on GitHub; when the copy is done, GitHub will automatically take you there.
 4. **Turn on the Issue Tracker.** An issue tracker is a message board GitHub sets up for every repository; you'll use it to post information about your event and talk to your participants. To turn it on, click on 'Settings' in the right sidebar of your repo, and then click the checkbox beside 'Issues'. Now head back to your repo by clicking on the big `studyGroup` at the top of the page.
 5. **Edit the `_config.yml` file** in your new repository. To do this, click on `_config.yml`, then click on the little pencil near the top right. There are instructions right in the file on how to edit it. When you're done, press the green 'Commit Changes' button at the bottom of the page.

That's it, you're done! You can see your new website at `http://yourOrganizationName.github.io/studyGroup/`, where `yourOrgnaizationName` is the Organization name you made above. If this is your first time making a webpage on GitHub, it might take 30 minutes for things to percolate through their computers - don't worry, it's all good, check back later and your website should be up and running.

## How to Launch a New Event

When you're ready to list a new event for your study group, follow these steps:

 1. **Make a new Issue to describe your event.** Click on 'Issues' over on the right sidebar, then the green 'New Issue' button. You'll then see a form where you can give your event a title and a description - fill these out with all the relevant information; this is how your attendees will know when and where to go and what's going on, so make sure to add all the details!
 2. **Go to the `_posts` directory**. It'll be at `https://github.com/yourOrganizationName/studyGroup/tree/gh-pages/_posts` - or you can click on `_posts` in your repo.
 3. **Make a new file** by clicking on the `+` sign beside `_posts/` Name it like the following:
 
    ```
    YYYY-MM-DD-word.markdown
    ```
    
    where `YYYY-MM-DD` is the date of your event, and `word` is anything you want.
 4. **Cut and paste the following into your new file:**
    ```
    ---
    title: Study Group Meetup
    text: a one sentence description of your event
    location: Hacky Hour Stadium
    link: https://github.com/yourOrganizationName/studyGroup/issues/1234
    date: 2016-01-04

    ---
    ```
    Change all the fields to describe your event; make sure the `link` is the address of the issue you created above. When you're done, remember to click 'Commit Changes' at the bottom.

That's it! Your event is now listed on your webpage, and there's a discussion thread where people can ask questions and discuss the details.
    
 ## How to Stay in Touch With Your Members
 
 Now that you're all set up, GitHub provides several ways to stay in touch with the people involved in your study group.
 
  - **Create a Team for your participants.**. On your Organization page (`https://github.com/yourOrganziationName`), click 'Create a New Team'. Name your team something like `Members`, and keep the default 'Read Access' option.
  - **Invite members.** Every time someone participates in one of your study groups, ask them their GitHub user name, and invite them to join your team by visiting your Organziation page (`https://github.com/yourOrganizationName`) and clicking on 'Invite someone'.
  - **Use the Issue Tracker.** The Issue Tracker is your public message board to make announcements, ask questions and start conversations with your members. You can find yours at `https://github.com/yourOrganziationName/studyGroup/issues`.
  - **Use the Mozilla Science Forum** to chat with study groups worldwide. Find the [forum here](http://forum.mozillascience.org/category/events/study-groups); every study group gets a link back to this global forum maintained by the Mozilla Science Lab to share their stories, ask questions to the wider community, and find out who's out there. 
 

