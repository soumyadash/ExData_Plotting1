#download data
if (!file.exists("./data/household_power_consumption.txt")) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "./data/household_power_consumption.zip")
  unzip("./data/household_power_consumption.zip", overwrite = T, exdir = "./data")
}
#read, subset and clean data
myData <- read.table("./data/household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")
newData <- myData[which(myData$Date == "1/2/2007" | myData$Date == "2/2/2007" ), ]
head(newData)
newData$Datetime <- strptime(paste(newData$Date, newData$Time), "%d/%m/%Y %H:%M:%S")
head(newData)
#Plot 4
png("plot4.png",width=480,height=480,units="px")
par(mfrow = c(2, 2))
plot(newData$Datetime, newData$Global_active_power, type = "l", ylab = "Global Active Power", 
     xlab = "")
plot(newData$Datetime, newData$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
plot(newData$Datetime, newData$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(newData$Datetime, newData$Sub_metering_2, type = "l", xlab = "", ylab = "Energy sub metering", 
       col = "red")
points(newData$Datetime, newData$Sub_metering_3, type = "l", xlab = "", ylab = "Energy sub metering", 
       col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", 
                                                                        "Sub_metering_2", "Sub_metering_3"))
plot(newData$Datetime, newData$Global_reactive_power, type = "l", xlab = "datetime", 
     ylab = "Global_reactive_power", ylim = c(0, 0.5))
dev.off()