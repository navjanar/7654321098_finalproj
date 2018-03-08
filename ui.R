# Final Project
library(shinycssloaders)

my.ui <- fluidPage(
  titlePanel("Random Movie Generator"),

  sidebarPanel(
    selectInput("lang", h3("Pick a language:"), choices = c("Chinese" = "zh", "English" = "en", "French" = "fr", "German" = "de", 
                                                            "Italian" = "it", "Japanese" = "ja", "Korean" = "ko", "Russian" = "ru", 
                                                            "Spanish" = "es", "Swedish" = "sv")),
    selectInput("genre", h3("Pick a genre:"), choices = c("Action", "Adventure", "Animation", "Comedy", "Crime", "Documentary", "Drama", 
                                                          "Family", "Fantasy", "Foreign", "History", "Horror", "Mystery", "Romance",  
                                                          "Science Fiction", "Thriller", "TV Movie", "War", "Western")),
    # textInput("year", label = h3("Year released"), value = "2018"), 
    sliderInput("rating", label = h3("Rating:"), min = 0,
                max = 10, value = c(0, 10)),
    width = 3
  ),
  
  mainPanel(
    withSpinner(DT::dataTableOutput('table')),
    br(),
    br(),
    withSpinner(plotOutput('plot'))
  ) 
)

shinyUI(my.ui)