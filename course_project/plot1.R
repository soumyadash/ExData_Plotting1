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
#Plot 1
png("plot1.png",width=480,height=480,units="px")
hist(newData$Global_active_power, main = "Global Active Power", ylab = "Frequency", xlab = "Global Active Power (kilowatts)", col = "red", breaks = 13, ylim = c(0, 1200), xlim = c(0, 6), xaxp = c(0, 6, 3))
dev.off()
