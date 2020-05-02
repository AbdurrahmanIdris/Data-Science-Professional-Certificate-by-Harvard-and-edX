set.seed(16, sample.kind = "Rounding")
act_scores <- rnorm(10000,20.9,5.7)

#In act_scores, how many perfect scores are there out of 10,000 simulated tests?
sum(act_scores >= 36)

#In act_scores, what is the probability of an ACT score greater than 30?
1 - pnorm(30,mean(act_scores),sd(act_scores))

#In act_scores, what is the probability of an ACT score less than or equal to 10?
pnorm(10,mean(act_scores),sd(act_scores))

#Set x equal to the sequence of integers 1 to 36. 
#Use dnorm to determine the value of the probability density function over x 
#given a mean of 20.9 and standard deviation of 5.7; save the result as f_x. 
#Plot x against f_x.
x <- seq(1,36,by = 1)
f_x = dnorm(x,20.9,5.7)
plot(x,f_x)


#What is the probability of a Z-score greater than 2 (2 standard deviations above the mean)?
p_z_greater_than_two <- 1 - pnorm(mean(act_scores) + 2 * sd(act_scores),mean(act_scores),sd(act_scores))

#What ACT score value corresponds to 2 standard deviations above the mean (Z = 2)?
2 * sd(act_scores) + mean(act_scores)

#A Z-score of 2 corresponds roughly to the 97.5th percentile.
#Use qnorm() to determine the 97.5th percentile of normally distributed data with the mean and standard deviation observed in act_scores.
#What is the 97.5th percentile of act_scores?
qnorm(0.975,mean(act_scores),sd(act_scores))

#Write a function that takes a value and produces the probability of an ACT score less than or equal to that value (the CDF). 
#Apply this function to the range 1 to 36.
cdf <- function(a) mean(act_scores<=a)
paste(x,sapply(x,cdf))
#What is the expected 95th percentile of ACT scores?
qnorm(0.95,20.9,5.7)


#In what percentile is a score of 26?
p <- seq(0.01, 0.99, 0.01)
sample_quantiles <- quantile(act_scores,p, names = TRUE)
names(sample_quantiles[max(which(sample_quantiles < 26))])
theoretical_quantiles <- qnorm(p,20.9,5.7)
plot(theoretical_quantiles,sample_quantiles)