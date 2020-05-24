library (dslabs)
library(dplyr)
data (heights)
options(digits = 3)

avg <- mean(heights$height)
ind <- which(heights$height > avg)
sum(heights$height > avg & heights$sex %in% "Female")

heights_logic <- heights$sex %in% "Female"
mean(heights_logic)

min_height <- min(heights$height)
ind_smaller <- match(50,heights$height)
heights$sex[smaller]

max_height <- max(heights$height)

x <- 50:82
sum(!(x %in% heights$height))
sum(x %in% heights$height)

sum(heights$height[1:18])

heights2 <- mutate(heights, ht_cm = height*2.54)

female <- filter(heights2,heights2$sex=="Female")
mean(female$ht_cm)



data(olive)
#with(olive,plot(palmitic,palmitoleic))
#with(olive,hist(eicosenoic))
boxplot(palmitic ~ region, data = olive)