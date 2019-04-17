#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)

load("expectancy.rdata")

expectancy <-
  expectancy %>%
  filter(!is.na(life_expectancy))

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Life Expectancy Data"),
    
    p("Life expectancy data was downloaded from data.gov. This 
      dataset contains death rates and life-expectancy statistics 
      from 1900 to 2015. Exploratory analysis was conducted on this 
      dataset. In the visualization below, you can see all life expectancy 
      rates in the dataset and adjust the number of bins used to present the 
      frequency."),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw 
# a histogram

server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on 
        # input$bins from ui.R
       life_expectancy  <- expectancy$life_expectancy
        
        bins <- seq(min(life_expectancy), 
                    max(life_expectancy), 
                    length.out = input$bins + 1)

        # draw the histogram with the 
        # specified number of bins
        hist(life_expectancy, 
             breaks = bins, 
             col = 'lightblue', 
             border = 'white')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
