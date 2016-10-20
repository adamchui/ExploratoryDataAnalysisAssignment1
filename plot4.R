#Preparation of Data

HP_Comsumption <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

HP_Comsumption$DateTime <- strptime(paste0(HP_Comsumption$Date, " ", HP_Comsumption$Time), format = "%d/%m/%Y %H:%M:%S")

#Remove Date and Time Column
HP_Comsumption <- HP_Comsumption[,c(-1,-2)]

library(dplyr)

#Filter 
HP_Comsumption_Filter <- subset(HP_Comsumption, DateTime >= strptime('2007-02-01', "%Y-%m-%d") & DateTime < strptime('2007-02-03', "%Y-%m-%d") )


#Plot 4

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

plot(x=HP_Comsumption_Filter$DateTime , y=HP_Comsumption_Filter$Global_active_power, main = "", ylab = "Global Active Power (kilowatts)", xlab = "",type = "l")
plot(x=HP_Comsumption_Filter$DateTime, y=HP_Comsumption_Filter$Voltage, main = "", xlab = "datetime", ylab = "Voltage", type = "l")

plot(x=HP_Comsumption_Filter$DateTime , y=HP_Comsumption_Filter$Sub_metering_1, main = "", xlab = "", ylab = "Energy sub metetring", type = "l")
lines(x=HP_Comsumption_Filter$DateTime, y=HP_Comsumption_Filter$Sub_metering_2, col = "red")
lines(x=HP_Comsumption_Filter$DateTime, y=HP_Comsumption_Filter$Sub_metering_3, col = "blue")
legend('topright' , legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), cex=0.8, col = c("black", "red","blue"), bty = "n")

plot(x=HP_Comsumption_Filter$DateTime , y=HP_Comsumption_Filter$Global_reactive_power, main = "", xlab = "datetime", ylab = "Global_reactive_power", type = "l")

dev.off()
