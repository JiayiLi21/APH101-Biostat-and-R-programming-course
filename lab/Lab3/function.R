temp_1 <- read.table("2015tem_HK.txt",
                         header= TRUE,
                         sep="\t")
temp_2 <- read.table("2016tem_HK.txt",
                         header= TRUE,
                         sep="\t")


lab3_plot <- function(temp_1,temp_2,plot_1,plot_2){
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
  
  P1 <- pdf(plot_1)
  plot(HK1,HK2,xlab="2015-temp(°C aka centigrade )",
       ylab="2016-temp(°C aka centigrade )",
       xlim=range(10,33), ylim=range(5,33),
       main="Temperatures of two years",cex=0.5)
  
  dev.off()
  
  library(ggplot2)
  HK <- data.frame (HK1=HK1,HK2=HK2)
  HK$season <- rep(1:12,each=31)
  
  P2 <- pdf(plot_2)
  ggplot(HK,
         aes(x = HK1, y = HK2, color = season)) +
    geom_point() +
    geom_abline(intercept = 0, slope = 1) +
    scale_color_viridis_c()+
    labs(x = "Temperature (°F)2015", y = "Temperature (°F)2016")
  dev.off()
}

lab3_plot(temp_1,temp_2,"/Users/lijiayi/Desktop/Baseline/Y2S2/APH101/lab/Lab3/plot_1.pdf","/Users/lijiayi/Desktop/Baseline/Y2S2/APH101/lab/Lab3/ggplot_2.pdf")