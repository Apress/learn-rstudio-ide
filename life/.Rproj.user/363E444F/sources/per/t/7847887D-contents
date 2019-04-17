# Import NCHS Dataset
# File download from:
#   https://catalog.data.gov/dataset
#         /age-adjusted-death-rates-and-life-expectancy-at-birth-all-races-both-sexes-united-sta-1900
# Contains life expectancy data from 1900 in the US

library(readr)
life_expectancy <- read_csv("data/NCHS_-_Death_rates_and_life_expectancy_at_birth.csv")

# Clean up dataframe
# Use shorter column names

names(life_expectancy)[1] <- "year"
names(life_expectancy)[2] <- "race"
names(life_expectancy)[3] <- "sex"
names(life_expectancy)[4] <- "life_expectancy"
names(life_expectancy)[5] <- "death_rate"

save(life_expectancy,
     file ="data/life_expectancy.rdata")

