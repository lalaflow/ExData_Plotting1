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
data$Date <- as.Date(data$Date, format= "%d/%m/%Y") 
DateTime <- paste(data$Date, data$Time) #Fusion Date and Time as character
DateTime <- as.POSIXct(DateTime) ##Transform to time format
data1 <- cbind(data, DateTime) ##Build a New data frame with the DateTime column

#Plot2
with(data1, plot(data1$DateTime, data1$Global_active_power, type="l", 
                ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.copy(png, file = "plot2.png", width= 480, height=480)
dev.off()
