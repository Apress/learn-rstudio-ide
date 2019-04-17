# Data Visualization with ggplot2
# New comment here

library(tidyverse)

source("process_data.R")

expectancy %>% 
  filter(race == "All Races",
         sex == "Both Sexes") %>% 
  ggplot(aes(year, life_expectancy)) +
  geom_line()

expectancy %>% 
  filter(race == "All Races",
         sex == "Both Sexes") %>% 
  ggplot(aes(year, life_expectancy)) +
  geom_line() +
  geom_point()

expectancy %>% 
  filter(race == "All Races") %>% 
  ggplot(aes(year, life_expectancy)) +
  geom_line(aes(color = sex))

# HTML Widgets

## Plotly

library(plotly)

i_plot <- 
  expectancy %>% 
  filter(race == "All Races") %>% 
  ggplot(aes(year, life_expectancy)) +
  geom_line(aes(color = sex))

ggplotly(i_plot)

## Data Table

library(DT)
datatable(expectancy, 
          options = list(pageLength = 10))

## D3

data <- expectancy$death_rate

library(r2d3)

r2d3(data = c(.1,.2,.3,.4,.3,.2,.1), 
     script = "d3_plot.js")


