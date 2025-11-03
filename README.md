# Introduction to SQL

Textbook and course material, for the Introduction to SQL course, taught by [Daniel Fryer](https://danielvfryer.com).

This repository includes slides for the full 4-day course.

There is also a 2-day course. If you are attending the 2-day course, we won't cover all of the 4-day material, but you still get access to all of it.

## Setup Guide

For this course, you'll need a way to write and run SQL commands. The best option is to install [**Visual Studio Code (VS Code)**](https://code.visualstudio.com/) — a free, beginner-friendly code editor that's widely used across the industry. It supports SQL (and many other languages) and makes writing code enjoyable and efficient.
👉 [Download Visual Studio Code](https://code.visualstudio.com/)

### Step 1: Install a Database Server (DBMS)

To actually *run* your SQL commands, you'll also need a database server installed on your computer. If you're using a **work computer**, you might not have permission to install software. In that case, I'll provide access to a **remote database** during the course — but the experience will **not be as smooth**.

If possible, install your own DBMS following one of the guides below.

### Step 2: Choose Your SQL Dialect

There are two SQL variants we'll use in this course — **T-SQL** and **MySQL**. They're nearly identical for our purposes, so you can choose whichever is easier to set up:

* 💻 **Windows users:** [Set up T-SQL (Microsoft SQL Server)](create-database/T-SQL/README.md)
  *This is usually the easiest option on Windows.*
* 🍎 **macOS users:** [Set up MySQL](create-database/MySQL/README.md)
  *This is usually the easiest option on Mac.*

### Step 3: Allow Time for Setup

Please don't leave setup until the last minute — installation and configuration can take time, especially if you run into permission issues.
If you hit any snags, reach out for help early — I'm happy to assist!

### Tips

* You'll have the best experience using a **personal computer** (with administrator access).
  Some students have had difficulties getting everything working on locked-down work devices.
* The setup guides linked above will walk you through everything step by step.

## Textbook and slides

The textbook and slides are linked below.

* [Course text (The Necessary SQL, featuring MySQL and T-SQL)](textbook-and-slides/SQL_Course_Textbook.pdf)
* [Day 1 slides](textbook-and-slides/SQL_Course_Slides_Day_1.pdf)
* [Day 2 slides](textbook-and-slides/SQL_Course_Slides_Day_2.pdf)
* [Day 3 slides](textbook-and-slides/SQL_Course_Slides_Day_3.pdf)
* Day 4 slides:
  - [Day 4 non-interactive pdf version](textbook-and-slides/SQL_Course_Slides_Day_4.pdf)
  - [Day 4 interactive web version](https://rpubs.com/frycast/sql-with-r)


## Beginner R tutorial

R is covered in 4-day course, though we may have time for some R material during the 2-day course, depending on the audience. For beginner R programmers, day 4 may move a bit fast. This tutorial (by [SwirlStats](https://swirlstats.com/students.html)) will help you get prepared (or brush up). Right-click (or control-click) the link below, and choose 'save link as'. This will download the R script. Once downloaded, open the script in RStudio. 

* [Beginner R tutorial (R script)](https://github.com/frycast/SQL_course/raw/master/R/intro-to-R.R)

If this is the first time you've used RStudio, I've created a video for you to guide you through using the above script.

* [Brief intro to RStudio (video)](https://youtu.be/rdcVS7CrWPw)

To be fully prepared for day 4, I suggest you complete all lessons from Lesson 1 (Basic Building Blocks), to Lesson 9 (Functions), of the Intro to R course, within the Swirl tutorial. You will see these lessons when you start the Swirl tutorial (also explained in the video linked above). I suspect this will take about 1 hour.

## IDI Stuff

If you are working with the New Zealand Integrated Data Infrastructure (4-day course only), you may be interested in the links below.

* [Day 3 slides include a section on the IDI](textbook-and-slides/SQL_Course_Slides_Day_2.pdf)
* [The 'IDI Stuff' folder includes some useful papers and two data dictionaries](IDI-stuff)
* [Many more data dictionaries on StatsNZ DataInfo+ website](http://datainfoplus.stats.govt.nz/Search?query=idi&search=Search&itemType=4bd6eef6-99df-40e6-9b11-5b8f64e5cb23)
* [A searchable list of variables available in the IDI](https://idi-search.web.app/claims/acc_cla_accident_in_NZ_ind)

