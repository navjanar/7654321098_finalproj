# Final Project

library(ggplot2)
library(dplyr)
library(shiny)
library(DT)
library(rsconnect)
library(shinycssloaders)

my.server <- function(input, output) {
  data <- read.csv("data/movies.csv")
  
  changing_data <- reactive({
    check_lang <- input$lang
    rating_max <- input$rating[2]
    rating_min <- input$rating[1]
    
    
    curr_data <- filter(data, original_language == check_lang) %>% 
      filter(vote_average <= rating_max) %>% filter(vote_average >= rating_min) %>% 
      filter(grepl(input$genre, genres) == TRUE)
    num <- nrow(curr_data)
    if (num > 10) {
      num <- 10
    }
    curr_data <<- sample_n(curr_data, num)
  })
  
  output$table <- renderDataTable({
    display_data <- select(changing_data(), c("original_title", "release_date", "overview", "runtime"))
  }, rownames = FALSE)
  
  output$plot <- renderPlot({
    plot_data <- subset(changing_data(), budget != 0 & revenue != 0)
    ggplot(plot_data, aes(x=budget, y=revenue, label=title)) +
      labs(y= "Revenue", x = "Budget") +
      geom_text(aes(label=title),hjust=-.1, vjust=.3) +
      ggtitle("Budget vs Revenue Comparison") + 
      theme(plot.title = element_text(face="bold", size=32, hjust=0)) +
      theme(axis.title = element_text(face="bold", size=22))
  })
}

shinyServer(my.server)