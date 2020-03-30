>library("data.table")
#download the library for future working
> setwd("C:/Users/Anastasia/Downloads/exdata_data_household_power_consumption")
#set the path 
> power <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")
#read in data from file then subsets data for specified dates
> power[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
#prevent scientific notation
> power[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
# make a POSIXct date capable of being filtered and graphed by time of day
> power <- power[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]
#filter dates for 2007-02-01 and 2007-02-02
> png("plot2.png", width=480, height=480)
#set the parameters for png
> plot(x = power[, dateTime], y = power[, Global_active_power], type="l", xlab="", ylab="Global Active Power (kilowatts)")
#plot_2
> dev.off()
