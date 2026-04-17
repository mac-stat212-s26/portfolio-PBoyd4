#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(tidyverse)
library(sf)
library(plotly)

data_by_dist <- read_rds("data/diverse_data_by_dist.rds")
data_by_year <- read_csv("data/diverse_data_by_year.csv")

# Define UI for application that draws a histogram
metro_names <- data_by_dist |>
  pull(metro_name) |>
  unique()

ui <- fluidPage(

  titlePanel("Neighborhood Diversity"),

  sidebarLayout(
    sidebarPanel(

      selectInput(
        inputId = "city_name",
        label = "Select city name",
        choices = metro_names
      ),

      sliderInput(
        inputId = "span_value",
        label = "Choose smoothing span",
        min = 0,
        max = 1,
        value = 0.5
      )

    ),

    mainPanel(
      plotOutput("scatter_plot"),
      plotOutput("map_plot"),
      plotOutput("bar_plot")
    )
  )
)

server <- function(input, output) {

  output$scatter_plot <- renderPlot({
    plot(1:10, 1:10,
         main = "Scatterplot will go here")
  })

  output$map_plot <- renderPlot({
    plot(1:10, 1:10,
         main = "Map will go here")
  })

  output$bar_plot <- renderPlot({
    barplot(1:5,
            main = "Bar chart will go here")
  })

}

shinyApp(ui = ui, server = server)
