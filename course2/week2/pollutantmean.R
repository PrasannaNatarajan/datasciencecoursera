pollutantmean <- function(directory,pollutant,id = 1:332){
  mean <- 0
  len<-0
  sum<-0
  for(i in id){
    fp <- sprintf("%s/%03d.csv",directory,i)
    data <- read.csv(fp)
    rel_data <- subset(data,!is.na(data[pollutant]),select = pollutant)
    len<- len + nrow(rel_data)
    print(rel_data[,pollutant])
    sum<- sum + sum(rel_data[,pollutant],na.rm = TRUE)
  }
  mean <- sum/len
  mean
}
