##############excercise 1#####################################
# Weight of the mice before treatment 
before <-c(200.1, 190.9, 192.7, 213, 241.4, 196.9, 172.2, 185.5, 205.2, 193.7) 
# Weight of the mice after treatment
after <-c(392.9, 393.2, 345.1, 393, 434, 427.9, 422, 383.9, 392.3, 352.2)
# Create a data frame
my_data <- data.frame( 
  group = rep(c("before", "after"), each = 10),
  weight = c(before,  after)
)
#Compute summary statistics by groups:
library("dplyr")
group_by(my_data, group) %>%
  summarise(
    count = n(),
    median = median(weight, na.rm = TRUE),
    IQR = IQR(weight, na.rm = TRUE)
  )
#test the normality yourself
###transform the dataset for paired style and run m1, or you can skip the following procedures and go to m1
# Subset weight data before treatment
before <- subset(my_data,  group == "before", weight,
                 drop = TRUE)
# subset weight data after treatment
after <- subset(my_data,  group == "after", weight,
                drop = TRUE)
#Compute paired Wilcoxon test - Method 1
m1<-wilcox.test(before, after, paired = TRUE)
m1
#Compute paired Wilcoxon-test - Method 2
m2<- wilcox.test(weight ~ group, data = my_data, paired = TRUE)
m2
######if you want to perform left-tailed Wilcoxon Signed-Rank Test
wilcox.test(before, after, paired=TRUE, alternative="less") #change "less" to "greater" for right-tailed  Test



##############excercise 2#####################################
favorable <-c(1,1,2,2,2,3,3,7,8,10)
poor <-c(2,3,4,5,9,10,10,11,11,11,12,12) 
E2<- wilcox.test(favorable,poor, paired = F,correct=T,exact=F)
E2

##############excercise 3#####################################
a<-c(3012,9458,8419,9580,13590,12787,6600)
b<-c(2532,4682,2025,2268,2775,2884,1717)
c<-c(8138,2073,1867,885,6490,9003,690)
d2 <- data.frame( 
  group = rep(c(1, 2,3), each = 7),
  outcome = c(a,b,c)
)
str(d2)
#test the normality and equal variance, because the sample is small
#ks 
kruskal.test(outcome ~  as.factor(group), data = d2)
######try multiple comparisions
### Dunn test
library(FSA)
PT = dunnTest(outcome ~  as.factor(group),
              data=d2,
              method="bh")    # Can adjust p-values;
                              # See ?p.adjust for options
PT
#Nemenyi test for multiple comparisons
library(DescTools)
PT = NemenyiTest(outcome ~  as.factor(group),
                 data=d2,
                 dist="tukey")
PT
#Pairwise Mann–Whitney U-tests
library(multcompView)
PT = pairwise.wilcox.test(d2$outcome,
                          d2$group, data=d2,
PT
 
##############excercise 4#####################################
#create data
data <- data.frame(student = rep(1:10, each=3),
                   lecture = rep(c(1, 2, 3), times=10),
                   score = c(4.0, 4.0,  5.0, 
                             2.5,  4.0,  4.0 ,
                             4.0,  3.5,  4.5, 
                             3.5,  4.0,  5.0, 
                             3.5,  3.0,  4.0, 
                             2.5,  3.5,  3.5, 
                             4.0,  3.5,  3.5, 
                             3.5,  3.5,  4.5, 
                             3.0,  4.0,  4.0, 
                             2.5,  3.0,  4.0 ))
str(data)
#perform Friedman Test
friedman.test(y=data$score, groups=data$lecture, blocks=data$student)
friedman.test(score~lecture|student,data=data)


###############rank correlation##################
#define data
x <- c(4,8,5,8,3,2,3,7,3,2)
y <- c(5,8,6,4,6,3,6,7,0,1)
d4 <- data.frame( 
   x=x,y=y
)
#draw scatter plot
library("ggpubr")
ggscatter( data=d4, x = "x", y = "y", 
          add = "reg.line", conf.int = F, 
          cor.coef = F, cor.method = "pearson",
          xlab = "Sleep Quality Index Scale ", ylab = "Student Anxiety Scale ")

#calculate Spearman rank correlation between x and y
cor.test (x, y, method = 'spearman' )
