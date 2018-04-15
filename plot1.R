#It is necessary to source 'dplyr' and 'data.table' packages.
plot1 <- function(){
    
    #Read file using fread to create data.table. data.table operations are faster.
    housingpower <- fread("household_power_consumption.txt", na.strings = "?")
    
    #Convert Date and Time to DateTime object
    housingpower[,DateTime := as.Date(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
    
    #subset based on Date time.
    subset <- filter(housingpower,   DateTime >= as.Date("2007-02-01 00:00:00") & DateTime <= as.Date("2007-02-03 00:00:00"))
    
    #open a bitmap png graphics device
    png(file = "plot1.png", width = 480, height = 480)
    
    #histogram will be returned to current active graphics device which is now png.
    hist(subset$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "RED")
   
     #close the png / bitmap graphics device
    dev.off()
    
}