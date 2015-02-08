## load data:
myData<-read.csv("./data/household_power_consumption.txt",sep=';');

## use lubridate library for date formating
library(lubridate);

## filter data:
gapOf2Days<-myData[dmy(myData$Date) %in% dmy(c('01/02/2007','02/02/2007')),];

## remove original big data
remove(myData);

## create plot on screen device

with(
	gapOf2Days,
	plot(
		as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"),
		
		as.numeric(as.character(Sub_metering_1)),
		,type="l",col="black",
		ylab="Energy sub metering",
		xlab=""))
with(gapOf2Days,	
	lines(
		as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"),
		
		as.numeric(as.character(Sub_metering_2)),
		col="red"))
with(gapOf2Days,	
	lines(
		as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"),
		
		as.numeric(as.character(Sub_metering_3)),
		col="blue"))

legend("topright", c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(1,1,1),col = c("black", "red","blue"))


## Copy plot to a PNG file
dev.copy(png, file = "plot3.png")
dev.off() 
