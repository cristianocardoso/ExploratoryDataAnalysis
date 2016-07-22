sourceData <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE)

# Adjust format date
sourceData$Date <- as.Date(as.character(sourceData$Date), format = "%d/%m/%Y")

# select only 2 days
dateData <- subset(sourceData, Date >= "2007-02-01" & Date <= "2007-02-02")

dateData$Global_active_power <- as.numeric(as.character(dateData$Global_active_power))

# Create file (image)
png(file = "plot1.png")

# create histogram graphic
hist(dateData$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Power Active (Kilowatts)")
dev.off()
