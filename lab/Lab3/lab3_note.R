setwd("/Users/lijiayi/Desktop/Baseline/Y2S2/APH101/lab/Lab3")
temHK_2015 <- read.table("2015tem_HK.txt",
                         header= TRUE,
                         sep="\t")
temHK_2016 <- read.table("2016tem_HK.txt",
                         header= TRUE,
                         sep="\t")
HK1 <-as.data.frame(temHK_2015)
HK2 <-as.data.frame(temHK_2016)

#plot(HK1$January)

# [,2:13]
HK3 <- HK1[,-1]
HK4 <- HK2[,-1]

HK3 <- as.matrix(HK3)
HK4 <- as.matrix(HK4)


HK1 <- as.vector(HK3)
HK2 <- as.vector(HK4)

plot(HK1,HK2,xlab="2015-temp(°C aka centigrade )",
      ylab="2016-temp(°C aka centigrade )",
      xlim=range(10,33), ylim=range(5,33),
      main="Temperatures of two years",cex=0.5)

library(ggplot2)
HK <- data.frame (HK1=HK1,HK2=HK2)
HK$season <- rep(1:12,each=31)
ggplot(HK,
       aes(x = HK1, y = HK2, color = season)) +
  geom_point() +
  geom_abline(intercept = 0, slope = 1) +
  scale_color_viridis_c()+
  labs(x = "Temperature (°F)2015", y = "Temperature (°F)2016")
# pdf()
# plot()
# dev.off()
### Write a function for above manipulations
lab3_plot <- function(temHK_2015,temHK_2016,path){
  
  
}



