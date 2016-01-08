# Load Data from .zip file
data <- read.table(unz("~/coursera/exploratoryDataAnalysis/week1/assignment/exdata-data-household_power_consumption.zip", "household_power_consumption.txt"), header=T, quote="\"", sep=";", stringsAsFactors=FALSE, dec=".")
subData <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

# Get the dateTime for x-axis
dateTime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Get the data for the y-axis
globalActivePower <- as.numeric(subData$Global_active_power)

# Open the PNG device
png("plot2.png", width=480, height=480)

# Plot
plot(dateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Close the PNG device
dev.off()