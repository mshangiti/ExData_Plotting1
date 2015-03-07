plot3 <- function()
{
  #reading the data
  fileTemp <- read.table("household_power_consumption.txt",header=TRUE, sep=";", na.strings="?");
  fileTemp[,"Date"] <- as.Date(fileTemp[,"Date"],"%d/%m/%Y");
  
  #subsetting the dataset (using only the data from the specificed dates)
  dataset <- fileTemp[fileTemp$Date=="2007-02-01" | fileTemp$Date==" 2007-02-02",];
  
  #creating a new date/time column
  newDateCol <- strptime((paste(dataset[,"Date"], dataset[,"Time"])), "%Y-%m-%d %H:%M:%S");
  #adding column to subset
  dataset <- cbind(dataset,newDateCol);
  
  #open device with given width and height
  png(filename="plot3.png", width=480, height=480, bg = "transparent");
  
  #building the plot
  #1: empty plot
  plot(dataset$newDateCol,dataset$Sub_metering_1, xlab=NA, ylab="Energy sub metering", type="n");
  #2: adding data to it
  lines(dataset$newDateCol,dataset$Sub_metering_1, col="black");
  lines(dataset$newDateCol,dataset$Sub_metering_2, col="red");
  lines(dataset$newDateCol,dataset$Sub_metering_3, col="blue");
  #3: adding legend
  legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pch=c(NA,NA,NA), col=c("black","red", "blue"), lwd = 2, cex = 1.2);
  
  #writing to file
  dev.off();
}