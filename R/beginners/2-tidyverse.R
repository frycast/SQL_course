# dplyr introduces a grammar of data manipulation (similar to SQL)
# https://dplyr.tidyverse.org/
library(dplyr)

# dbplyr helps dplyr work with databases
# https://dbplyr.tidyverse.org/
library(dbplyr)

# Connect to SQLite
library(RSQLite)
con <- DBI::dbConnect(RSQLite::SQLite(), "MyDB.sqlite")

# List all tables
DBI::dbListTables(con)

# Connect to one table
iris_query1 <- dplyr::tbl(con, "iris")

# iris_query is now SELECT * FROM iris
dplyr::show_query(iris_query1)

# filter is the WHERE clause
iris_query2 <- iris_query1 %>% 
  dplyr::filter(Species == 'setosa')

# iris_query2 is now SELECT * FROM iris WHERE Species = 'setosa'
dplyr::show_query(iris_query2)

# select is the SELECT clause
iris_query3 <- iris_query2 %>% 
  dplyr::select(Sepal.Length, Sepal.Width, Species)

# iris_query3 is now SELECT Sepal.Length, Sepal.Width, Species FROM iris WHERE Species = 'setosa'
dplyr::show_query(iris_query3)

# group_by is the GROUP BY clause
iris_query4 <- iris_query3 %>% 
  dplyr::group_by(Species)

# iris_query4 hasn't done the grouping yet, because I haven't aggregated
dplyr::show_query(iris_query4)

# do some aggregation using summarise with n() meaning COUNT(*)
iris_query5 <- iris_query4 %>% 
  dplyr::summarise(n = dplyr::n())

# iris_query5 now includes GROUP BY and COUNT(*)
iris_query5 %>% dplyr::show_query()

# finally collect results of iris_query5
iris_result <- dplyr::collect(iris_query5)

# look at the result
iris_result

# Full query in one piece
full_query <- dplyr::tbl(con, "iris") %>% 
  dplyr::filter(Species == 'setosa') %>% 
  dplyr::select(Sepal.Length, Sepal.Width, Species) %>% 
  dplyr::group_by(Species) %>% 
  dplyr::summarise(n = dplyr::n())

# full_query is now the same as iris_query5
dplyr::collect(full_query)




