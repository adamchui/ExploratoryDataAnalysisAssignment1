#Preparation of Data

HP_Comsumption <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

HP_Comsumption$DateTime <- strptime(paste0(HP_Comsumption$Date, " ", HP_Comsumption$Time), format = "%d/%m/%Y %H:%M:%S")

#Remove Date and Time Column
HP_Comsumption <- HP_Comsumption[,c(-1,-2)]

library(dplyr)

#Filter 
HP_Comsumption_Filter <- subset(HP_Comsumption, DateTime >= strptime('2007-02-01', "%Y-%m-%d") & DateTime < strptime('2007-02-03', "%Y-%m-%d") )


#Plot 1

png("plot1.png", width = 480, height = 480)
options(scipen = 50) 
hist(HP_Comsumption_Filter$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
