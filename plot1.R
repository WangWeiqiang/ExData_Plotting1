## load data:
myData<-read.csv("./data/household_power_consumption.txt",sep=';');

## use lubridate library for date formating
library(lubridate);

## filter data:
gapOf2Days<-myData[dmy(myData$Date) %in% dmy(c('01/02/2007','02/02/2007')),];

## remove original big data
remove(myData);

## create histogram on screen device
hist(as.numeric(as.character(gapOf2Days$Global_active_power)),col="red",xlab="Global Active Power(kilowatts)",main="Global Active Power");

## Copy histogram to a PNG file
dev.copy(png, file = "plot1.png")
dev.off() 
