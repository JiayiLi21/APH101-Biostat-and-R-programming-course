#########excercise 1#############
#create a dataset
mydatatext<-"
before after
115	128
112	115
107	106
119	128
115	122
138	145
126	132
105	109
104	102
115	117
"
mydata<-read.table(head=T,text=mydatatext)

#due to small sample size, perform normaility test
d <- mydata$before - mydata$after 
shapiro.test(d)

#follow n, paired ttest
t.test(mydata$before,mydata$after,paired = TRUE)
# significantly different

#########excercise for anova#############
anovatext<-"
group score
1	85
1	86
1	88
1	75
1	78
1	94
1	98
1	79
1	71
1	80
2	91
2	92
2	93
2	85
2	87
2	84
2	82
2	88
2	95
2	96
3	79
3	78
3	88
3	94
3	92
3	85
3	83
3	85
3	82
3	81
"
anovadata<-read.table(head=T,text=anovatext)
#normal?
with(anovadata, shapiro.test(score[group ==1]))
with(anovadata, shapiro.test(score[group ==2]))
with(anovadata, shapiro.test(score[group ==3]))
 
#equal variance?
library(car)
leveneTest(score~ as.factor(group), data =anovadata)#leventest

# for the purpose of illustrating 2 sample ttest
#if we just want to compare group 1 and 2
my_data =anovadata[anovadata$group<=2,]
t.test(score ~ group, data =my_data, var.equal = TRUE)

#1-way anova
library(multcomp)
boxplot(score~group,data=anovadata)
table(anovadata$group)#sample size
attach(anovadata)
aggregate(score,by=list(group),FUN=mean)#group means
aggregate(score,by=list(group),FUN=sd)#group sds

fit<-aov(score~as.factor(group))
summary(fit)

#if variance is not equal
oneway.test(score ~ as.factor(group), data =anovadata, var.equal = F)

#draw a plot of mean and 95%ci
library(gplots)
plotmeans(score~group,xlab="group",bars=T,ylab="score",main="mean&95%ci")



#SUPPOSE there is a need to perform multiple comparison
#tukey hsd
TukeyHSD(fit)
install.packages("agricolae")
library(agricolae)
group2<-as.factor(group)
fit2<-aov(score~group2,data=anovadata)
AD<-LSD.test(fit2, "group2", alpha = 0.05, p.adj= "none")#,"holm","hommel", "hochberg", , "BH", "BY", "fdr"),"bonferroni"), …
summary(AD)
AD$group         
