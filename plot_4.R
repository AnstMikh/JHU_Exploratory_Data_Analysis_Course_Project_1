> library("data.table")
#dowload library for future working
> setwd("C:/Users/Anastasia/Downloads/exdata_data_household_power_consumption")
#set the path
> powerDT <- data.table::fread(input = "household_power_consumption.txt" , na.strings="?")
#read in data from file then subsets data for specified dates
> powerDT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
#prevent scientific notation
> powerDT[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
#make a POSIXct date capable of being filtered and graphed by time of day
> powerDT <- powerDT[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]
#filter dates for 2007-02-01 and 2007-02-02
> png("plot4.png", width=480, height=480)
#set png parameters
> par(mfrow=c(2,2))
#set "matrix" 2x2
> plot(powerDT[, dateTime], powerDT[, Global_active_power], type="l", xlab="", ylab="Global Active Power")
#plot_1
> plot(powerDT[, dateTime],powerDT[, Voltage], type="l", xlab="datetime", ylab="Voltage")
#plot_2
> plot(powerDT[, dateTime], powerDT[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
#plot_3
> lines(powerDT[, dateTime], powerDT[, Sub_metering_2], col="red")
#plot red lines
> lines(powerDT[, dateTime], powerDT[, Sub_metering_3],col="blue")
#plot blue lines
> legend("topright", col=c("black","red","blue") , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "), lty=c(1,1), bty="n", cex=.5)
#set legend for black, red and blue lines
> plot(powerDT[, dateTime], powerDT[,Global_reactive_power], type="l", xlab="datetime", ylab="Global_reactive_power")
#plot_4
> dev.off()
