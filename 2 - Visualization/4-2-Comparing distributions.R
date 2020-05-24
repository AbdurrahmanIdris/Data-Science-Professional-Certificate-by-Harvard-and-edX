library(dplyr)
library(dslabs)
library(ggplot2)

data("gapminder")

gapminder <- gapminder%>%
  mutate(dollars_per_day = gdp/population/365)
past_year <- 1970
present_year <- 2010

#Code: Histogram of income in West versus developing world, 1970 and 2010
west <- c("Western Europe", "Northern Europe", "Southern Europe", "Northern America", "Australia and New Zealand")
gapminder%>%
  filter(year %in% c(present_year,past_year) & !is.na(gdp))%>%
  mutate(group = ifelse(region %in% west, "West", "Developing")) %>%
  ggplot(aes(dollars_per_day)) +
  geom_histogram(binwidth = 1, color = "black")+
  scale_x_continuous(trans = "log2")+
  facet_grid(year ~ group)


#Code: Income distribution of West versus developing world, only countries with data 
country_list_1 <- gapminder%>%
  filter(year == past_year & !is.na(dollars_per_day))%>%
  .$country
country_list_2 <- gapminder %>%
  filter(year == present_year & !is.na(dollars_per_day)) %>%
  .$country
country_list <- intersect(country_list_1, country_list_2)

gapminder%>%
  filter(year %in% c(present_year,past_year) & country %in% country_list) %>%
  mutate(group = ifelse(region %in% west, "West", "Developing")) %>%
  ggplot(aes(dollars_per_day)) +
  geom_histogram(binwidth = 1, color = "black")+
  scale_x_continuous(trans = "log2")+
  facet_grid(year ~ group)


# Code: Boxplots of income in West versus developing world, 1970 and 2010
gapminder%>%
  filter(year %in% c(present_year,past_year) & country %in% country_list) %>%
  mutate(region = reorder(region, dollars_per_day, FUN = median)) %>%
  ggplot() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  xlab("") + scale_y_continuous(trans = "log2")+
  geom_boxplot(aes(region, dollars_per_day, fill = factor(year)))
