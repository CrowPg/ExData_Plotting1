#PowerCons <- read.table("household_power_consumption.txt", header = T, stringsAsFactors = F, sep = ";", skip = 66636, nrows = 2880, col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity","Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = "?")
#PowerCons$Date <- as.Date(PowerCons$Date, format = "%d/%m/%Y")
#strptime(PowerCons$Time, format = "%H:%M:%S")

PowerCons <- read.table("household_power_consumption.txt", header = T, stringsAsFactors = F, sep = ";", skip = 66636, nrows = 2880, col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity","Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = "?")
PowerCons$Date <- paste(PowerCons$Date, PowerCons$Time, sep = " ")
PowerCons$Date <- strptime(PowerCons$Date, format="%d/%m/%Y %H:%M:%S")

png("plot1.png", width = 480, height = 480)
hist(PowerCons$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylim = c(0, 1200))
dev.off()