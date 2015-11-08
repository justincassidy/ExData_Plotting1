# Plot 4 Code for Coursera Exploratory Data Analysis Course Project 1

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
plotdataNEW$Voltage=as.numeric(as.character(plotdataNEW$Voltage))
plotdataNEW$Global_reactive_power=as.numeric(as.character(plotdataNEW$Global_reactive_power))

# Creates a lattice structure of four plots, then plots within, then exports as png.
png(width=480,height=480,file="plot4.png")
par(mfcol=c(2,2))
plot(plotdataNEW$datetime,plotdataNEW$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
with(plotdata,{plot(plotdataNEW$datetime,plotdataNEW$Sub_metering_1,col="black",type="l",xlab="",ylab="Energy sub metering")
lines(plotdataNEW$datetime,plotdataNEW$Sub_metering_2,col="red",type="l",xlab="",ylab="Energy sub metering")
lines(plotdataNEW$datetime,plotdataNEW$Sub_metering_3,col="blue",type="l",xlab="",ylab="Energy sub metering")
legend("topright",lty=1,col = c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.8)})
plot(plotdataNEW$datetime,plotdataNEW$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(plotdataNEW$datetime,plotdataNEW$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()
