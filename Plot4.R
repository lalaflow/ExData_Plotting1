#Import the data set from the appropiate workig directory
getwd()
## [1] "D:/Data Science/Exploratory_Data_Analysis/ExData_Assigment1"
fulldata <- read.csv ( file = "./household_power_consumption.txt", nrows = 2075259, 
                       na.strings = "?", 
                       header = TRUE, sep = ";", comment.char = "", dec = ".")
data <- fulldata[fulldata$Date %in% c("1/2/2007","2/2/2007") ,]

#Set local language to English to have the x-axis Date in English
Sys.setenv(LANG = "en")
Sys.setlocale("LC_ALL", "English")

#Transform Date and Time to the appropiate class and bind both columns
data$Date <- as.Date(data$Date, format = "%d/%m/%Y") 
DateTime <- paste(data$Date, data$Time) #Fusion Date and Time as character
DateTime <- as.POSIXct(DateTime) ##Transform to time format
data1 <- cbind(data, DateTime) ##Build a New data frame with the DateTime column

#plot4
#set the margins and the basic plotting parameters
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0, 0, 2, 0))

#plot4A
with(data1, plot(data1$DateTime, data1$Global_active_power, type="l", 
                ylab = "Global Active Power (kilowatts)", xlab = ""))

#plot4B
with(data1, plot(data1$DateTime, data1$Voltage, type = "l", ylab = "Voltage (Volts)",
                 xlab = "datetime"))

#plot4C
with(data1, {
    plot(data1$Sub_metering_1~data1$DateTime, type="l", xlab = "",
         ylab = "Energy Submetering")
    lines(data1$Sub_metering_2~data1$DateTime, col = "red")
    lines(data1$Sub_metering_3~data1$DateTime, col = "blue")
    legend("topright", lty = 1, lwd = 2, col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
           cex = 0.6)
    })

#plot4D
with(data1, plot(data1$DateTime, data1$Global_reactive_power, type = "l",
                 ylab = "Global reactive Power", xlab = "datetime"))
dev.copy(png, file = "plot4.png", width= 480, height=480)
dev.off()