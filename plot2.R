## Read data into R

power_data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")


## merge the dates and times and convert to date/time class

date_time <- strptime(paste(power_data$Date, power_data$Time, sep = " "),format = "%d/%m/%Y %H:%M:%S")

## add date_time to the data table
power_data <- cbind(power_data, date_time)


power_data$Date <- as.Date(power_data$Date, format = "%d/%m/%Y")


## sebset data to look at only the data from 2/1/2007 to 2/2/2007

sub_power_data <- subset(power_data, power_data$Date == "2007-2-1" | power_data$Date == "2007-2-2")


## Plot 2: Global Active Power Line Graph
## Save the line graph of Global Active Power to a png file ("plot2.png")

png(filename = "plot2.png", width = 480, height = 480)
with(sub_power_data, plot(date_time, Global_active_power, type = "l", xlab = "Date/Time", ylab="Global Active Power (kilowatts)"))

dev.off()
