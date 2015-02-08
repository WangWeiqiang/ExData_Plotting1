## load data:
myData<-read.csv("./data/household_power_consumption.txt",sep=';');

## use lubridate library for date formating
library(lubridate);

## filter data:
gapOf2Days<-myData[dmy(myData$Date) %in% dmy(c('01/02/2007','02/02/2007')),];

## remove original big data
remove(myData);

## create plot on screen device
plot(as.POSIXct(paste(gapOf2Days$Date, gapOf2Days$Time), format="%d/%m/%Y %H:%M:%S"),as.numeric(as.character(gapOf2Days

$Global_active_power)),type="l",ylab="Global Active Power(kilowatts)",xlab="")

## Copy histogram to a PNG file
dev.copy(png, file = "plot2.png")
dev.off() 
