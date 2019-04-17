

# NUMERIC OBJECT

a <- 9
a
class(a)
class(a) <- "custom_numeric"

# CHARACTER OBJECT
b <- "nine"
b
class(b)

library(stringr)
str_glue(b, " times 2")

# VECTOR

alpha <- c("A", "B", "C", "D", "E")
alpha
alpha[1]
alpha[5]
class(alpha)

n <- c(20,30,40,50,60)
n
n * 4

# MATRIX

m <- c(1,2,3,4,5,6,7,8,9)
dim(m) <- c(3,3)
m
m[2, 1]

# LIST

l <- list()
l$name <- "Cards"
l$cards <- c("10","Jack","Queen","King","Ace")
l$bets <- c(1,5,10)
l$cards[2]

# FACTOR

sex <- factor(c("male","female","unknown","male"))
sex

# DATA FRAMES

df <- data.frame(numbers = c(1,2,3),
                 letters = c("A","B","C"))
df$more <- c("1st","2nd","3rd")
df

# IF-THEN STATEMENTS

state <- "startup"

if(state == "startup") {
  print("We are about to start the program")
  state = "running program"
} else {
  print("Program running")
}

ifelse(state == "startup", TRUE, FALSE)

# FOR LOOPS

for (i in 1:5){
  print(i)
}

# WHILE LOOP

i <- 0

while (i <= 5) {
  print(i)
  i <- i + 1
}

# LAPPLY

sapply(1:5, function(x){
  x * 2
  })


# FUNCTION OBJECT

my_fun <- function(x, y) {
  r = x * 2 + y
  r
}

class(my_fun)
my_fun
my_fun(3, 189)

# JSON

library(tidyverse)
library(jsonlite)
life_json <- expectancy %>% 
  head() %>% 
  toJSON()
life <- fromJSON(life_json)
