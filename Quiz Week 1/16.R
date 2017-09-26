setwd("D:/coursera/R Programming")
x<-read.csv("quiz1_data/hw1_data.csv")
y<-x$Ozone
print(length(y[is.na(y)]))