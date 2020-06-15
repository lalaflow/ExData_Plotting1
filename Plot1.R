#Import the data set
getwd()
## [1] "D:/Data Science/Exploratory_Data_Analysis/ExData_Assigment1"
fulldata <- read.csv ( file = "./household_power_consumption.txt", nrows = 2075259, 
                       na.strings = "?", 
                       header = TRUE, sep = ";", comment.char = "", dec = ".")
data <- fulldata[fulldata$Date %in% c("1/2/2007","2/2/2007") ,]

#Date class 
data$Date <- as.Date(data$Date, format= "%d/%m/%Y") 

#Create first plot, annotate and save as png 
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.copy(png, file = "plot1.png", width= 480, height=480)
dev.off()
