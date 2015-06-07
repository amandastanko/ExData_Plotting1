## read table
HHpowerConsumption <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

##subsetting
DataSubset <- HHpowerConsumption[HHpowerConsumption$Date %in% c("1/2/2007", "2/2/2007"),]

## convert
DataSubset$dt <- strptime(paste(DataSubset$Date, DataSubset$Time), "%d/%m/%Y %H:%M:%S")
DataSubset$Global_active_power <- as.numeric(DataSubset$Global_active_power)

## plotting
png(filename="plot2.png", height=480, width=480)
with(DataSubset, plot(dt, Global_active_power, type="l", xlab = "", ylab="Global Active Power (kilowatts)"))
dev.off()
