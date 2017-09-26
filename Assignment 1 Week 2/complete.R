complete <- function(directory, id=1:332) {
     df <- data.frame(NULL,NULL)
     for(i in id) {
          lpad_current_id <- paste(rep("0",each = 3-nchar(i)), sep = "", collapse = "")
          filename <- paste(lpad_current_id, as.character(i), ".csv", sep = "", collapse = "")
          i_file_df <- read.csv(paste(directory,"/",filename, sep = "", collapse = ""))
          rowcount <- nrow(i_file_df[!is.na(i_file_df$sulfate) & !is.na(i_file_df$nitrate),])
          i_file_df <- data.frame(i,rowcount)
          names(i_file_df) <- c("id","nobs")  
          df <- rbind(df, i_file_df)
     }
     
     return(df)
}

