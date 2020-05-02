library(gtools)
library(tidyverse)

#Question 2a
entree_comb <- combinations(6,1)
sides_comb <- combinations(6,2)
drink_comb <- combinations(2,1)
meal_combinations <- nrow(entree_comb) * nrow(sides_comb) * nrow(drink_comb)
meal_combinations

#Question 2b
entree_comb <- combinations(6,1)
sides_comb <- combinations(6,2)
drink_comb_extended <- combinations(3,1)
meal_combinations_update1 <- nrow(entree_comb) * nrow(sides_comb) * nrow(drink_comb_extended)
meal_combinations_update1


#Question 2c
entree_comb <- combinations(6,1)
sides_comb_extended <- combinations(6,3)
drink_comb_extended <- combinations(3,1)
meal_combinations_update2 <- nrow(entree_comb) * nrow(sides_comb_extended) * nrow(drink_comb_extended)
meal_combinations_update2

#Question 2d
number_of_meals <- function(entree_choices){
  entree_comb <- combinations(entree_choices,1)
  sides_comb <- combinations(6,2)
  drink_comb <- combinations(3,1)
  meal_combinations <- nrow(entree_comb) * nrow(sides_comb) * nrow(drink_comb_extended)
  meal_combinations
}

meals_entree_range <- seq(1:12)
result <- sapply(meals_entree_range,number_of_meals)
paste(meals_entree_range,result)


#Question 2e
number_of_sides <- function(sides_choices){
  entree_comb <- combinations(6,1)
  sides_comb <- combinations(sides_choices,2)
  drink_comb <- combinations(3,1)
  meal_combinations <- nrow(entree_comb) * nrow(sides_comb) * nrow(drink_comb_extended)
  meal_combinations
}

sides_entree_range <- seq(2,12,1)
result <- sapply(sides_entree_range,number_of_sides)
paste(sides_entree_range,result)