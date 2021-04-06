setwd("C:/Users/marin/Documents/RJHUCourse/Exploratory_Data_Analysis/Week1project")
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
definitedf <- subset(df, Date <= "2007-02-02" & Date >= "2007-02-01")
definitedf$timepoint <- as.POSIXct(paste(definitedf$Date, definitedf$Time), format = "%Y-%m-%d %H:%M:%S")

definitedf$Global_active_power<- as.numeric(definitedf$Global_active_power)
png("plot1.png", units = "px", width = 480, height = 480)
hist(definitedf$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

