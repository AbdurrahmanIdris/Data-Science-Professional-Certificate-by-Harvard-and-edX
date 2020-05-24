#Load important libraries
library(dslabs)
library(dplyr)
library(ggplot2)
library(ggthemes)
library(ggrepel)

#Load dataset that we will work with
data("murders")

#Define the intercept
r <- murders %>%
  summarize(rate = sum(total) / sum(population) * 10^6) %>%
  pull(rate)

#Make the plot
p <- murders %>% ggplot(aes(population / 10^6, total, label = abb))+
  geom_abline(intercept = log10(r), lty = 2, color = "darkgrey")+
  geom_point(aes(col = region), size = 3)+
  geom_text_repel()+
  scale_x_log10() + scale_y_log10()+
  xlab("Population in millions (Log Scale)")+
  ylab("Total number of murders (Log Scale)")+
  ggtitle("US Gun Murders in 2010")+
  scale_color_discrete(name = "Region")+
  theme_economist()

#Show the graph
print(p)