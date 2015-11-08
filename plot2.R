# Plot 2 Code for Coursera Exploratory Data Analysis Course Project 1

# Read in raw data as "plotdata" data frame
read.table("household_power_consumption.txt",sep=";",header = TRUE)->plotdata

# Convert Date and Time columns to a "datetime" column and convert to POSIXlt object
plotdata$datetime = paste(as.character(plotdata$Date),as.character(plotdata$Time))
plotdata$datetime=strptime(plotdata$datetime, "%d/%m/%Y %H:%M:%S")

# Subset data frame to only the relevant days to graph for this exercise
plotdataNEW <- subset(plotdata, datetime >= as.POSIXct('2007-02-01') & datetime < as.POSIXct('2007-02-03'))

# Convert relevant field to numeric
plotdataNEW$Global_active_power=as.numeric(as.character(plotdataNEW$Global_active_power))

# Plots graph on screen device, then saves to appropriately labeled PNG file
plot(plotdataNEW$datetime,plotdataNEW$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()
