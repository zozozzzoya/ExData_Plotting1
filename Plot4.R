full_df <- read.table("household_power_consumption.txt", header=T, sep=';')
df<- subset(full_df, full_df$Date %in% c("1/2/2007","2/2/2007"))

df$DayTime <- strptime(paste(df$Date, df$Time), format = "%d/%m/%Y %H:%M:%S")
df$Voltage <- as.numeric(as.character((df$Voltage)))
df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))
df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))

png(file="Plot4.png")

par(mfrow=c(2,2))

plot(df$DayTime, df$Global_active_power, type="l",
       xlab="",
       ylab="Global Active Power (kilowatts)")
  
plot(df$DayTime, df$Voltage, type="l", xlab="datetime",
       ylab="Voltage")
  
{plot(df$DayTime, df$Sub_metering_1, type="l", xlab="",
      ylab="Energy sub meeting")
  lines(df$DayTime, df$Sub_metering_2, type="l", col="red")
  lines(df$DayTime, df$Sub_metering_3, type="l", col="blue")
  legend("topright", pch="_", col=c("black","red","blue"),
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))}

plot(df$DayTime, df$Global_reactive_power, type="l", xlab="datetime",
       ylab="Global_reactive_power")

dev.off()