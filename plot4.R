setwd("C:/Users/marin/Documents/RJHUCourse/Exploratory_Data_Analysis/Week1project")
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
definitedf <- subset(df, Date <= "2007-02-02" & Date >= "2007-02-01")
definitedf$timepoint <- as.POSIXct(paste(definitedf$Date, definitedf$Time), format = "%Y-%m-%d %H:%M:%S")

definitedf$Global_reactive_power<- as.numeric(definitedf$Global_reactive_power)
definitedf$Voltage <- as.numeric(definitedf$Voltage)
definitedf$Sub_metering_1 <- as.numeric(definitedf$Sub_metering_1)
definitedf$Sub_metering_2 <- as.numeric(definitedf$Sub_metering_2)
definitedf$Sub_metering_3 <- as.numeric(definitedf$Sub_metering_3)

png("plot4.png", units = "px", width = 480, height = 480)
par(mfcol = c(2, 2), mar = c(4, 4, 2, 1)) 
with(definitedf, plot(timepoint, Global_active_power, type = "l", xlab = NA, ylab = "Global Active Power (kilowatts)")) 
plot(definitedf$timepoint, definitedf$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(definitedf$timepoint, definitedf$Sub_metering_2, type="l", col="red")
lines(definitedf$timepoint, definitedf$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
with(definitedf, plot(timepoint, Voltage, type = "l", xlab = "datetime",))
with(definitedf, plot(timepoint, Global_reactive_power, type = "l", xlab = "datetime",)) 
dev.off()

