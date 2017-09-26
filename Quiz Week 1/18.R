setwd("D:/coursera/R Programming")
x<-read.csv("quiz1_data/hw1_data.csv")
y<-x[x$Ozone>31 & x$Temp>90,]
y<-y$Solar.R
bad<-is.na(y)
print(mean(y[!bad]))