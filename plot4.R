library(dplyr)
data <- read.csv("file://C:/rworkspace//exdata_data_household_power_consumption//household_power_consumption.txt",
                 na.strings="?", stringsAsFactors=FALSE, sep=";")
data$Date <- as.Date(data$Date,"%d/%m/%Y")
subset <- data %>% filter(between(Date, as.Date("2007-02-01"), as.Date("2007-02-02")))
subset$Time <- strptime(paste(subset$Date, subset$Time, sep=" "),"%Y-%m-%d %H:%M:%S")
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2), mar=c(4,4,1,1))

# Plotting first plot
plot(subset$Time, subset$Global_active_power, type="l", ylab="Global Active Power",xlab="")

# Plotting second plot
plot(subset$Time, subset$Voltage, type="l", ylab="Voltage",xlab="datetime")

# Plotting third plot
plot(subset$Time, subset$Sub_metering_1, type="l", ylab="Energy sub metering",xlab="")
lines(subset$Time, subset$Sub_metering_2, type = "l", col = "red")
lines(subset$Time, subset$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1, cex=0.8, bty="n")

# Plotting fourth plot
plot(subset$Time, subset$Global_reactive_power, type="l", ylab="Global Reactive Power", xlab="datetime")

dev.off()
