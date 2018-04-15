#It is necessary to source 'dplyr', 'data.table' and chron packages.
plot2 <- function(){
    
    #Read file using fread to create data.table. data.table operations are faster.
    housingpower <- fread("household_power_consumption.txt", na.strings = "?")
    
    #Convert Date and Time to DateTime object
  
    housingpower[,DateTime := strptime(paste(Date, Time),  format = "%d/%m/%Y %H:%M:%S")]
    
    #subset based on Date time.
    subset <- filter(housingpower,   DateTime >= as.POSIXct("2007-02-01 00:00:00") & DateTime < as.POSIXct("2007-02-03 00:00:00"))
    
    #open a bitmap png graphics device
    png(file = "plot2.png", width = 480, height = 480)
    
    plot(subset$DateTime, subset$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
    
    #close the png / bitmap graphics device
    dev.off()
    
}