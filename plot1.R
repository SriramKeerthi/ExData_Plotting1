# Load Data from .zip file
data <- read.table(unz("~/coursera/exploratoryDataAnalysis/week1/assignment/exdata-data-household_power_consumption.zip", "household_power_consumption.txt"), header=T, quote="\"", sep=";", stringsAsFactors=FALSE, dec=".")
subData <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

# Get the data for the histogram
globalActivePower <- as.numeric(subData$Global_active_power)

# Open the PNG device
png("plot1.png", width=480, height=480)

# Plot the histogram
hist(globalActivePower, col=c("red"), main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Close the PNG device
dev.off()