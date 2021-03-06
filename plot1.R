##Subset dataset into right dates
dataFile <- ".//household_power_consumption.txt"
fulldata <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
project <- fulldata[fulldata$Date %in% c("1/2/2007","2/2/2007") ,]

## plot the hist
GlobalActivePowergraph <- as.numeric(project$Global_active_power)
png("plot1.png", width=480, height=480)
hist(GlobalActivePowergraph, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()