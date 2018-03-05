library(shiny)
library(ggplot2)
library(dplyr)
library(rsconnect)
my.ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      sliderInput("rating", "Select a rating", min = 1, max = 10),
      selectInput("genre", "Select a movie genre", choices = c("Drama", "Romance", "Comedy", "Action", "Crime", "Thiller", "Family", "Adventure",
                                                               "Fantasy", "Mystery", "Science Fiction", "Documentary", "Horror", "Western", "War",
                                                               "History", "Animation", "TV Movie", "Foreign")),
      selectInput("language", "Select a language", choices = c("English", "Spanish", "French",
                                                                "Chinese", "Japanese", "Italian", "Swedish",
                                                                "Russian", "German", "Korean")),
      radioButtons("age", "Allow adult movies?", choices = c("True", "False"))
    ),
    mainPanel(
      plotOutput("plot"),
      tableOutput("table")
    )
  )
)
