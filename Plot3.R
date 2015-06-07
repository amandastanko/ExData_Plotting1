## read table
HHpowerConsumption <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

##subsetting
DataSubset <- HHpowerConsumption[HHpowerConsumption$Date %in% c("1/2/2007", "2/2/2007"),]

## convert
DataSubset$dt <- strptime(paste(DataSubset$Date, DataSubset$Time), "%d/%m/%Y %H:%M:%S")
DataSubset$Sub_metering_1 <- as.numeric(DataSubset$Sub_metering_1)
DataSubset$Sub_metering_2 <- as.numeric(DataSubset$Sub_metering_2)
DataSubset$Sub_metering_3 <- as.numeric(DataSubset$Sub_metering_3)

## plotting
png(filename="plot3.png", height=480, width=480)
with(DataSubset, {
  plot(dt, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(dt, Sub_metering_2, type="l", col="red")
  lines(dt, Sub_metering_3, type="l", col="blue")
})
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()
