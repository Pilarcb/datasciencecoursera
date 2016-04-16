# Reading and getting data
powerdata <- "./household_power_consumption.txt" 
data<-read.csv(powerdata, header=TRUE, sep=";", na.strings="?", dec=".", stringsAsFactors=FALSE)
# > str(data)
#  'data.frame':  2075259 obs. of  9 variables
# Subsetting date
subsetdata <-data[data$Date %in% c("1/2/2007", "2/2/2007") ,]
# str(subsetdata)
'data.frame':  2880 obs. of  9 variables
# Plot 1
hist(subsetdata$Global_active_power, main="Global Active Power",
xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
# Copying Plot 1 to a PNG file and Closing the PNG device
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()