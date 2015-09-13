library(sqldf)
library(lubridate)

#read data
df <- read.csv.sql("household_power_consumption.txt", sql = " select * from file where Date='1/2/2007' or Date='2/2/2007'", header=TRUE, sep=';')

#convert date and time
df$DateTime <- dmy_hms(paste(df$Date, df$Time)) #Good, works!

#4 many plots on a canvas
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2),mar=c(4,4,1,1))

with(df,{
   plot(DateTime,Global_active_power, type="l",xlab="",ylab="Global Active Power")

   plot(DateTime,Voltage, type="l",xlab="datetime",ylab="Voltage")

   plot(DateTime,Sub_metering_1, type="l",xlab="",ylab="Energy sub metering")
   lines(DateTime,Sub_metering_2, type="l",col="red")
   lines(DateTime,Sub_metering_3, type="l",col="blue")
   legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"))

   plot(DateTime,Global_reactive_power, type="l",xlab="datetime")
})
dev.off()
