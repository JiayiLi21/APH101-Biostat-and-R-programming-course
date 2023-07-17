setwd("/Users/lijiayi/Desktop/Baseline/Y2S2/APH101/lab/lab5/Results")
#################  random sampling
# define number of samples in population
n<-10000 

# create empty vector of length n
sample_means = rep(NA, n)

# fill empty_vector with means
for(i in 1: n){
  sample_means[i] = mean(rnorm(1000, mean=167.7, sd=5.3))
}
head(sample_means)

# create histogram to visualize
hist(sample_means, main="Sampling Distribution(n=1000)",
     xlab="Sample Means", ylab="Frequency", col="blue")

# To cross check find mean and sd of sample
mean(sample_means)

sd(sample_means)

# To find probability
sum(sample_means >= 10)/length(sample_means)

