library(shiny)
library(ggplot2)
library(dplyr)
library(rsconnect)

my.server <- function(input, output) {
  data <- read.table(file = "movies.csv")
  genre <- reactive({
    switch(input$genre, "Drama" = "Drama", "Romance" = "Romance", "Comedy" = "Comedy", "Action" = "Action",
           "Crime" = "Crime", "Thiller" = "Thriller", "Family" = "Family", "Adventure" = "Adventure",
           "Fantasy" = "Fantasy", "Mystery" = "Mystery", "Science Fiction" = "Science Fiction",
           "Documentary" = "Documentary", "Horror" = "Horror", "Western" = "Western", "War" = "War",
           "History" = "History", "Animation" = "Animation", "TV Movie" = "TV Movie", "Foreign" = "Foreign")
    })
  language <- reactive({
    switch(input$language, "English" = "en", "Spanish" = "es", "French" = "fr",
           "Chinese" = "zh", "Japanese" = "ja", "Italian" = "it", "Swedish" = "sv",
           "Russian" = "ru", "German" = "de", "Korean" = "ko")
  })
   <- read.csv("TEMP FILE")
  
  output$plot <- renderPlot({
    ggplot(final_data, aes(x = final_data[, nutrient()], y = calories)) +
      geom_point(size = 3, fill = color(), color = color(), shape = 1) +
      xlab(nutrient()) +
      ggtitle("A selected nutrient compared to calories in cereals") +
      ylab("calories")
  })
}
