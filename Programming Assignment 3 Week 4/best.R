best <- function(state, outcome) {
     
     if(!any(tolower(outcome) == c("heart attack","heart failure","pneumonia"))){
          stop("invalid outcome")
     }
     
     oc.colindex <- if(tolower(outcome) == "heart attack"){ 11L }
                         else if(tolower(outcome) == "heart failure"){ 17L }
                         else { 23L }
     
     oc.data <- read.csv("data/outcome-of-care-measures.csv", colClasses = "character")  
     
     oc.data[,oc.colindex] <- as.numeric(oc.data[,oc.colindex])
     
     if(!(state %in% unique(oc.data[!is.na(oc.data[oc.colindex]),]$State)))  {
          stop("invalid state")
     }
     
     oc.data <- oc.data[!is.na(oc.data[oc.colindex]) & (oc.data$State==state),c(2,oc.colindex)]
     head(as.character(oc.data[order(oc.data[,2],oc.data[,1]),]$Hospital.Name), 1)

}

