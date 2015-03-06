plot1 <- function()
{
  #reading the data
  fileTemp <- read.table("household_power_consumption.txt",header=TRUE, sep=";", na.strings="?");
  fileTemp[,"Date"] <- as.Date(fileTemp[,"Date"],"%d/%m/%Y");
  #fileTemp[,"Time"] <- strptime(fileTemp[,"Time"],"%H:%M:%S");
  
  #subsetting the dataset (using only the data from the specificed dates)
  dataset <- fileTemp[fileTemp$Date=="2007-02-01" | fileTemp$Date==" 2007-02-02",];
  
  #open device with given width and height
  png(filename="plot1.png", width=480, height=480, bg = "transparent");
  
  #building the histogram
  hist(dataset$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)");
  
  #writing to file
  dev.off();
}