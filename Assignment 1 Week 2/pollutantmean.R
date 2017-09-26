pollutantmean <- function(directory, pollutant, id=1:332) {
     ds <- NULL
     if(pollutant=="sulfate" || pollutant=="nitrate") {
          for(i in id) {
               lpad_current_id <- paste(rep("0",each = 3-nchar(i)), sep = "", collapse = "")
               filename <- paste(lpad_current_id, as.character(i), ".csv", sep = "", collapse = "")
               i_file_ds <- read.csv(paste(directory,"/",filename, sep = "", collapse = ""))
               i_file_ds <- i_file_ds[!is.na(i_file_ds[pollutant]),pollutant]
               ds <- append(ds, i_file_ds)
          }
          return (mean(ds))
     }
     else {
          return(NA)
     }
      
       
}