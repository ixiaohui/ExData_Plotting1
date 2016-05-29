### set the working directory
setwd("~/datascience/04 exploratory data analysis")

### load the data and subset the data of 2007-02-01 and 2007-02-02
alldata <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings="?")
data <- subset(alldata, Date =="1/2/2007" | Date == "2/2/2007")

### convert the class of "Global Active Power" to numeric
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

### Construct Plot1: the histgram of Global Active Power
png(filename = "plot1.png", width = 480, height = 480)
with(data, hist(Global_active_power, col = "red", main = "Global Active Power",
                xlab = "Global Active Power(kilowatts)", ylab = "Frequency"))
dev.off()
