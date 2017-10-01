rankhospital <- function(state, outcome, num = "best") {
     if(!any(tolower(outcome) == c("heart attack","heart failure","pneumonia"))){
          stop("invalid outcome")
     }
     
     oc.colindex <- if(tolower(outcome) == "heart attack"){ 11L }
     else if(tolower(outcome) == "heart failure"){ 17L }
     else { 23L }
     
     oc.data <- read.csv("data/outcome-of-care-measures.csv", colClasses = "character")  
     
     oc.data[,oc.colindex] <- as.numeric(oc.data[,oc.colindex])
     
     #test
     NA
}