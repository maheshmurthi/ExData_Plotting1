## Read Data File into Data Variable
## ReqData is the subset we require to build the graph
dataFile <- "./Data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
ReqData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Convert Dates
## strptime function converts data-time from character
DateandTime <- strptime(paste(ReqData$Date, ReqData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(ReqData$Global_active_power)
globalReactivePower <- as.numeric(ReqData$Global_reactive_power)
voltage <- as.numeric(ReqData$Voltage)

sub_Meter1 <- as.numeric(ReqData$Sub_metering_1)
sub_Meter2 <- as.numeric(ReqData$Sub_metering_2)
sub_Meter3 <- as.numeric(ReqData$Sub_metering_3)

## Plot - 2 graphs per row
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

plot(DateandTime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(DateandTime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(DateandTime, sub_Meter1, type="l", ylab="Energy Submetering", xlab="")
lines(DateandTime, sub_Meter2, type="l", col="red")
lines(DateandTime, sub_Meter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(DateandTime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")



## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)


dev.off()
