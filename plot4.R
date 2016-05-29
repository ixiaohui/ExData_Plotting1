### set the working directory
setwd("~/datascience/04 exploratory data analysis")

### load the data and subset the data of 2007-02-01 and 2007-02-02
alldata <- read.table("household_power_consumption.txt", header = T, sep = ";")
data <- subset(alldata, Date =="1/2/2007" | Date == "2/2/2007")

### convert the class of some data to numeric
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
data$Voltage <- as.numeric(as.character(data$Voltage))
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

### convert the Date and Time variables to Date/Time classes
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

### Construct the Plot4: the four plots
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
with(data, {
        plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
        plot(DateTime, Voltage, type= "l", xlab = "datetime", ylab = "Voltage")
        plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Global Acitve Power(kilowatts)")
        with(data, lines(DateTime, Sub_metering_2, col = "red"))
        with(data, lines(DateTime, Sub_metering_3, col = "blue"))
        legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime")
})

dev.off()