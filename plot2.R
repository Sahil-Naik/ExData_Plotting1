power <- "./Datasets/household_power_consumption.txt"
pow_data <- read.table(power, head=TRUE, sep = ";",stringsAsFactors = FALSE, dec = ".")
pow_subset <- pow_data[pow_data$Date %in% c("1/2/2007","2/2/2007"),]


datetime <- strptime(paste(pow_subset$Date, pow_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
GlobalActivePower <- as.numeric(pow_subset$Global_active_power)

png("Plot2.png", width=480, height=480)
plot(datetime, GlobalActivePower,type="l",xlab="",ylab="Global Active Power (Kilowatts)")
dev.off()