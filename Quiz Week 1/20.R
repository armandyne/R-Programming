setwd("D:/coursera/R Programming")
x<-read.csv("quiz1_data/hw1_data.csv")
y<-x[x$Month==5,]
y<-y$Ozone
bad<-is.na(y)
print(max(y[!bad]))