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
#Plot 2
png("plot2.png",width=480,height=480,units="px")
plot(newData$Datetime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()