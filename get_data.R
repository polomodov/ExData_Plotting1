loadAndUnzipExData <- function(){
  dataDirectory <- 'data'
  fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  localZipFile <- paste(".", dataDirectory, "household_power_consumption.zip", sep = "/")
  localTxtFile <- paste(".", dataDirectory, "household_power_consumption.txt", sep = "/")
  
  # create directory for data
  if(!file.exists(dataDirectory)){
    dir.create(dataDirectory)
  }
  
  # check existing archive file
  if(!file.exists(localZipFile)){
    download.file(fileUrl, destfile = localZipFile, method="curl")
  }
  
  # check existing unzipped file
  if(file.exists(localZipFile) & !file.exists(localTxtFile)){
    unzip(zipfile = localZipFile, exdir = dataDirectory)
  }
  
  data = read.table(localTxtFile, , header = TRUE, na.strings=NA, sep = ";")
  data$converteddate = as.Date(data$Date, format="%d/%m/%Y")
  subset <- subset(data, data$converteddate >= '2007-02-01' & data$converteddate <= '2007-02-02')
  
  closeAllConnections()
  return(subset)
}