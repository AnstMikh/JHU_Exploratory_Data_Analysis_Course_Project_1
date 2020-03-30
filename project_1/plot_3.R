> library("data.table")
#download the library for future work
> setwd("C:/Users/Anastasia/Downloads/exdata_data_household_power_consumption")
#set the path 
> power <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")
#read in data from file then subsets data for specified dates
> power[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
#prevent scientific notation
> power[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
#make a POSIXct date capable of being filtered and graphed by time of day
> power <- power[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]
#filter dates for 2007-02-01 and 2007-02-02
> png("plot3.png", width=480, height=480)
#set the parametres for png
> plot(power[, dateTime], power[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
#plot_3
> lines(power[, dateTime], power[, Sub_metering_3],col="blue")
#add blue lines
> lines(power[, dateTime], power[, Sub_metering_2],col="red")
#add red lines
> legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
#add legend fot red, black and blue lines
> dev.off()
