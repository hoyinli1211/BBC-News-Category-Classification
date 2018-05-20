#################################################
#2018-MAY-19 
#BBC dataset
  #source - http://mlg.ucd.ie/datasets/bbc.html (raw text files)
#################################################

library('tidyverse')
  # data
setwd("/Users/yinli/Desktop/Data Science/R/dataset/")
v.category <- list.files()
v.category <- v.category[-grep('.TXT',v.category)]


  #function to read one txt file
readFile <- function(v.path){
  x <- readLines(v.path, n=1)
  df <- data.frame(label=basename(dirname(v.path)),headline=x)
  colnames(df) <- c('label','headline')
  return(df)
}

  #function to read one subfolder
readFolder <- function(v.folderpath){
  v.filepath <- paste0(v.folderpath, '/', list.files(v.folderpath))
  #print(v.filepath)
  temp <- data.frame(label=as.character(), headline=as.character())
  for (i in v.filepath) {
    temp <- rbind(temp, readFile(i))
  }
  return(temp)
}

df <- data.frame(label=as.character(), headline=as.character())
for (i in v.category) {
  v.folderpath <- paste0(getwd(), '/', i)
  #print(v.folderpath)
  df <- rbind(df,readFolder(v.folderpath))
}
View(df)

