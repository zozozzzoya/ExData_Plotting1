full_df <- read.table("household_power_consumption.txt", header=T, sep=';')
df<- subset(full_df, full_df$Date %in% c("1/2/2007","2/2/2007"))

df$DayTime <- strptime(paste(df$Date, df$Time), format = "%d/%m/%Y %H:%M:%S")

df$Global_active_power <- as.numeric(as.character(df$Global_active_power))

plot(df$DayTime, df$Global_active_power, type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

dev.copy(png, file="plot2.png")
dev.off()