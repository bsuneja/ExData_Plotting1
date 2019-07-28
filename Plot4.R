## read the entire file with colclasses specified (faster) but keeping date and time as character since default is not accepted
bigset <- read.table("household_power_consumption.txt",header = TRUE, sep=";",stringsAsFactors = FALSE,colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings = "?")

## Filter out and assign just those two days 1/2/2007 and 2/2/2007
smallset <- bigset[which((bigset$Date == "1/2/2007")|(bigset$Date == "2/2/2007")),]

## Concatenate and then convert the date-time to the POSiXlt format 
smallset$dateTime <- strptime(paste(smallset$Date,smallset$Time,sep = " "),"%d/%m/%Y %H:%M:%S")

## Plot 4. Setting font sizes to 60% of default to try to match the appearance in the assignment and to look reasonable
par(mfrow = c(2,2),cex=0.6)

## Plot 4.1
plot(smallset$dateTime,smallset$Global_active_power,type = "l",ylab = "Global Active Power (kilowatts)",xlab="")

## Plot 4.2
plot(smallset$dateTime,smallset$Voltage,ylab = "Voltage",type = "l",xlab="datetime")

## Plot 4.3
plot(smallset$dateTime,smallset$Sub_metering_1,type = "l",ylab = "Energy sub metering",xlab="")
lines(smallset$dateTime,smallset$Sub_metering_2,type = "l",ylab = "Energy sub metering",xlab="",col = "red")
lines(smallset$dateTime,smallset$Sub_metering_3,type = "l",ylab = "Energy sub metering",xlab="",col = "blue")
legend("topright", pch = "____", col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

## plot 4.4
plot(smallset$dateTime,smallset$Global_reactive_power,ylab = "Global_reactive_power",type = "l",xlab="datetime")
