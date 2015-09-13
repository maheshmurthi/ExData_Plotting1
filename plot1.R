## Read Data File into Data Variable
## ReqData is the subset we require to build the graph
dataFile <- "./Data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
ReqData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Convert ReqData to Numberic
globalActivePower <- as.numeric(ReqData$Global_active_power)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
