#plot 1 

library(lubridate)

data<-read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")

data$Date<-dmy(data$Date)
data<-data[data$Date >= ymd("2007-02-01") & data$Date <= ymd("2007-02-02"),]

# Plot 1
hist(data$Global_active_power, 
     xlab = "Global Activie Power (kilowatts)",
     col = "red",
     main = "Global Active Power")
dev.copy(png, "plot1.png",width=480, height=480)
dev.off()