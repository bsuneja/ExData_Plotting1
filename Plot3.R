## read the entire file with colclasses specified (faster) but keeping date and time as character since default is not accepted
bigset <- read.table("household_power_consumption.txt",header = TRUE, sep=";",stringsAsFactors = FALSE,colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings = "?")

## Filter out and assign just those two days 1/2/2007 and 2/2/2007
smallset <- bigset[which((bigset$Date == "1/2/2007")|(bigset$Date == "2/2/2007")),]

## Concatenate and then convert the date-time to the POSiXlt format 
smallset$dateTime <- strptime(paste(smallset$Date,smallset$Time,sep = " "),"%d/%m/%Y %H:%M:%S")

## Plot 3
plot(smallset$dateTime,smallset$Sub_metering_1,type = "l",ylab = "Energy sub metering",xlab="")
lines(smallset$dateTime,smallset$Sub_metering_2,type = "l",ylab = "Energy sub metering",xlab="",col = "red")
lines(smallset$dateTime,smallset$Sub_metering_3,type = "l",ylab = "Energy sub metering",xlab="",col = "blue")
legend("topright", pch = "____", col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

