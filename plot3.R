### set the working directory
setwd("~/datascience/04 exploratory data analysis")

### load the data and subset the data of 2007-02-01 and 2007-02-02
alldata <- read.table("household_power_consumption.txt", header = T, sep = ";")
data <- subset(alldata, Date =="1/2/2007" | Date == "2/2/2007")

### convert the class of "Energy sub metering 1,2,3" to numeric
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

### convert the Date and Time variables to Date/Time classes
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

### Construct the Plot3: the Energy sub metering change with time
png(filename = "plot3.png", width = 480, height = 480)
with(data, plot(DateTime, Sub_metering_1, type = "l",
                xlab = "", ylab = "Global Acitve Power(kilowatts)"))
with(data, lines(DateTime, Sub_metering_2, col = "red"))
with(data, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
               
dev.off()


