# Initial data exploration for life expectancy dataframe

summary(expectancy)

unique(expectancy$race)

unique(expectancy$sex)

# Plot life expectancy over year

# Filter dataframe to only include aggreated data

trend <- expectancy
trend <- trend[trend$race == "All Races", ]
trend <- trend[trend$sex == "Both Sexes", ]

# Removed unneeded variables

trend$race <- NULL
trend$sex <- NULL
trend$death_rate <- NULL

# Plot year by life expectancy

plot(trend)

