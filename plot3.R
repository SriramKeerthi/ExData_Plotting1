# Load Data from .zip file
data <- read.table(unz("~/coursera/exploratoryDataAnalysis/week1/assignment/exdata-data-household_power_consumption.zip", "household_power_consumption.txt"), header=T, quote="\"", sep=";", stringsAsFactors=FALSE, dec=".")
subData <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

# Get the dateTime for x-axis
dateTime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Get the data for the y-axes
subMetering1 <- as.numeric(subData$Sub_metering_1)
subMetering2 <- as.numeric(subData$Sub_metering_2)
subMetering3 <- as.numeric(subData$Sub_metering_3)

# Open the PNG device
png("plot3.png", width=480, height=480)

# Plot
plot(dateTime, subMetering1, type="l", ylab="Energy sub metering", xlab="", col="black")
lines(dateTime, subMetering2, type="l", col="red")
lines(dateTime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2, col=c("black", "red", "blue"))

# Close the PNG device
dev.off()