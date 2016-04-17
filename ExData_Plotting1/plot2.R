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
# Plot 2 
plot(datetime, subsetdata$Global_active_power, type="l", xlab="", 
ylab="Global Active Power (kilowatts)")
# Copying Plot 2 to a PNG file and Closing the PNG device
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()