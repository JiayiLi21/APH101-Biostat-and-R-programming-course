setwd("/Users/lijiayi/Desktop/Baseline/Y2S2/APH101/lab/Lab2")


# example for loop
x <- c(2,5,3,9,8,11,6)
count <-0
for (val in x){
  if(val %% 2 == 0) count=count+1
}
print(count)


###
for (year in 2010:2015){
  print(paste("The year is", year))
}


###return a value 
fibonacci <- function(n) {
  f <-c()
  f[1] <- f[2] <-1
  for (i in 3:n) f[i] <- f[i - 2] + f[i - 1]
  return (f)
  #base case
  #if(i==0 || i==1) {1}
  ## recursive step
  #else{
    
    #fibonacci(i-1)+fibonacci(i-2)
 # }
}

fibonacci(100)



plusone <- function(a,b){
  c <- a+b
  return(c)
}

plusone(1,7)

#h <- function()
