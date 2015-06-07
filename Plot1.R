
##read table
HHpowerConsumption <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

##subsetting
DataSubset <- HHpowerConsumption[HHpowerConsumption$Date %in% c("1/2/2007", "2/2/2007"),]

##convert to numeric
DataSubset$Global_active_power <- as.numeric(DataSubset$Global_active_power)

## plotting
png(filename="plot1.png", height=480, width=480)
hist(DataSubset$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
