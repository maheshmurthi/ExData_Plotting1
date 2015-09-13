## Read Data File into Data Variable
## ReqData is the subset we require to build the graph
dataFile <- "./Data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
ReqData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Convert Dates
## strptime function converts data-time from character
DateandTime <- strptime(paste(ReqData$Date, ReqData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

globalActivePower <- as.numeric(ReqData$Global_active_power)
plot(DateandTime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")


## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
