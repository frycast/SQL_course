## Connecting from Other Languages

This document aims to provide simple examples of ODBC connectivity with batch processing in a number of common statistical programming languages.

A Data Source Name (DSN) is usually set up by your system administrator. If not, then there is usually a way to specify the connection settings yourself.

## R

Here we establish a connection using a DSN provided by the system administrator.

```R
install.packages("odbc")
library(odbc)

con <- odbc::dbConnect(odbc::odbc(), "insert_DSN_here")
```

If you have no DSN, then you'll need to specify the connection settings. Example:

```R
install.packages("odbc")
library(odbc)

con <- odbc::dbConnect(odbc::odbc(),
                      Driver = "SQL Server",
                      Server = "write_server_address_here",
                      Database = "write_database_name_here",
                      UID = "write_user_name_here",
                      PWD = "write_your_password_here")
```

Here is a more specific example of the above. Connecting to the master database from the course:

```R
con <- odbc::dbConnect(odbc::odbc(),
                      Driver = "SQL Server",
                      Server = "nzssn.database.windows.net",
                      Database =  "master",
                      UID = "Daniel",
                      PWD = "insert_your_password")
```

If you are still unsuccessful, you may find more help on the RStudio website ([click here](https://db.rstudio.com/databases/microsoft-sql-server/)).

Now lets send a basic query to the server and get the result. We will need to explicitly specify `PlayPen` as the database, since we are currently connected to `master` . Example:

```R
myquery <- "SELECT *
            FROM PlayPen.Ape.Banana;"
banana <- DBI::dbGetQuery(con, statement = myquery)
```

Now the result of the above query is stored in the variable named `banana`

Let's take a closer look at this variable `banana`:

```R
class(banana)
names(banana)
head(banana)
```

We can also loop though a table (e.g., a very large table) and fetch only a few rows at a time. Example:

```R
myquery2 <- "SELECT *
             FROM PlayPen.Ape.EatingFrom;"
results <- DBI::dbSendQuery(con, statement = myquery2)
results
```

We have sent the query, and now it's time to fetch rows from the result. Here we fetch the first 5 rows

```R
eating <- DBI::dbFetch(results, n = 5)
eating
```

Now we fetch the next 5 rows and append them to the end of the `data.frame` named `eating`

```R
next5 <- DBI::dbFetch(results, n = 5)
eating <- rbind(eating, next5)
eating
```

For info, the [RStudio guide for is useful (click here)](https://db.rstudio.com/getting-started/connect-to-database). 

## STATA

**Disclaimer:** *I am unable to execute this code since I don't have a copy of STATA, and I've never used STATA before. This is just my best effort at including STATA for completeness. If someone could please verify that this works (or not) and email me, that would be great.*

```SAS
odbc load, exec(
"SELECT TOP(100) * 
FROM Notes.Friends;
") 
dsn("ask_someone_for_the_DSN") lowercase sqlshow clear; 
```

```SAS
odbc load, exec(
"SELECT * 
FROM Notes.Friends;") 
dsn("ask_someone_for_the_DSN") lowercase sqlshow clear;
```



## SAS

Use [implicit or explicit SQL passthrough](https://documentation.sas.com/?cdcId=pgmsascdc&cdcVersion=9.4_3.5&docsetId=spdsug&docsetTarget=n095mdd1wof6ogn1neyglan77ghc.htm&locale=en#!) to execute SQL code on the server (rather than locally).

Example:

```SAS
proc sql;
connect to odbc (dsn="ask_someone_for_the_DSN");
create table My_SAS_table_of_friends as 
select * from connection to odbc
/* -------- Start of SQL code -------*/
(SELECT *
FROM Notes.Friends);
/* ----------------------------------*/
disconnect from odbc;
quit;
```

Here's another example using tables and columns in the IDI

```SAS
proc sql;
connect to odbc(dsn="ask_someone_for_the_DSN");
create table work.census_address as 
select * from connection to odbc
/* -------- Start of SQL code -------*/
(SELECT snz_uid
      ,snz_cen_uid
      ,address_type_code
      ,meshblock_code
      ,au_code
      ,geocode_source_code
FROM cen_clean.census_address
WHERE address_type_code='UR'
ORDER BY meshblock_code, snz_uid);
/* ----------------------------------*/
disconnect from odbc;
quit;

```

For more IDI SAS examples [see the VHIN website](https://vhin.co.nz/guides/shared-code/)