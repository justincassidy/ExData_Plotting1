# Plot 3 Code for Coursera Exploratory Data Analysis Course Project 1

# Read in raw data as "plotdata" data frame
read.table("household_power_consumption.txt",sep=";",header = TRUE)->plotdata

# Convert Date and Time columns to a "datetime" column and convert to POSIXlt object
plotdata$datetime = paste(as.character(plotdata$Date),as.character(plotdata$Time))
plotdata$datetime=strptime(plotdata$datetime, "%d/%m/%Y %H:%M:%S")

# Subset data frame to only the relevant days to graph for this exercise
plotdataNEW <- subset(plotdata, datetime >= as.POSIXct('2007-02-01') & datetime < as.POSIXct('2007-02-03'))

# Convert relevant field to numeric
plotdataNEW$Global_active_power=as.numeric(as.character(plotdataNEW$Global_active_power))
plotdataNEW$Sub_metering_1=as.numeric(as.character(plotdataNEW$Sub_metering_1))
plotdataNEW$Sub_metering_2=as.numeric(as.character(plotdataNEW$Sub_metering_2))
plotdataNEW$Sub_metering_3=as.numeric(as.character(plotdataNEW$Sub_metering_3))

# Plots graph on screen device, then saves to appropriately labeled PNG file
png(width=480,height=480,file="plot3.png")
plot(plotdataNEW$datetime,plotdataNEW$Sub_metering_1,col="black",type="l",xlab="",ylab="Energy sub metering")
lines(plotdataNEW$datetime,plotdataNEW$Sub_metering_2,col="red",type="l",xlab="",ylab="Energy sub metering")
lines(plotdataNEW$datetime,plotdataNEW$Sub_metering_3,col="blue",type="l",xlab="",ylab="Energy sub metering")
legend("topright",lty=1,col = c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=1.2,pt.cex = 1)
#dev.copy(png,file="plot3.png",width=480,height=480)
dev.off()
