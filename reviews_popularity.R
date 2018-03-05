library(dplyr)

setwd("~/desktop/INFO_201/Assignments/7654321098_finalproj")
data <- read.csv("data/movies.csv")

curr_data <- sample_n(data, 10)

curr_data_rev <- select(curr_data, c(original_title, vote_average))
curr_data_pop <- select(curr_data, c(original_title, popularity))

curr_data_table <- select(curr_data, c(poster_path, original_title, overview, release_date))
