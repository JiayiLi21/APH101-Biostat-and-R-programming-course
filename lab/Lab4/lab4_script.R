setwd("/Users/lijiayi/Desktop/Baseline/Y2S2/APH101/lab/Lab4/data")
logFC <- read.table("matrix-logFC.txt",header=TRUE,sep = "\t",row.names=1)
pvalue <- read.table("matrix-pvalue.txt",header=TRUE,sep = "\t",row.names=1)
logFC <-as.data.frame(logFC)
pvalue <-as.data.frame(pvalue)

names_pvalue<-row.names(pvalue)
names_logFC <- row.names(logFC)
#m <-merge(logFC, pvalue)
pvalue$name <-names_pvalue
logFC$name <-names_logFC
m <- merge(logFC,pvalue,by="name")

names(m)[names(m) =="X"] <-"logFC"

m$PValue <- abs(m$PValue)
#library(ggplot2)
col <- rep("gray",dim(m)[1])
m$col <-col
m[m$PValue > -log10(0.05),]$col <-"red"
#plot(x=logFC,y=PValue,xlab="log2(FC)",ylab="-log10(PValue)",col=m$col)


p3<-ggplot(data=m, aes(x=m$logFC, y=m$PValue,colour=threshold, fill=threshold)) + 
  scale_color_manual(values=c("blue", "grey","red"))+
  geom_point(alpha=0.6,size=2) +
  #xlim(c(-6, 6)) +
  #ylim(c(0, 300)) +
  theme_bw(base_size = 12, base_family = "Times") +
  geom_vline(xintercept=c(-1,1),lty=1,col=c("blue","red"),lwd=0.6)+
  geom_hline(yintercept = -log10(0.05),lty=2,col="black",lwd=0.6)+
  theme(legend.position="right",
        panel.grid=element_blank(),
        legend.title = element_blank(),
        legend.text= element_text(face="bold", color="black",family = "Times", size=8),
        plot.title = element_text(hjust = 0.5),
        axis.text.x = element_text(color="black", size=12),
        axis.text.y = element_text(color="black", size=12),
        axis.title.x = element_text(face="bold", color="black", size=12),
        axis.title.y = element_text(face="bold",color="black", size=12))+
  labs(x="log2 (Fold Change)",y="-log10 (p-value)")





