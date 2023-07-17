setwd("/Users/lijiayi/Desktop/Baseline/Y2S2/APH101/lab/lab5/Results")
#returns the density P(x)at x= -3, -2, -1, 0, 1, 2 and 3. 
dnorm(-3:3)

#The standard normal curve can be plotted using the command
curve(dnorm(x), xlim=c(-4,4))
#The xlim=c(-4,4) tells R to plot the function in the range


curve(dnorm(x), xlim=c(-6,6))
curve(dnorm(x, mean=1, sd=2), col="red", add=TRUE)

#The pnorm(z) function returns the cumulative probability of the standard normal distribution at Z score z
pnorm(1.65)

#The qnorm() function is the inverse of the pnorm() function
#For example, the Z score corresponding to the 95th percentile is
qnorm(0.95)


#generate data/numbers follow n(0,1)
set.seed(289)
x<-rnorm(1e6)

mean(x)
sd(x)
hist(x,freq=F,breaks=100)
curve(dnorm(x),col="red",add=TRUE)

################chisquare###############################
#use the dchisq() function to plot the density functions:
#1st argument is the value of x we want to compute the density and the second one is the degree of freedom.
curve(dchisq(x,1),xlim=c(0,20),ylim=c(0,0.6),ylab="Chi Square Density")
curve(dchisq(x,2),col="red",lty=2,add=TRUE)
curve(dchisq(x,3),col="blue",lty=3,add=TRUE)
curve(dchisq(x,5),col="dark green",lty=4,add=TRUE)
curve(dchisq(x,10),col="brown",lty=5,add=TRUE)
legend(12,0.55,c("k=1","k=2","k=3","k=5","k=10"),
       col=c("black","red","blue","dark green","brown"),lty=1:5)

# Plot the x^2 histogram and the 1-df chi-square curve together
hist(x^2, freq=FALSE, breaks=200,xlim=c(0,5))
curve(dchisq(x,1),col="red",add=TRUE)

#Let’s now generate random numbers following the χ2
#distribution with df=3 from 3 independent standard normal random variables:
set.seed(27712819)
X1 <- rnorm(1e7)
X2 <- rnorm(1e7)
X3 <- rnorm(1e7)
Q <- X1^2 + X2^2 + X3^2
hist(Q, freq=FALSE, breaks=100)
curve(dchisq(x,3),col="red",add=TRUE)

#In practical applications, we don’t generate random numbers following χ2
#distribution from the rnorm() function.
#The rchisq() function is more convenient to use.
set.seed(90546723)
Q <- rchisq(1e5,10)
hist(Q, freq=FALSE, breaks=100)
curve(dchisq(x,10),col="red",add=TRUE)

#lower.tail=F,then get P value;
#=T then get CDF
pchisq(21.78,10,lower.tail=F)
qchisq(0.05,10,lower.tail=FALSE)


###########################t distribution#######################################
# The t distribution is constructed from the normal and χ2 distributions.
#Let Z and c be two independent random variables.
#Let’s generate 1e6 random numbers following the t distribution 
#with 6 df from the definition of the t distribution
Z <- rnorm(1e6)
c <- rchisq(1e6,6)
T <- Z/sqrt(c/6)
hist(T,breaks=100,freq=FALSE)
hist(T, breaks=c(min(T), seq(-5,5,length.out=100), max(T)), freq=FALSE)

hist(T, breaks=c(min(T), seq(-5,5,length.out=100), max(T)), freq=FALSE, 
     xlim=c(-5,5))
curve(dt(x,5),col="red",add=TRUE)

#The following code chunk plots the t curves with various degrees of freedom.
curve(dt(x,1),xlim=c(-5,5),ylim=c(0,0.4),ylab="Student's t Density")
curve(dt(x,2),col="red",lty=2,add=TRUE)
curve(dt(x,5),col="blue",lty=3,add=TRUE)
curve(dt(x,20),col="dark green",lty=4,add=TRUE)
curve(dnorm(x),col="brown",lty=5,add=TRUE)
legend(2,0.38,c("k=1","k=2","k=5","k=20","normal curve"),
       col=c("black","red","blue","dark green","brown"),lty=1:5)

pt(1.5,4,lower.tail=FALSE)
qt(0.05,4,lower.tail=FALSE)

################################################################
#F distribution
#construct f distribution using chisquare distributions
#1st df=2, 2nd df=6
numerator<-rchisq(1e5,2)/2
denominator<-rchisq(1e5,6)/6
f<-numerator/denominator
hist(f,freq=FALSE, breaks=100)

#plot f distributions with different degree
curve(df(x,1,4),xlim=c(0,5),ylim=c(0,1),ylab="F Density")
curve(df(x,2,6), col="blue",lty=3,add=TRUE)
curve(df(x,12,12), col="red",lty=2,add=TRUE)
