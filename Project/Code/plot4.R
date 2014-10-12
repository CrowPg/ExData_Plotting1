PowerCons <- read.table("household_power_consumption.txt", header = T, stringsAsFactors = F, sep = ";", skip = 66636, nrows = 2880, col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity","Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = "?")
PowerCons$Date <- paste(PowerCons$Date, PowerCons$Time, sep = " ")
PowerCons$Date <- strptime(PowerCons$Date, format="%d/%m/%Y %H:%M:%S")

png("plot4.png", width = 480, height = 480)

par(mfcol = c(2, 2))

with(PowerCons, plot(Date, Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab=""))

with(PowerCons, plot(Date, Sub_metering_1, type="l", ylab = "Energy submetering", xlab = ""))
with(PowerCons, points(Date, Sub_metering_2, type = "l", col = "red"))
with(PowerCons, points(Date, Sub_metering_3, type = "l", col = "blue"))
legend("topright", pch = "-", col = c("black", "blue", "red"), legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"))

with(PowerCons, plot(Date, Voltage, type="l", ylab = "Voltage", xlab="datetime"))

with(PowerCons, plot(Date, Global_reactive_power, type="l", xlab="datetime"))


dev.off()