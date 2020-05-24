options(digits = 3)
library(tidyverse)
library(titanic)
library(ggplot2)
library(dplyr)

titanic <- titanic_train %>%
  select(Survived, Pclass, Age, Sex, SibSp, Parch, Fare) %>%
  mutate(Survived = factor(Survived),
         Pclass = factor(Pclass),
         Sex = factor(Sex))
#Question Number 1
titanic %>% 
  filter(!is.na(Sex) & !is.na(Age))%>%
  group_by(Sex) %>%
  ggplot(aes(Age))+
  geom_density(bw = 2, position = "stack")+
  facet_grid(Sex~.)

##Question Number 3
params <- titanic %>%
  filter(!is.na(Age)) %>%
  summarize(mean = mean(Age), sd = sd(Age))

titanic%>%
  filter(!is.na(Age))%>%
  ggplot(aes(sample = Age))+
  geom_qq(dparams = params) + geom_abline()

#Question Number 4
titanic%>%
  ggplot(aes(Sex, fill = Survived))+
  geom_bar()

titanic%>%
  ggplot(aes(Survived, fill = Sex))+
  geom_bar()

titanic%>%
  ggplot(aes(Survived, fill = Sex))+
  geom_bar(position = position_dodge())

titanic%>%
  ggplot(aes(Sex, fill = Survived))+
  geom_bar(position = position_dodge())

#Question Number 5
titanic %>% 
  filter(!is.na(Age) & !is.na(Survived))%>%
  ggplot(aes(Age, y = ..count.., fill = Survived))+
  geom_density(alpha = 0.2, bw = 0.8)

#Question Number 6 -> Survival by fare
titanic %>%
  filter(Fare != 0)%>%
  ggplot(aes(Fare,Survived))+
  geom_boxplot()+
  geom_jitter(width = 0.1, alpha= 0.2)+
  scale_x_continuous(trans = "log2")


#Question Number 7 -> Survival by Passenger Class
titanic%>%
  ggplot(aes(Pclass, fill = Survived))+
  geom_bar()

titanic%>%
  ggplot(aes(Pclass, fill = Survived))+
  geom_bar(position = position_fill())

titanic%>%
  ggplot(aes(Survived, fill = Pclass))+
  geom_bar(position = position_fill())

##Question Number 8 -> Survival by Age, Sex and Passenger Class
titanic %>% 
  filter(!is.na(Age))%>%
  ggplot(aes(Age, y = ..count.., fill = Survived))+
  geom_density(alpha = 0.2, bw = 0.8)+
  facet_grid(rows = vars(Sex,Pclass))




##Question Number 2
# females_17 <- titanic%>%
#   filter(Sex == "female" & Age < 17)
# 
# males_17 <- titanic%>%
#   filter(Sex == "male" & Age < 17)
# 
# nrow(males_17)/nrow(males)
# nrow(females_17)/nrow(females)