datafile <- "D://RDados/EDA/Project_1/household_power_consumption.txt"

sourceData<-read.table(datafile, sep=";", stringsAsFactors = F, dec=".",na.strings="?", header=TRUE)
mySubset <- sourceData[sourceData$Date %in% c("1/2/2007","2/2/2007") ,]

DateTime <- strptime(paste(mySubset$Date, mySubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

globalActivePower <- as.numeric(mySubset$Global_active_power)
globalReactivePower <- as.numeric(mySubset$Global_reactive_power)
Voltage_Averaged <- as.numeric(mySubset$Voltage)
SubMetering1 <- as.numeric(mySubset$Sub_metering_1)
SubMetering2 <- as.numeric(mySubset$Sub_metering_2)
SubMetering3 <- as.numeric(mySubset$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

plot(DateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(DateTime, Voltage_Averaged, type="l", xlab="datetime", ylab="Voltage")
plot(DateTime, SubMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(DateTime, SubMetering2, type="l", col="red")
lines(DateTime, SubMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2.5, col=c("black", "red", "blue"), lty=1)

plot(DateTime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()