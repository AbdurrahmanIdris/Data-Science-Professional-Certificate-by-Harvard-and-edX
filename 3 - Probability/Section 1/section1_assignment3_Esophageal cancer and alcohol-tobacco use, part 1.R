library(gtools)
library(tidyverse)
library(dplyr)
data("esoph")

all_cases <- sum(esoph$ncases)
all_controls <- sum(esoph$ncontrols)

highest_alcgp <- esoph %>%
  filter(alcgp == "120+")

cases_with_highest_alcgp <- sum(highest_alcgp$ncases)
controls_with_highest_alcgp <- sum(highest_alcgp$ncontrols)

p_cases_high_alc <- cases_with_highest_alcgp / all_cases
p_controls_high_alc <- controls_with_highest_alcgp / all_controls


p_cases_high_alc / p_controls_high_alc

controls_in_high_tob <- esoph %>%
  filter(tobgp == "30+") %>%
  pull(ncontrols)%>%
  sum()

p_controls_high_tob <- controls_in_high_tob / all_controls

controls_in_high_tob_and_high_alc <- esoph %>%
  filter(tobgp == "30+" & alcgp == "120+") %>%
  pull(ncontrols)%>%
  sum()

p_controls_in_high_tob_and_high_alc <- controls_in_high_tob_and_high_alc / all_controls


p_controls_high_alc_or_tob <- p_controls_high_alc + p_controls_high_tob - p_controls_in_high_tob_and_high_alc
p_controls_high_alc_or_tob