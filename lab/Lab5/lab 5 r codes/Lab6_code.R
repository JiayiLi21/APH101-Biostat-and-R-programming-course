##########make this example reproducible
set.seed(0)
#create data that follows a normal distribution
normal_data <- rnorm(200)
#create data that follows an exponential distribution
non_normal_data <- rexp(200, rate=3)

#install.packages("CircStats")
library(CircStats)
#pp.plot(normal_data,"normal")

#read file
library(readxl)
data<-read_excel("/Users/lijiayi/Desktop/Baseline/Y2S2/APH101/lab/lab5/example data.xls")

#focusing on glucose, create a histogram
hist(data$glucose, col='steelblue', main='Normal',freq=T)

#Create a Q-Q plot
qqnorm(data$glucose, main='Normal')
qqline(data$glucose)

#create P-P plot
a=data$glucose
a=na.omit(a)
plot((rank(a)-0.5)/length(a), pnorm(mean=mean(a), sd=sd(a), a), main="PP plot")
# abline(0, 1)

#Perform a Shapiro-Wilk Test， not appropriate for large samples
#shapiro.test(data$glucose)

#perform kolmogorov-smirnov test
ks.test(normal_data, 'pnorm') 

ks.test(data$Creatinine, 'pnorm',exact=FALSE) 
ks.test(data$bun+runif(length(data$bun),-0.05,0.05),"pnorm",mean(data$bun),sd(data$bun))
ks.test(jitter(data$bun),'pnorm',mean(data$bun),sd(data$bun))

#########use an adjusted method of ks test
library(nortest)
lillie.test(data$Creatinine)

######################test for equal variance############################
bartlett.test(data$bun, data$gender)
bartlett.test(bun~gender,data=data)


library(car)
leveneTest(bun~as.factor(gender),data=data)