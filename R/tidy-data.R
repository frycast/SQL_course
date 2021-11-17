# To get started, we need the tidyr package
install.packages("tidyr")
library(tidyr)


# Relig_income data -------------------------------------------------------

# The package comes with its own datasets to practice on, for example:
relig_income

# Pivoting the table will make it 'tidy'
pivot_longer(
  data=relig_income,
  cols=!religion,
  names_to = "income", 
  values_to = "count"
)

# Non-atomic cell values --------------------------------------------------

# Create the address data
address_data <- data.frame(
  name = c("Raleigh Smith",
           "Hoa Pham", 
           "Ram Singh"),
  address = c("109 Tenterfield Rd, North Sydney, NSW, 2060",
              "36 Feather St, Kings Beach, QLD, 4551",
              "90 Sunnyside Rd, Renmark, SA, 5341")
)

# Separate the address column
separate(
  data = address_data,
  col = address,
  into = c("street","city","state","postcode"),
  sep = ", ")

# Anscombe's Quartet data -------------------------------------------------

anscombe_tidy <- pivot_longer(
  data = anscombe,
  cols = everything(),
  names_to = c(".value", "set"),
  names_pattern = "(.)(.)"
)

anscombe_tidy

## Figuring out the rest of this example is an advanced exercise
## It should not be attempted by a new R programmer.

# Plot the data with lines of best fit
library(ggplot2)
anscombe_tidy %>% 
  ggplot(aes(x = x, y = y)) +
  geom_point() + 
  facet_wrap(~set) +
  geom_smooth(method = "lm", se = FALSE) +
  theme_minimal()

# apply linear regression to each model and obtain results for comparison
library(dplyr)
library(map)
library(broom)
library(purrr)
anscombe_long %>% 
  nest(data = !set) %>%
  mutate(
    model = map(data, ~lm(y~x, data = .)), 
    tidied = map(model, tidy),
    data = map(model, augment)) %>% 
  unnest(tidied)