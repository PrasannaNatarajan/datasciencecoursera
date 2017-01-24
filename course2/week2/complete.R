complete <- function(directory,id=1:332){
  nobs <- numeric()
  for(i in id){
    fp <- sprintf("%s/%03d.csv",directory,i)
    data <- read.csv(fp)
    rel_data <- subset(data,!is.na(data['nitrate'])&!is.na(data['sulfate']) & !is.na(data['Date']))
    
    # nobs <- union(nobs,nrow(rel_data))
    nobs <- append(nobs,nrow(rel_data))
  }
  data.frame(id,nobs = unclass(nobs))
}