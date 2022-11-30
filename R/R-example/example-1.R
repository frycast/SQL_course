rm(list=c("a","b"))

rm(list=ls())

a <- 1
b <- 1

install.packages("dplyr")
library(dplyr)

# A vector is a collection of objects of the same data type
my_variable <- c(1, 2, 3, 4)

x <- 5

my_function <- function(input, y) {
  input / 2 + y
}

my_function(my_variable, 10)
