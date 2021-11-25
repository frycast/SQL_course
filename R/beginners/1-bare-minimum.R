# install.packages("RSQLite")
library(RSQLite)
library(DBI)

# Connect
con <- DBI::dbConnect(RSQLite::SQLite(), "MyDB.sqlite")

# Save something to the database
DBI::dbWriteTable(con, "iris", iris)

# Write a query
iris_setosa <- DBI::dbGetQuery(con, "

  SELECT *
  FROM iris
  WHERE Species = 'setosa'
                
")

# Look at iris_setosa
iris_setosa

# Save iris_setosa as a CSV
library(readr)
readr::write_csv(iris_setosa, "iris_setosa.csv")

# Disconnect
DBI::dbDisconnect(con)