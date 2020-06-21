library(lubridate)

data<-read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")
data$Date<-dmy(data$Date)
data<-data[data$Date >= ymd("2007-02-01") & data$Date <= ymd("2007-02-02"),]
fecha_exacta<-paste(data$Date,data$Time)
data<-cbind(fecha_exacta,data)
data$fecha_exacta<-as.POSIXct(fecha_exacta)
par(mfrow = c(2, 2), mar = c(4, 4, 0, 1), oma = c(1, 1, 1, 0))
with(data,plot(Sub_metering_1~fecha_exacta,
               type="l", ylab = "Energy sub metering", xlab=""))
points(data$Sub_metering_2~data$fecha_exacta,col="red",type="l",xlab=" ")
points(data$Sub_metering_3~data$fecha_exacta,col="blue",type="l",xlab=" ")
legend("topright",col=c("black","red","blue"), lty=1,lwd=2,
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


dev.copy(png, "plot4.png",width=480, height=480)
dev.off()