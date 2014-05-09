setwd('.')
source("./get_data.R")
subset <- loadAndUnzipExData()

global_active_power <- as.numeric(as.character(subset$Global_active_power))

png("plot1.png", bg = "transparent", width = 480, height = 480)
hist(global_active_power,main='Global Active Power',xlab="Global Active Power (kilowatts)",col="red")
dev.off()