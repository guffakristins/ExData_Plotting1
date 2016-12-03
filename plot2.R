##Subset dataset into right dates
dataFile <- ".//household_power_consumption.txt"
fulldata <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
project <- fulldata[fulldata$Date %in% c("1/2/2007","2/2/2007") ,]

## The plot
datechange <- strptime(paste(project$Date, project$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
GlobalActivePowergraph <- as.numeric(project$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datechange, GlobalActivePowergraph, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)" )
dev.off()
