# Load Data from .zip file
data <- read.table(unz("~/coursera/exploratoryDataAnalysis/week1/assignment/exdata-data-household_power_consumption.zip", "household_power_consumption.txt"), header=T, quote="\"", sep=";", stringsAsFactors=FALSE, dec=".")
subData <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

# Get the dateTime for x-axes
dateTime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Get the data for the y-axes
globalActivePower <- as.numeric(subData$Global_active_power)
globalReactivePower <- as.numeric(subData$Global_reactive_power)
voltage <- as.numeric(subData$Voltage)
subMetering1 <- as.numeric(subData$Sub_metering_1)
subMetering2 <- as.numeric(subData$Sub_metering_2)
subMetering3 <- as.numeric(subData$Sub_metering_3)

# Open the PNG device
png("plot4.png", width=480, height=480)
# Divide into 2 rows and 2 columns
par(mfrow=c(2,2))

# Plot the Global Active Power
plot(dateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power")

# Plot the Voltage
plot(dateTime, voltage, type="l", xlab="datetime", ylab="Voltage")

# Plot the Energy Sub Metering
plot(dateTime, subMetering1, type="l", ylab="Energy sub metering", xlab="", col="black")
lines(dateTime, subMetering2, type="l", col="red")
lines(dateTime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), bty="n", lwd=2)

# Plot the Global Reactive Power
plot(dateTime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

# Close the PNG device
dev.off()