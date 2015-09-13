library(sqldf)
library(lubridate)

#read data
df <- read.csv.sql("household_power_consumption.txt", sql = " select * from file where Date='1/2/2007' or Date='2/2/2007'", header=TRUE, sep=';')

#convert date and time
df$DateTime <- dmy_hms(paste(df$Date, df$Time)) #Good, works!

#2 line plot - Global_active_power and Day
png("plot2.png", width=480, height=480)
with(df,plot(DateTime,Global_active_power, type="l",xlab="",ylab="Global Active Power(kilowatts)"))
dev.off()
