# Final Project
library(shinycssloaders)
library(shinythemes)


my.ui <- fluidPage(
  theme = shinytheme("cerulean"),
  titlePanel("Random Movie Generator",
  windowTitle = "Random Movie Generator"), 
  
  sidebarPanel(
    selectInput("lang", h3("Pick a language:"), choices = c("Chinese" = "zh", "English" = "en", "French" = "fr", "German" = "de", 
                                                            "Italian" = "it", "Japanese" = "ja", "Korean" = "ko", "Russian" = "ru", 
                                                            "Spanish" = "es", "Swedish" = "sv")),
    selectInput("genre", h3("Pick a genre:"), choices = c("Action", "Adventure", "Animation", "Comedy", "Crime", "Documentary", "Drama", 
                                                          "Family", "Fantasy", "Foreign", "History", "Horror", "Mystery", "Romance",  
                                                          "Science Fiction", "Thriller", "TV Movie", "War", "Western")),
    textInput("year", label = h3("Year released"), value = ""), 
    sliderInput("rating", label = h3("Rating:"), min = 0,
                max = 10, value = c(0, 10)),
    actionButton("action", label = "Refresh"),
    width = 3
  ),
  
  mainPanel(
    withSpinner(DT::dataTableOutput('table')),
    br(),
    br(),
    withSpinner(plotOutput('plot')),
    br(), 
    br(), 
    textOutput("gather_info"),
    textOutput("our_info")
  ) 
)

shinyUI(my.ui)