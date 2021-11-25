
# Programmatically edit queries -------------------------------------------

# connect
con <- DBI::dbConnect(RSQLite::SQLite(), "MyDB.sqlite")

# stringr library for editing strings (called string interpolation)
# this means inserting data from R environment into the string.
x <- "'setosa'"
query1 <- stringr::str_interp("
      SELECT *
      FROM iris
      WHERE Species = ${x}
")

# cat prints the query string a bit better
cat(query1)

# loop executing the query
for (this_species in c("'setosa'", "'versicolor'")) {
  
  # create the query using string interpolation
  this_query <- stringr::str_interp("
      SELECT *
      FROM iris
      WHERE Species = ${this_species}
  ")
  
  # execute the query by sending it to database engine
  this_result <- DBI::dbGetQuery(con, this_query)
  
  # print results
  cat("The results for this query are:\n")
  cat(this_query)
  print(this_result)
}

DBI::dbDisconnect(con)

# Batch processing --------------------------------------------------------

# connect
con <- DBI::dbConnect(RSQLite::SQLite(), "MyDB.sqlite")

# write query string
query2 <- "

  SELECT *
  FROM iris;

"

# send the query without retrieving results
rs <- DBI::dbSendQuery(con, query2)

# what is rs? It holds the query and tells me how many rows have been retrieved
rs

# retrieve three rows
three_rows <- DBI::dbFetch(rs, n = 3)

# three_rows is a data.frame with first 3 rows of the query result
three_rows

# retrieve next three rows
next_three_rows <- DBI::dbFetch(rs, n = 3)

# next_three_rows is a data.frame with second 3 rows of the query result
next_three_rows

# how many rows have we fetched so far?
rs

# also just shows how many rows are fetched so far (6)
DBI::dbGetRowCount(rs)

# we can also check if it has completed
DBI::dbHasCompleted(rs)

# while loop to keep fetching rows
while(!DBI::dbHasCompleted(rs)) {
  next_three_rows <- DBI::dbFetch(rs, n = 3)
  
  # << do some processing / analysis in here >>
  
  cat("\n\n The next three rows are:\n")
  print(next_three_rows)
}


# Basics of while loop and if condition -----------------------------------

# create a loop
i <- 0
while (i < 10) {
   i <- i + 1
   print(i)
}

# if condition
condition <- FALSE
if (condition) {
  print("the condition is true")
} else {
  print("the condition is false")
}


















