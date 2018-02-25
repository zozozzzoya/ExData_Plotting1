full_df <- read.table("household_power_consumption.txt", header=T, sep=';')
full_df$Date <- as.Date(full_df$Date, "%d/%m/%Y")

df <- subset(full_df, Date == "2007-02-01"|Date == "2007-02-02")
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))

hist(df$Global_active_power, xlab = "Global Active Power (kilowatts)", 
     col='red', main = "Global Active Power")

dev.copy(png, file="plot1.png")
dev.off()