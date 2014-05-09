source("./get_data.R")
subset <- loadAndUnzipExData()

subset$datetime = paste(subset$converteddate,subset$Time, sep = " ")

png("plot4.png", bg = "transparent", width = 480, height = 480)
par(mfrow = c(2,2))

# Active power
timestamp = as.POSIXct(subset$datetime, format = "%Y-%m-%d %H:%M")
global_active_power <- as.numeric(as.character(subset$Global_active_power))
voltage <- as.numeric(as.character(subset$Voltage))
global_reactive_power <- as.numeric(as.character(subset$Global_reactive_power))

plot(timestamp, global_active_power, type = "n", main='', ylab="Global Active Power")
lines(timestamp, global_active_power,
      main='Global Active Power',
      xlab="Global Active Power",
      ylab = ""
)

# Voltage
plot(timestamp, voltage, type = "n", main='')
lines(timestamp, voltage,
      main='Voltage',
      xlab="Voltage",
      ylab = ""
)

# Energy submetering
sub_metering_1 <- as.numeric(as.character(subset$Sub_metering_1))
sub_metering_2 <- as.numeric(as.character(subset$Sub_metering_2))
sub_metering_3 <- as.numeric(as.character(subset$Sub_metering_3))

min <- min(sub_metering_1,sub_metering_2,sub_metering_3)
max <- max(sub_metering_1,sub_metering_2,sub_metering_3)
ylim = c(min, max)
plot(timestamp, sub_metering_1, type = "n", ylim = c(min, max), xlab = "", ylab="Energy sub metering")
lines(timestamp,  sub_metering_1,col="black")
lines(timestamp,  sub_metering_2, col="red")
lines(timestamp,  sub_metering_3, col="blue")
legend('topright', names(subset)[7:9], lty=1, col=c('black', 'red', 'blue'), cex=.75)

# Reactive power
plot(timestamp, global_reactive_power, type = "n", main='', ylab="Global Reactive Power")
lines(timestamp, global_reactive_power,
      main='Global Reactive Power',
      ylab = ""
)
dev.off()