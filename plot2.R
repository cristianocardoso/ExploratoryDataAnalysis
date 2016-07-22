datafile <- "D://RDados/EDA/Project_1/household_power_consumption.txt"

sourceData<-read.table(datafile, sep=";", stringsAsFactors = F, dec=".",na.strings="?", header=TRUE)
mySubset <- sourceData[sourceData$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(mySubset$Date, mySubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

globalActivePower <- as.numeric(mySubset$Global_active_power)

png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()