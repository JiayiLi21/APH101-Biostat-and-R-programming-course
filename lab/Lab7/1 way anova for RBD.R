library(readxl)
data1<-read_excel("E:\\西交\\lab 9. compare means - 副本\\lab 9.xlsx", sheet = "Sheet2",
                  col_names = TRUE)
attach(data1)
av = aov(response ~ block+group)
summary(av)
