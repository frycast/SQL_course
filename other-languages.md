## Connecting from Other Languages

This document aims to provide simple examples of ODBC connectivity with batch processing in a number of common statistical programming languages.

A Data Source Name (DSN) is usually set up by your system administrator. If not, then there is usually a way to specify the connection settings yourself.

## R

The [RStudio guide for this is useful (click here)](https://db.rstudio.com/getting-started/connect-to-database). 

Here we establish a connection using a DSN provided by the system administrator.

```R
install.packages("odbc")
library(odbc)

con <- dbConnect(odbc(), "insert_DSN_here")
```

If you have no DSN, then you'll need to specify the connection settings. For help with finding Microsoft SQL Server connection settings, [click here](https://db.rstudio.com/databases/microsoft-sql-server/). Example:

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

Then you can [learn about basic queries from RStudio here](https://db.rstudio.com/getting-started/database-queries). Example:

```R
myquery <- "SELECT *
            FROM Ape.Banana;"
banana <- DBI::dbGetQuery(con, statement = myquery)
```

Now the result of the above query is stalled in the variable named `banana`

```R
class(banana)
names(banana)
head(banana)
```

We can loop though a large table and fetch only a few rows at a time. Example:

```R
myquery2 <- "SELECT *
             FROM Ape.EatingFrom;"
results <- DBI::dbSendQuery(con, statement = myquery2)
results
```

We have sent the query, and now it's time to fetch rows from the result. 

Here we fetch the first 5 rows

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



## STATA





## SAS

Use [implicit or explicit SQL passthrough](https://documentation.sas.com/?cdcId=pgmsascdc&cdcVersion=9.4_3.5&docsetId=spdsug&docsetTarget=n095mdd1wof6ogn1neyglan77ghc.htm&locale=en#!) to execute SQL code on the server (rather than locally).

Example:

```SAS
proc sql;
connect to odbc (dsn="ask_someone_in_your_IT_department_for_the_DSN");
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
connect to odbc(dsn="ask_someone_in_your_IT_department_for_the_DSN");
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