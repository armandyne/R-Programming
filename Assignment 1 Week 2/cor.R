corr <- function(directory, threshold = 0) {
     df_nobs <- complete(directory)
     df_nobs <- df_nobs[df_nobs["nobs"]>threshold,]
     
     corr_result <- vector(mode="numeric", length=0)
     
     if(nrow(df_nobs)==0) {
          return(corr_result)
     }
     
     for(i in df_nobs$id) {
          lpad_current_id <- paste(rep("0",each = 3-nchar(i)), sep = "", collapse = "")
          filename <- paste(lpad_current_id, as.character(i), ".csv", sep = "", collapse = "")
          i_file_df <- read.csv(paste(directory,"/",filename, sep = "", collapse = ""))
          
          #read sulfate column
          i_sulfate <- i_file_df[!is.na(i_file_df$sulfate) & !is.na(i_file_df$nitrate),"sulfate"]
          
          #read nitrate column
          i_nitrate <- i_file_df[!is.na(i_file_df$sulfate) & !is.na(i_file_df$nitrate),"nitrate"]
       
          corr_result <- append(corr_result, cor(i_sulfate, i_nitrate))
     }
     
     return(corr_result)
}
