## Read Data File into Data Variable
## ReqData is the subset we require to build the graph
dataFile <- "./Data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
ReqData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Convert Dates
## strptime function converts data-time from character
DateandTime <- strptime(paste(ReqData$Date, ReqData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(ReqData$Global_active_power)
sub_Meter1 <- as.numeric(ReqData$Sub_metering_1)
sub_Meter2 <- as.numeric(ReqData$Sub_metering_2)
sub_Meter3 <- as.numeric(ReqData$Sub_metering_3)

## Plot 
plot(DateandTime, sub_Meter1, type="l", ylab="Energy Submetering", xlab="")
lines(DateandTime, sub_Meter2, type="l", col="red")
lines(DateandTime, sub_Meter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))


## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
