#It is necessary to source 'dplyr', 'data.table' and chron packages.
plot3 <- function () {
    
    #Read file using fread to create data.table. data.table operations are faster.
    housingpower <- fread("household_power_consumption.txt", na.strings = "?")
    
    #Convert Date and Time to DateTime object
    
    housingpower[,DateTime := strptime(paste(Date, Time),  format = "%d/%m/%Y %H:%M:%S")]
    
    #subset based on Date time.
    subset <- filter(housingpower,   DateTime >= as.POSIXct("2007-02-01 00:00:00") & DateTime < as.POSIXct("2007-02-03 00:00:00"))
    
    #open a bitmap png graphics device
    png(file = "plot3.png", width = 480, height = 480)
    
    plot(subset$DateTime, subset$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "", col = "dark green")
    lines(subset$DateTime, subset$Sub_metering_1, col = "dark green")
    lines(subset$DateTime, subset$Sub_metering_2, col = "red")
    lines(subset$DateTime, subset$Sub_metering_3, col = "blue")
    
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c("solid", "solid", "solid"), col = c("dark green", "red", "blue"))
    
    #close the png / bitmap graphics device
    dev.off()
    
}