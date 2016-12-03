##Subset dataset into right dates
dataFile <- ".//household_power_consumption.txt"
fulldata <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
project <- fulldata[fulldata$Date %in% c("1/2/2007","2/2/2007") ,]

## Make ready for the plot
datechange <- strptime(paste(project$Date, project$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
GlobalActivePowergraph <- as.numeric(project$Global_active_power)
subMetering1 <- as.numeric(project$Sub_metering_1)
subMetering2 <- as.numeric(project$Sub_metering_2)
subMetering3 <- as.numeric(project$Sub_metering_3)

##plot
png("plot3.png", width=480, height=480)
plot(datechange, subMetering1, type = "l", ylab = "Energy Submetering", xlab = "")
lines(datechange, subMetering2, type = "l", col ="red")
lines(datechange, subMetering3, type = "l", col ="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"))
dev.off()
