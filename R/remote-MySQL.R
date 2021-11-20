install.packages("RMySQL")
library(RMySQL)

# Choose the database name and password
database <- "Sandpit"
password <- "insert_password_here"

# Connect to the database
con <- DBI::dbConnect(RMySQL::MySQL(), 
                 host = "db-intro-sql-do-user-9289996-0.b.db.ondigitalocean.com", 
                 port = 25060, # Replace this number with the actual port number 
                 dbname = database, 
                 user =  "RSCloud", 
                 password = password)

# List the tables
DBI::dbListTables(con)

##### USE DATABASE HERE #######

library(dbplyr)
library(dplyr)
d1 <- tbl(con, "Notes_Friends")
d2 <- tbl(con, "Notes_Pets")

# See:
# https://dbplyr.tidyverse.org/

##############################

# Disconnect
DBI::dbDisconnect(con)
