# See RSQLite tutorial here: 
# https://cran.r-project.org/web/packages/RSQLite/vignettes/RSQLite.html

install.packages("RSQLite")
library(RSQLite)

# Connect and disconnect --------------------------------------------------

# create (or connect to) the database
con <- DBI::dbConnect(RSQLite::SQLite(), "MyDB.sqlite")

# disconnect
DBI::dbDisconnect(con)

# Connect and use  --------------------------------------------------------

# We'll save the built-in mtcars and iris datasets to a SQLite database
mtcars
iris

# create (or connect to) the database
con <- DBI::dbConnect(RSQLite::SQLite(), "MyDB.sqlite")

# Write data to the SQLite database
DBI::dbWriteTable(con, "mtcars", mtcars)
DBI::dbWriteTable(con, "iris", iris)

# View the tables in our database
DBI::dbListTables(con)

# Connect to one of the tables
mtcars_con <- dplyr::tbl(con, "mtcars")

# write queries
library(dbplyr)
library(dplyr)

# query 1
mtcars_q1 <- mtcars_con %>% 
  dplyr::select(mpg, cyl, disp)

# query 2
mtcars_q2 <- mtcars_con %>% 
  dplyr::filter(gear == 4) %>% 
  dplyr::select(mpg, cyl)

# query 3
mtcars_q3 <- mtcars_con %>% 
  dplyr::filter(qsec > 16) %>% 
  dplyr::group_by(gear) %>% 
  dplyr::summarise(
    mpg_max = max(mpg, na.rm=T), 
    cyl_mean = mean(cyl, na.rm=T))

# query 4
mtcars_q4 <- mtcars_con %>% 
  dplyr::group_by(gear) %>% 
  dplyr::filter(qsec > 16) %>% 
  dplyr::summarise(
    mpg_max = max(mpg, na.rm=T), 
    cyl_mean = mean(cyl, na.rm=T)) %>% 
  dplyr::filter(cyl_mean <= 5)
  
# look at the SQL code that dplyr generated
mtcars_q1 %>% show_query()
mtcars_q2 %>% show_query()
mtcars_q3 %>% show_query()
mtcars_q4 %>% show_query() # this one uses a subquery to avoid using HAVING.

# execute the sql code and retrieve the full results
mtcars_q1 %>% collect()
mtcars_q2 %>% collect()
mtcars_q3 %>% collect()
mtcars_q4 %>% collect()

# Or we manually write SQL instead!
result <- DBI::dbGetQuery(
  con, "
  SELECT gear, MAX(mpg) AS mpg_max, AVG(cyl) AS cyl_mean 
  FROM mtcars
  WHERE qsec > 16
  GROUP BY gear
  HAVING cyl_mean <= 5
")

# view the result
result

# A neat trick is to use string interpolation to edit the queries 
# with variables from your R environment:
# See https://stringr.tidyverse.org/reference/str_interp.html
for (next_cyl in c(4,6,8)) {
  res <- DBI::dbGetQuery(con, stringr::str_interp("
    SELECT * 
    FROM mtcars
    WHERE cyl = ${next_cyl}                    
  "))
  cat("\nResults for cyl = ", next_cyl, "\n")
  print(res)
}

# disconnect
DBI::dbDisconnect(con)

# Side note:
# You may want to browse the database we created, outside of R.
# For that, you can download DB Browser:
# https://sqlitebrowser.org/dl/

# After installing DB browser, you may have to choose "open with"
# on the "MyDB.sqlite" file, and navigate to your programs directory
# to find DB Browser to open it.

# Batched queries ---------------------------------------------------------

# create (or connect to) the database
con <- DBI::dbConnect(RSQLite::SQLite(), "MyDB.sqlite")

# Send a query but don't retrieve the results yet
rs <- DBI::dbSendQuery(con, "
  SELECT *
  FROM mtcars
")
rs

# Retrieve the first 3 results
df <- DBI::dbFetch(rs, n = 3)

# df is a regular data.frame
df
mean(df$mpg)

# We can see how many results have been retrieved
rs

# This will return TRUE if all results have been retrieved
DBI::dbHasCompleted(rs)

# Retrieve the next 3 results
df <- DBI::dbFetch(rs, n = 3)
df

# Retrieve the rest of the results, 3 at a time
while (!DBI::dbHasCompleted(rs)) {
  df <- DBI::dbFetch(rs, n = 3)
  
  # << insert processing on df here >>
  
  print(nrow(df))
}

# Clear/delete the query
DBI::dbClearResult(rs)

# disconnect
DBI::dbDisconnect(con)

# Writing csvs to a database ----------------------------------------------

# create (or connect to) the database
con <- DBI::dbConnect(RSQLite::SQLite(), "MyDB.sqlite")

# First let's make some CSVs to practice with (in the working directory)
write.csv(mtcars, "mtcars_example.csv")
write.csv(iris, "iris_example.csv")

# Find all the filenames in the working directory
all_filenames <- list.files(".")

# Find all the filenames that end in ".csv"
csv_filenames <- all_filenames %>% stringr::str_subset(".csv")

# Loop over the CSVs filenames
for (f in csv_filenames) {
  
  # Read in the CSV
  data <- read.csv(f)
  
  # Remove ".csv" from the name
  table_name <-  f %>% stringr::str_remove(".csv")
  
  # Write the table to our database
  RSQLite::dbWriteTable(con, name = table_name, value = data)
}

# List all the tables in our database
DBI::dbListTables(con)

# disconnect
DBI::dbDisconnect(con)


# Connect to the Sandpit database -----------------------------------------

# First download the sqlite Sandpit database from the link below,
# and save it in your working directory.
# https://github.com/frycast/SQL_course/raw/master/R/Sandpit.sqlite


# connect to Sandpit
con <- DBI::dbConnect(RSQLite::SQLite(), "Sandpit.sqlite")

# List all the tables in Sandpit
DBI::dbListTables(con)

# disconnect
DBI::dbDisconnect(con)
