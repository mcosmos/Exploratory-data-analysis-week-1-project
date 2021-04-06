setwd("C:/Users/marin/Documents/RJHUCourse/Exploratory_Data_Analysis/Week1project")
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
definitedf <- subset(df, Date <= "2007-02-02" & Date >= "2007-02-01")
definitedf$timepoint <- as.POSIXct(paste(definitedf$Date, definitedf$Time), format = "%Y-%m-%d %H:%M:%S")

definitedf$Sub_metering_1 <- as.numeric(definitedf$Sub_metering_1)
definitedf$Sub_metering_2 <- as.numeric(definitedf$Sub_metering_2)
definitedf$Sub_metering_3 <- as.numeric(definitedf$Sub_metering_3)
png("plot3.png", units = "px", width = 480, height = 480)
plot(definitedf$timepoint, definitedf$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(definitedf$timepoint, definitedf$Sub_metering_2, type="l", col="red")
lines(definitedf$timepoint, definitedf$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()


