setwd("/Users/lijiayi/Desktop/Baseline/Y2S2/APH101/lab/Lab1")

group <- read.table("group.txt",
                    header= FALSE,
                    sep="\t")
#dim(group)
groupA <- read.table("/Users/lijiayi/Desktop/Baseline/Y2S2/APH101/lab/Lab1/group/groupA.txt",
                    header= FALSE,
                    sep="\t")
groupB <- read.table("/Users/lijiayi/Desktop/Baseline/Y2S2/APH101/lab/Lab1/group/groupB.txt",
                     header= FALSE,
                     sep="\t")
groupC <- read.table("/Users/lijiayi/Desktop/Baseline/Y2S2/APH101/lab/Lab1/group/groupC.txt",
                     header= FALSE,
                     sep="\t")
groupD <- read.table("/Users/lijiayi/Desktop/Baseline/Y2S2/APH101/lab/Lab1/group/groupD.txt",
                     header= FALSE,
                     sep="\t")
height <- read.table("height.txt",header=FALSE,sep="\t")
weight <- read.table("weight.txt",header=FALSE,sep="\t")
try <- read.table("try.txt",header=FALSE,sep="\t")

try <- t(try)
try<- as.data.frame(try)
#try([,1])
#try([1,])
#name <- group[,1]
#Dat2 <-merge(height,weight,by="height")

# ways to merge
people <- data.frame(
  name = group[,1],
  groupi = group[,2],
  try = try[,2],
  weight = weight[,2],
  height = height[,2]
)

people$try <- as.numeric(people$try)

#write.table(file="people.txt",x=people,sep="\t")
# generate (write file in the working directory)
write.table(people,"people.txt",sep="\t",quote=FALSE, row.names=FALSE)

mean_h <- mean(people[,5])
mean_w <- mean(people[,4])
mean_t <- mean(na.omit(people[,3]))




