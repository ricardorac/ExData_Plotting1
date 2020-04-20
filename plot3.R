library(dplyr)
data <- read.csv("household_power_consumption.txt",
                 na.strings="?", stringsAsFactors=FALSE, sep=";")
data$Date <- as.Date(data$Date,"%d/%m/%Y")
subset <- data %>% filter(between(Date, as.Date("2007-02-01"), as.Date("2007-02-02")))
subset$Time <- strptime(paste(subset$Date, subset$Time, sep=" "),"%Y-%m-%d %H:%M:%S")
png("plot3.png", width = 480, height = 480)
plot(subset$Time, subset$Sub_metering_1, type="l", ylab="Energy sub metering",xlab="")
lines(subset$Time, subset$Sub_metering_2, type = "l", col = "red")
lines(subset$Time, subset$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1, cex=0.8)
dev.off()

