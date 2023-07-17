
#read file
library(readxl)
data<-read_excel("/Users/lijiayi/Desktop/Y2S2/APH101/lab/Lab7/lab 9.xlsx")

####explore data
#load dplyr package
library(dplyr)
#find mean and standard deviation of weight loss for each treatment group
data %>%
  group_by(gender, exercise) %>%
  summarise(mean = mean(weight_loss),
            sd = sd(weight_loss))

##We can also create a boxplot for each of the six 
#treatment groups to visualize the distribution of weight loss for each group:
#set margins so that axis labels on boxplot don't get cut off
par(mar=c(8, 4.1, 4.1, 2.1))

#create boxplots
boxplot(weight_loss ~ gender:exercise,
        data = data,
        main = "Weight Loss Distribution by Group",
        xlab = "Group",
        ylab = "Weight Loss",
        col = "steelblue",
        border = "black", 
        las = 2 #make x-axis labels perpendicular
)



##############Fitting the Two-Way ANOVA Model
#The general syntax to fit a two-way ANOVA model in R is as follows:
#aov(response variable ~ predictor_variable1 * predictor_variable2, data = dataset)
#Note that the * between the two predictor variables indicates that we also want to test for an interaction effect between the two predictor variables.#

#fit the two-way ANOVA model
model <- aov(weight_loss ~ gender * exercise, data = data)

#view the model output
summary(model)

#interaction plot
# Two-way interaction plot
interaction.plot(x.factor = data$gender, trace.factor = data$exercise, 
                 response =data$weight_loss, fun = mean, 
                 type = "b", legend = TRUE, 
                 xlab = "gender", ylab="weight_loss",main="interaction plot",
                 pch=c(2,19), col = c("#00AFBB", "#E7B800"))



###########################Checking the 2-way ANOVA Model Assumptions##########################
#define model residuals
resid <- model$residuals

#create histogram of residuals
hist(resid, main = "Histogram of Residuals", xlab = "Residuals", col = "steelblue")

#load car package
library(car)

#conduct Levene's Test for equality of variances
leveneTest(weight_loss ~ gender * exercise, data = data)

#perform Tukey's Test for multiple comparisons
TukeyHSD(model, conf.level=.95) 
#We can also visualize the 95% confidence intervals that result from the Tukey Test by using the plot() function in R:
#create confidence interval for each comparison
plot(TukeyHSD(model, conf.level=.95), las = 2)


