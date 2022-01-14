power <- "./Datasets/household_power_consumption.txt"
pow_data <- read.table(power, head=TRUE, sep = ";",stringsAsFactors = FALSE, dec = ".")
pow_subset <- pow_data[pow_data$Date %in% c("1/2/2007","2/2/2007"),]
GlobalActivePower <- as.numeric(pow_subset$Global_active_power)
png("Plot1.png", width=480, height=480)
hist(GlobalActivePower, col="red", main="Global Active Power", xlab="Global Active Power(Kilowatts)")
dev.off()