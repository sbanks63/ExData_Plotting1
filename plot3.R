## Read data into R

power_data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")


## merge the dates and times and convert to date/time class

date_time <- strptime(paste(power_data$Date, power_data$Time, sep = " "),format = "%d/%m/%Y %H:%M:%S")

## add date_time to the data table
power_data <- cbind(power_data, date_time)


power_data$Date <- as.Date(power_data$Date, format = "%d/%m/%Y")


## sebset data to look at only the data from 2/1/2007 to 2/2/2007

sub_power_data <- subset(power_data, power_data$Date == "2007-2-1" | power_data$Date == "2007-2-2")


## Plot 3: Energy Sub Metering Line Graph
## Save the line graph of Energy Sub Metering to a png file ("plot3.png")

png(filename = "plot3.png", width = 480, height = 480)

with(sub_power_data, plot(date_time, Sub_metering_1, type = "l", ylab = "Energy Sub Metering", xlab ="Date/Time")) ##Sub_metering_1 data
with(sub_power_data, lines(date_time, Sub_metering_2, type = "l", col="red")) ## add Sub_metering_2 data
with(sub_power_data, lines(date_time, Sub_metering_3, type = "l", col="blue")) ## add Sub_metering_3 data

legend("topright", pch = "-", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
