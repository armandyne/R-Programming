rankhospital <- function(state, outcome, num = "best") {
     
     if(!any(tolower(outcome) == c("heart attack","heart failure","pneumonia"))){
          stop("invalid outcome")
     }
     
     if(!(num %in% c("best","worst") | is.numeric(num))){
          stop("invalid num")
     }
     
     oc.colindex <- if(tolower(outcome) == "heart attack") 11L 
                    else if(tolower(outcome) == "heart failure") 17L 
                    else 23L 
     
     oc.data <- read.csv("data/outcome-of-care-measures.csv", colClasses = "character")  
     
     oc.data[,oc.colindex] <- as.numeric(oc.data[,oc.colindex])
     
     if(!(state %in% unique(oc.data[!is.na(oc.data[oc.colindex]),]$State)))  {
          stop("invalid state")
     }
     
     oc.data <- oc.data[!is.na(oc.data[oc.colindex]) & (oc.data$State==state),c(2,oc.colindex)]
     oc.data <- as.character(oc.data[order(oc.data[,2],oc.data[,1]),]$Hospital.Name)
     
     if(num=="best") {
          return(head(oc.data, 1))
     }
     else if(num=="worst") {
          return(tail(oc.data, 1))
     }
     else if(is.numeric(num)){
          return(oc.data[num])
     }
     else {
          return(NA)
     }
          
}