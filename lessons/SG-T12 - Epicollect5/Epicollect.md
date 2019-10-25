---
layout: page
title: Data Collection with Epicollect5
author: Cristian D. Navarro Waggershauser
visible: true
tags:
  # languages
  - Epicollect5, R
  # levels
  - beginner
---
<!-- change visible to true if you want it on the site -->

 - **Author**: [Cristian D. Navarro Waggershauser](https://twitter.com/CWaggershauser)


**Disclaimer: Based in user experience alone**


## Epicollect5 is 100% free and limitless*
<img src="../images/image--000.jpg" style="max-width:100%;">


<img src="../images/image--004.jpg" style="max-width:50%;">
<img src="../images/image--006.jpg" style="max-width:50%;">


- Open Source
- Uses Google accounts
- Holds only your email
- Data ownership retained by project manager
- Giving access to a third person = explicit access to data
- Daily back-ups

*Within fair use policy


![Pipeline](https://github.com/AberdeenStudyGroup/studyGroup/new/gh-pages/lessons/SG-T12%20-%20Epicollect5/images/image--007.jpg)


## Limitations

- Requires an expensive phone
- Water and shock-proofing is a must
- Daily access to power sources
- Frequent access to the internet for data uploading


## How does it work?

**First you need a Google account**

- You can use it to login at Epicollect

![login](https://github.com/AberdeenStudyGroup/studyGroup/new/gh-pages/lessons/SG-T12%20-%20Epicollect5/images/image--012.jpg)

- Ready to create a new project

![create](https://github.com/AberdeenStudyGroup/studyGroup/new/gh-pages/lessons/SG-T12%20-%20Epicollect5/images/image--013.jpg)

- Add in your project’s details

![details](https://github.com/AberdeenStudyGroup/studyGroup/new/gh-pages/lessons/SG-T12%20-%20Epicollect5/images/image--014.jpg)


**Congratulations!**

You have now created your project website. Click on 

```
OK, OPEN FORMBUILDER NOW
```

The Form Builder is your friend

![form](https://github.com/AberdeenStudyGroup/studyGroup/new/gh-pages/lessons/SG-T12%20-%20Epicollect5/images/image--016.jpg)

![form2](https://github.com/AberdeenStudyGroup/studyGroup/new/gh-pages/lessons/SG-T12%20-%20Epicollect5/images/image--017.jpg)

![form2.5](https://github.com/AberdeenStudyGroup/studyGroup/new/gh-pages/lessons/SG-T12%20-%20Epicollect5/images/image--018.jpg#thumbnail)

![form3](https://github.com/AberdeenStudyGroup/studyGroup/new/gh-pages/lessons/SG-T12%20-%20Epicollect5/images/image--019.jpg)

![form3.5](https://github.com/AberdeenStudyGroup/studyGroup/new/gh-pages/lessons/SG-T12%20-%20Epicollect5/images/image--020.jpg#thumbnail)


**That’s it! Now go out there!**

## The Epicollect5 App

1. Download the app 

![form3.5](https://github.com/AberdeenStudyGroup/studyGroup/new/gh-pages/lessons/SG-T12%20-%20Epicollect5/images/image--024.jpg)

2. Login

![login](https://github.com/AberdeenStudyGroup/studyGroup/new/gh-pages/lessons/SG-T12%20-%20Epicollect5/images/image--025.jpg#thumbnail)

3. `Add project`

![project](https://github.com/AberdeenStudyGroup/studyGroup/new/gh-pages/lessons/SG-T12%20-%20Epicollect5/images/image--027.jpg#thumbnail)
![project2](https://github.com/AberdeenStudyGroup/studyGroup/new/gh-pages/lessons/SG-T12%20-%20Epicollect5/images/image--028.jpg#thumbnail)


4. Recording & Uploading data

`Add Entry`:

![rec](https://github.com/AberdeenStudyGroup/studyGroup/new/gh-pages/lessons/SG-T12%20-%20Epicollect5/images/image--030.jpg#thumbnail)
![rec2](https://github.com/AberdeenStudyGroup/studyGroup/new/gh-pages/lessons/SG-T12%20-%20Epicollect5/images/image--031.jpg#thumbnail)
![rec3](https://github.com/AberdeenStudyGroup/studyGroup/new/gh-pages/lessons/SG-T12%20-%20Epicollect5/images/image--032.jpg#thumbnail)
![rec4](https://github.com/AberdeenStudyGroup/studyGroup/new/gh-pages/lessons/SG-T12%20-%20Epicollect5/images/image--033.jpg#thumbnail)
![rec5](https://github.com/AberdeenStudyGroup/studyGroup/new/gh-pages/lessons/SG-T12%20-%20Epicollect5/images/image--034.jpg#thumbnail)
![rec](https://github.com/AberdeenStudyGroup/studyGroup/new/gh-pages/lessons/SG-T12%20-%20Epicollect5/images/image--035.jpg#thumbnail)
![rec](https://github.com/AberdeenStudyGroup/studyGroup/new/gh-pages/lessons/SG-T12%20-%20Epicollect5/images/image--036.jpg#thumbnail)
![rec](https://github.com/AberdeenStudyGroup/studyGroup/new/gh-pages/lessons/SG-T12%20-%20Epicollect5/images/image--037.jpg#thumbnail)
![rec](https://github.com/AberdeenStudyGroup/studyGroup/new/gh-pages/lessons/SG-T12%20-%20Epicollect5/images/image--038.jpg#thumbnail)

`Upload Now` > `Upload Data`


### Utility with R

**Downloading the data**

`View Data` to download as `.csv`.

![viewData](https://github.com/AberdeenStudyGroup/studyGroup/new/gh-pages/lessons/SG-T12%20-%20Epicollect5/images/image--044.jpg)


**Unique Identifiers allow linking the two spreadsheets**

---
ec5_uuid | created_at | title | 1_Name | 2_Gender |
:-------:|:----------:|:----------:|:----------:|:----------:|
d541a4c6...| 2019-01-12T19:45...|Cristian|Cristian|Male
---

---
ec5_uuid | ec5_parent_uuid |created_at | title | 3_Weight_kg | 4_Height_cm |
:-------:|:----------:|:----------:|:----------:|:----------:|:----------:|
5d3e90c...| d541a4c6...|2019-01-12T19:47...|80177|80|177
---

**Use R’s merge function to join forms**

```
parent <- read.csv(‘file_path’, check.names=F)
child <- read.csv(‘file_path’, check.names=F)

tutorial <- merge(parent, child,
by.x=‘ec5_uuid’, by.y= ‘ec5_parent_uuid’)
```

--- 

**Other cool stuff that you can do**

- Record date and time, location, pictures,
- Add jumps or groups of questions to forms
- Map your data
- Add collectors, curators...

---
**Useful links:**

User guide: https://epicollect5.gitbooks.io/epicollect5-user-guide/content/

iOS App Store: https://itunes.apple.com/us/app/epicollect5/id1183858199?mt=8

Android Play Store: https://play.google.com/store/apps/details?id=uk.ac.imperial.epicollect.five


---

