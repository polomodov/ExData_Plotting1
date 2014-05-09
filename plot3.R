source("./get_data.R")
subset <- loadAndUnzipExData()

subset$datetime = paste(subset$converteddate,subset$Time, sep = " ")

png("plot3.png", bg = "transparent", width = 480, height = 480)
timestamp = as.POSIXct(subset$datetime, format = "%Y-%m-%d %H:%M")
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
dev.off()