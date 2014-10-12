png("plot3.png", width = 480, height = 480)
with(PowerCons, plot(Date, Sub_metering_1, type="l", ylab = "Energy submetering", xlab = ""))
with(PowerCons, points(Date, Sub_metering_2, type = "l", col = "red"))
with(PowerCons, points(Date, Sub_metering_3, type = "l", col = "blue"))

legend("topright", pch = "-", col = c("black", "blue", "red"), legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"))
       
dev.off()
