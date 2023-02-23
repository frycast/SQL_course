# -----------------------
#
# Author: Daniel Fryer
# Date: 2023-02-23
#
# Helper functions for bioinformatics example
#
# -----------------------


# create_dummy_database
#
# This fuction loads '.sql' file and then executes
# every statement in the file, on the sql database.
#
# It breaks the script up and executes one statement 
# at a time because dbExecute is unable to 
# execute multiple stataments.
#
execute_sql_script <- function(con, file) {
  sql <- readr::read_file(file)
  sql <- glue::glue_collapse(sql)
  sql <- strsplit(sql, ";")
  lapply(
    sql[[1]],
    function(s) {DBI::dbExecute(con, s)}
  )
}


# split_variant_name
#
# The first letter of a variant name refers to the amino acid that is normally 
# at the position within the gene.
#
# Sandwiched between the first and last letter is a number.
# This number is the position within the gene.
#
# The last letter of a variant name refers to the amino acid resulting from
# the change.
#
split_variant_name <- function(variant_name) {
  first_letter <- stringr::str_sub(variant_name, 1, 1)
  last_letter <- stringr::str_sub(variant_name, - 1, - 1)
  middle_part <- stringr::str_sub(variant_name, 2, -2)
  return(
    data.frame(change_from = first_letter,
               position = as.integer(middle_part),
               change_to = last_letter)
  )
}


# find_gene_variant_by_name
#
# check if a gene_variant is already in the database, searching
# only by gene name and variant name
#
# if it is present, return details from the database=
# otherwise, return an empty table
#
find_gene_variant_by_name <- function(con, gene_name, variant_name) {
  
  query <- glue::glue("
    SELECT G.name AS gene_name, 
           V.name AS variant_name,
           GV.pop_freq, GV.comment,
           G.gene_id, V.variant_id, GV.gene_variant_id 
    FROM gene_variant GV 
      JOIN gene G ON GV.gene_id = G.gene_id
      JOIN variant V ON GV.variant_id = V.variant_id
    WHERE G.name = '{gene_name}' AND V.name = '{variant_name}'
  ")
  return(DBI::dbGetQuery(con, query))
}


# find_gene_variant_by_name
#
# check if a gene_variant is already in the database, searching
# only by gene_id and variant_id
#
# if it is present, return details from the database=
# otherwise, return an empty table
#
find_gene_variant <- function(con, gene_id, variant_id) {
  
  query <- glue::glue("
    SELECT G.name AS gene_name, 
           V.name AS variant_name,
           GV.pop_freq, GV.comment,
           G.gene_id, V.variant_id, GV.gene_variant_id 
    FROM gene_variant GV 
      JOIN gene G ON GV.gene_id = G.gene_id
      JOIN variant V ON GV.variant_id = V.variant_id
    WHERE G.name = '{gene_id}' AND V.name = '{variant_id}'
  ")
  return(DBI::dbGetQuery(con, query))
}
