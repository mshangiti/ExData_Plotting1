plot4 <- function()
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
  png(filename="plot4.png", width=480, height=480, bg = "transparent");

  #building the plot
  #telling the device to show 4 plots
  par(mfrow = c(2,2), mar = c(5,4,2,1));
  
  #building topleft plot
  plot(dataset$newDateCol,dataset$Global_active_power, xlab=NA, ylab="Global Active Power", type="l");
  
  #building top right plot
  plot(dataset$newDateCol,dataset$Voltage, xlab="datetime", ylab="Voltage", type="l");
  
  #building bottom left plot
  #empty plot
  plot(dataset$newDateCol,dataset$Sub_metering_1, xlab=NA, ylab="Energy sub metering", type="n");
    #adding data to it
    lines(dataset$newDateCol,dataset$Sub_metering_1, col="black");
    lines(dataset$newDateCol,dataset$Sub_metering_2, col="red");
    lines(dataset$newDateCol,dataset$Sub_metering_3, col="blue");
    #adding legend
    legend("topright", box.col="transparent",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pch=c(NA,NA,NA), col=c("black","red", "blue"), lwd = 1, cex = 1.1);
  
  #building bottom right plot
  plot(dataset$newDateCol,dataset$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l");
  
  #writing to file
  dev.off();
}