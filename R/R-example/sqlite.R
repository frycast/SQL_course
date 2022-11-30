install.packages(c("dbplyr", "DBI", "RSQLite"))

library(dplyr)
library(dbplyr)
library(DBI)
library(RSQLite)

# Adding data to database -------------------------------------------------

db_location <- "data/processed/example.db"

# Create the SQLite database and establish connection
con <- DBI::dbConnect(RSQLite::SQLite(), db_location)

# store rownames as a column called car
mtcars$car <- rownames(mtcars)

# Write a table to the SQLite database db1
DBI::dbWriteTable(con, "my_mtcars", mtcars, overwrite=TRUE)

# Querying the database ---------------------------------------------------

# execute a SQL query and save the resulting data.frame into a variable
my_mtcars <- DBI::dbGetQuery(con,
  "SELECT *
   FROM my_mtcars
  "
)

# Loading CSV files -------------------------------------------------------

my_csv <- read.csv("data/raw/my_csv.csv")

my_xl <- readxl::read_xlsx("data/raw/my_xl.xlsx")

DBI::dbWriteTable(con, "my_csv", my_csv, overwrite=TRUE)

DBI::dbWriteTable(con, "my_xl", my_xl, overwrite=TRUE)

# Disconnect from the SQLite database db1
DBI::dbDisconnect(con)















