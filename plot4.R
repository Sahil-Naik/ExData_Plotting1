power <- "./Datasets/household_power_consumption.txt"
pow_data <- read.table(power, head=TRUE, sep = ";",stringsAsFactors = FALSE, dec = ".")
pow_subset <- pow_data[pow_data$Date %in% c("1/2/2007","2/2/2007"),]

datetime <- strptime(paste(pow_subset$Date, pow_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(pow_subset$Global_active_power)
GlobalReactivePower <- as.numeric(pow_subset$Global_reactive_power)
Voltage <- as.numeric(pow_subset$Voltage)
sub_M1 <- as.numeric(pow_subset$Sub_metering_1)
sub_M2 <- as.numeric(pow_subset$Sub_metering_2)
sub_M3 <- as.numeric(pow_subset$Sub_metering_3)

png("Plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, sub_M1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub_M2, type="l", col="red")
lines(datetime, sub_M3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()