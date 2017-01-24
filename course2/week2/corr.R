corr <- function(directory,threshold = 0){
  ret <- numeric()
  d <- complete(directory,1:332)
  d <- subset(d,d$nobs > threshold)
  c<-0
  for( i in d$id){
    c<-c+1
    fp <- sprintf("%s/%03d.csv",directory,i)
    data <- read.csv(fp)
    if(threshold <= d$nobs[[c]]){
      nitrate_data <- subset(data,select = 'nitrate',!is.na(data['nitrate'])&!is.na(data['sulfate']))
      sulfate_data <- subset(data,select = 'sulfate',!is.na(data['nitrate'])&!is.na(data['sulfate']))
      ret <- append (ret,cor(nitrate_data,sulfate_data))
    }
    
  }
  ret 
  
}