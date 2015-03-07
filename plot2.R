plot2 <- function()
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
  png(filename="plot2.png", width=480, height=480, bg = "transparent");
  
  #building the plot
  plot(dataset$newDateCol,dataset$Global_active_power, xlab=NA, ylab="Global Active Power (kilowatts)", type="l");
  
  #writing to file
  dev.off();
}