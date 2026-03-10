# Introduction to SQL

Textbook and course material, for the Introduction to SQL course, taught by [Daniel Fryer](https://danielvfryer.com).

This repository includes slides for the full 4-day course.

There is also a 2-day course. If you are attending the 2-day course, we won't cover all of the 4-day material, but you still get access to all of it.

## OPTIONAL Setup Guide

For this course, you **do not need to install a database server or editor on your computer**. We’ll be using a **simple online SQL environment** during the course so everyone can immediately start writing and running SQL without worrying about setup.

However, some people prefer to have their **own database server and editor installed locally**, either for practice or future work. The instructions below explain how to do that if you'd like your own setup.

During the course we’ll also briefly demonstrate **SQL Server Management Studio (SSMS)** for those who already have it installed and want to learn the basics. SSMS is commonly used in environments such as the **New Zealand Integrated Data Infrastructure (IDI) Data Lab**, so it can be useful to become familiar with.

If you're using a **Mac**, you can install **MySQL Workbench**, which provides both a database server and an editor. We won’t be covering MySQL Workbench in the course itself, but it is relatively straightforward to use and conceptually similar to SSMS.

### Step 1: Install a Database Server (Optional)

If you'd like to run SQL locally on your own machine, you'll need to install a **database server (DBMS)**. This allows you to store data and run SQL queries on your computer.

If you're using a **work computer**, you may not have permission to install software. In that case, simply use the **online environment provided during the course**.

If you do want your own local setup, follow one of the guides below.

### Step 2: Choose Your SQL Dialect (Optional)

There are two SQL variants you can install locally — **T-SQL** and **MySQL**. They're nearly identical for the purposes of this course, so choose whichever is easier for your system.

* 💻 **Windows users:** [Set up T-SQL (Microsoft SQL Server)](create-database/T-SQL/README.md)
  *This is usually the easiest option on Windows and works with SQL Server Management Studio (SSMS).*

* 🍎 **macOS users:** [Set up MySQL](create-database/MySQL/README.md)
  *This installs MySQL and allows you to use MySQL Workbench as an editor.*

### Step 3: Allow Time for Setup (If Installing Locally)

If you decide to install your own database server, please don’t leave setup until the last minute — installation and configuration can take time, especially if you run into permission issues.

If you hit any snags, reach out early — I’m happy to help.

### Tips

* **No installation is required for the course** — the online SQL environment will work for everyone.
* If you want the smoothest experience installing locally, use a **personal computer with administrator access**.
* The setup guides linked above walk through everything step by step.

## Textbook and slides

The textbook and slides are linked below.

* [Course text (The Necessary SQL, featuring MySQL and T-SQL)](textbook-and-slides/SQL_Course_Textbook.pdf)
* [Day 1 slides](textbook-and-slides/SQL_Course_Slides_Day_1.pdf)
* [Day 2 slides](textbook-and-slides/SQL_Course_Slides_Day_2.pdf)
* [Day 3 slides](textbook-and-slides/SQL_Course_Slides_Day_3.pdf)
* Day 4 slides:
  - [Day 4 non-interactive pdf version](textbook-and-slides/SQL_Course_Slides_Day_4.pdf)
  - [Day 4 interactive web version](https://rpubs.com/frycast/sql-with-r)
