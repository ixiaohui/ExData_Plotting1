### set the working directory
setwd("~/datascience/04 exploratory data analysis")

### load the data and subset the data of 2007-02-01 and 2007-02-02
alldata <- read.table("household_power_consumption.txt", header = T, sep = ";")
data <- subset(alldata, Date =="1/2/2007" | Date == "2/2/2007")

### convert the class of "Global Active Power" to numeric
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

### convert the Date and Time variables to Date/Time classes
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

### Construct the Plot2: the Global Active Power change with the time
png(filename = "plot2.png", width = 480, height = 480)
with(data, plot(DateTime, Global_active_power, type = "l", 
                xlab = "", ylab = "Global Acitve Power(kilowatts)"))
dev.off()


