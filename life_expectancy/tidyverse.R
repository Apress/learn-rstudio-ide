
# Base R way

round(mean(subset(expectancy, race == "All Races")$death_rate), 1)

# Install and reference tidyverse if needed

# install.packages("tidyverse")
library(tidyverse)

# Tidyverse magritte way

expectancy %>% 
  subset(race == "All Races") %>% 
  .$death_rate %>% 
  mean() %>% 
  round(1)

# Tibbles

iris %>% as_tibble()

# dplyr

expectancy %>% 
  filter(race == "All Races") %>% 
  summarize(avg = mean(death_rate)) %>% 
  mutate(avg = round(avg, 1))

# dplyr group by

expectancy %>% 
  filter(race == "All Races") %>% 
  group_by(sex) %>% 
  summarize(avg = mean(death_rate)) %>% 
  mutate(avg = round(avg, 1))

# Make label

labels <- tribble(
    ~key, ~new_label,
    "Both Sexes",   "All Genders",
    "Female",   "Identifies Female",
    "Male",   "Identifies Male"
  )

# Join new label

expectancy %>% 
  filter(race == "All Races") %>% 
  group_by(sex) %>% 
  summarize(avg = mean(death_rate)) %>% 
  inner_join(labels, by = c("sex" = "key")) %>% 
  mutate(avg = round(avg, 1)) %>% 
  select(gender = new_label,
         avg_death_rate = avg)

avg_death_rates_by_gender <- 
  expectancy %>% 
  filter(race == "All Races") %>% 
  group_by(sex) %>% 
  summarize(avg = mean(death_rate)) %>% 
  inner_join(labels, by = c("sex" = "key")) %>% 
  mutate(avg = round(avg, 1)) %>% 
  select(gender = new_label,
         avg_death_rate = avg)

# stringr

expectancy %>% 
  filter(str_detect(race, "All"))

expectancy <- 
  expectancy %>% 
  mutate(race = str_replace(race, "All", "Most"))

unique(expectancy$race)
