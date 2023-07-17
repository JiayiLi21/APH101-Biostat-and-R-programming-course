########################excercise 1############################
#create table
data <- matrix(c(41, 4, 24, 11), ncol=2, byrow=TRUE)
colnames(data) <- c("no","yes")
rownames(data) <- c("A","B")
data <- as.table(data)

#view table
data
Xsq <- chisq.test(data,simulate.p.value = TRUE)  # Prints test summary
Xsq <- chisq.test(data ) #Pearson's Chi-squared test with Yates' continuity correction
Xsq
Xsq$observed   # observed counts (same as M)
Xsq$expected   # expected counts under the null
Xsq$residuals  # Pearson residuals
Xsq$stdres     # standardized residuals

########################excercise 3############################
#create 2x2 dataset
data<-matrix(c(1, 5, 9, 5),
       nrow = 2,
       dimnames = list(poison= c("A", "B"),
                       death= c("yes", "no")))
#view dataset
data
#To conduct Fisher’s Exact Test, we simply use the following code:
fisher.test(data)

########################excercise 4############################
#create 2x2 dataset
data<-matrix(c(82,10,5,3),
             nrow = 2,
             dimnames = list(standard= c("+", "-"),
                             newtest= c("+", "-")))
#view dataset
data
#To conduct Fisher’s Exact Test, we simply use the following code:
mcnemar.test(data)

#####excercise 5
library(vcd)

assocstats(data)#get phi-coefficient
Kappa(data,weights = "Equal-Spacing")#kappa

library(psych)
cohen.kappa(data)#kappa