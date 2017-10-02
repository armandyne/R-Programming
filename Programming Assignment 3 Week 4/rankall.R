rankall <- function(outcome, num = "best") {
     
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
     names(oc.data)[oc.colindex] <- outcome
     names(oc.data)[7] <- "state"
     names(oc.data)[2] <- "hospital"
     
     oc.data <- oc.data[!is.na(oc.data[outcome]),c("state","hospital",outcome)]
     
     ranks.data <- data.frame("hospital"=character(), "state"=character())
     states <- unique(oc.data$state)
          
     for(i in states) {
          state.data <- oc.data[oc.data$state==i,]
          state.data <- state.data[order(state.data[outcome]),]
          state.data <- if(num=="best") { head(state.data[,c("hospital","state")],1) }
                        else if(num=="worst") { tail(state.data[,c("hospital","state")],1) }
                        else if(is.numeric(num)) { state.data[num,c("hospital","state")] }
          ranks.data <- rbind(ranks.data, as.data.frame(state.data))
     }

     ranks.data[order(ranks.data$state),]
}