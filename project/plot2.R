# Plot 2 

library(lubridate)

data<-read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")

data$Date<-dmy(data$Date)
data<-data[data$Date >= ymd("2007-02-01") & data$Date <= ymd("2007-02-02"),]
fecha_exacta<-paste(data$Date,data$Time)
data<-cbind(fecha_exacta,data)
data$fecha_exacta<-as.POSIXct(fecha_exacta)
plot2<-with(data,plot(Global_active_power~fecha_exacta,type = "l",
                      ylab=" Global Active Power (kilowats",
                      xlab=""))
dev.copy(png, "plot2.png",width=480, height=480)
dev.off()