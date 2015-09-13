library(sqldf)
library(lubridate)

#read data
df <- read.csv.sql("household_power_consumption.txt", sql = " select * from file where Date='1/2/2007' or Date='2/2/2007'", header=TRUE, sep=';')

#convert date and time
df$DateTime <- dmy_hms(paste(df$Date, df$Time)) #Good, works!

#3 line plot - Sub_metering_1 thru 3
png("plot3.png", width=480, height=480)
with(df,plot(DateTime,Sub_metering_1, type="l",xlab="",ylab="Energy sub metering"))
with(df,lines(DateTime,Sub_metering_2, type="l",col="red"))
with(df,lines(DateTime,Sub_metering_3, type="l",col="blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"))
dev.off()
