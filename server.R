# Final Project

library(ggplot2)
library(dplyr)
library(shiny)
library(DT)
library(rsconnect)
library(shinycssloaders)
library(lubridate)

my.server <- function(input, output) {
  data <- read.csv("data/movies.csv")
  
  changing_data <- reactive({
    check_lang <- input$lang
    rating_max <- input$rating[2]
    rating_min <- input$rating[1]
    check_year <- input$year
    data$release_date <- lubridate::mdy(data$release_date)
    curr_data <- filter(data, original_language == check_lang) %>% 
      filter(vote_average <= rating_max) %>% filter(vote_average >= rating_min) %>% 
      filter(grepl(input$genre, genres) == TRUE) 
    if (check_year != "") {
      curr_data <- filter(curr_data, year(release_date) == check_year)
    }
    
    if(input$action != 0) {
      num <- nrow(curr_data)
      if (num > 10) {
        num <- 10
      }
      curr_data <- sample_n(curr_data, num)
    }
    num <- nrow(curr_data)
    if (num > 10) {
      num <- 10
    }
    curr_data <- sample_n(curr_data, num)
  })
  
  output$table <- renderDataTable({
    DT::datatable((select(changing_data(), c("original_title", "overview", "runtime", "vote_average"))), 
                  options = list(paging = FALSE), rownames = FALSE)
  })
  
  output$plot <- renderPlot({
    plot_data <- filter(changing_data(), budget != 0) %>% filter(revenue != 0)
    validate(
      need(nrow(plot_data) != 0, "No budget/revenue data to plot.")
    )
    ggplot(plot_data, aes((x = budget), y = (revenue/1000000), label=title)) +
      labs(y = "Revenue ($ in millions)", x = "Budget") +
      #geom_point()+
      geom_text(aes(label=title),hjust=-.1, vjust=.3) +
      ggtitle("Budget vs Revenue Comparison") + 
      theme(plot.title = element_text(face="bold", size=32, hjust=0)) +
      theme(axis.title = element_text(face="bold", size=22)) +
      theme(panel.background = element_rect(fill = "lightblue",
                                            colour = "lightblue",
                                            size = 0.5, linetype = "solid"))
  })
  
  output$gather_info <- renderText({
    paste("Data gathered from the movie data set found of kaggle")
  })
  output$our_info <- renderText({
    paste("Created by: Naveen Janarthanan, Camille Munro, Andy Tillotson, Jose Santos")
  })
}

shinyServer(my.server)