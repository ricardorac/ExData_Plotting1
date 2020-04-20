library(dplyr)
data <- read.csv("household_power_consumption.txt",
                 na.strings="?", stringsAsFactors=FALSE, sep=";")
data$Date <- as.Date(data$Date,"%d/%m/%Y")
subset <- data %>% filter(between(Date, as.Date("2007-02-01"), as.Date("2007-02-02")))
subset$Time <- strptime(paste(subset$Date, subset$Time, sep=" "),"%Y-%m-%d %H:%M:%S")
png("plot2.png", width = 480, height = 480)
plot(subset$Time, subset$Global_active_power, type="l", ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
