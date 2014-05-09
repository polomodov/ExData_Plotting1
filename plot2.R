source("./get_data.R")
subset <- loadAndUnzipExData()

global_active_power <- as.numeric(as.character(subset$Global_active_power))
subset$datetime = paste(subset$converteddate,subset$Time, sep = " ")

timestamp = as.POSIXct(subset$datetime, format = "%Y-%m-%d %H:%M")

png("plot2.png", bg = "transparent", width = 480, height = 480)
plot(timestamp, global_active_power, type = "n", )
lines(timestamp, global_active_power,
     main='Global Active Power',
     xlab="Global Active Power (kilowatts)",
     ylab = ""
)
dev.off()