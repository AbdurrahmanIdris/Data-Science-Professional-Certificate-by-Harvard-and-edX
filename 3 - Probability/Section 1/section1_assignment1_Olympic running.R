library(gtools)
library(tidyverse)

##problem statement:
# In the 200m dash finals in the Olympics, 8 runners compete for 3 medals (order matters). 
# In the 2012 Olympics, 3 of the 8 runners were from Jamaica and the other 5 were from 
# different countries. 
# The three medals were all won by Jamaica (Usain Bolt, Yohan Blake, and Warren Weir).

#Question 1a
Different_ways <- permutations(8,3,v=1:8)
nrow(Different_ways)

#Question 1b
Different_ways_jamaica <- permutations(3,3,v=1:3)
nrow(Different_ways_jamaica)

#Question 1c
jamaica_win <- Different_ways_jamaica / Different_ways

#Question 1d -> Monte Carlo simulation
runners <- c("Jamaica", "Jamaica", "Jamaica", "USA", "Ecuador", "Netherlands", "France", "South Africa")
B <- 10000
set.seed(1,sample.kind = "Rounding")
prob <- replicate(B,{
  event <- sample(runners,3)
  all(event == "Jamaica")
})