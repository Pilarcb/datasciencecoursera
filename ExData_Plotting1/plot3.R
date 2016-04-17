# Reading and Getting data
powerdata <- "./household_power_consumption.txt" 
data<-read.csv(powerdata, header=TRUE, sep=";", na.strings="?", dec=".", stringsAsFactors=FALSE)
# > str(data)
#  'data.frame':  2075259 obs. of  9 variables
# Subsetting Date
subsetdata <-data[data$Date %in% c("1/2/2007", "2/2/2007") ,]
# > str(subsetdata)
'data.frame':  2880 obs. of  9 variables
# Getting Date and Time
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Plot 3
with(subsetdata, {
plot(datetime, subsetdata$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(datetime, subsetdata$Sub_metering_2, type= "l", col = "red")
lines(datetime, subsetdata$Sub_metering_3, type= "l", col = "blue")
})
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),  
       lwd=1, col=c("black", "red", "blue"))
# Copying Plot 3 to a PNG file and Closing the PNG device
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
