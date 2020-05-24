#Import libraries
library(gridExtra)
library(dslabs)
library(ggplot2)
library(dplyr)

data("heights")

p <- heights %>% filter(sex == "Male") %>% ggplot(aes(x = height))

#basic histograms
#p + geom_histogram()
#p + geom_histogram(binwidth = 1)
#p + geom_histogram(binwidth = 1, fill = "yellow", col = "black")+
#  xlab("Men heights in inches")+
#  ggtitle("Histogram")

#Smooth density plots
#p + geom_density()
#p + geom_density(fill = "orange")

