> library("data.table") 
#dowload a library for working with tabled data 
> setwd("C:/Users/Anastasia/Downloads/exdata_data_household_power_consumption")
# set a path to needed data
> power <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")
# read in data from file then subsets data for specified dates
> power[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
# prevent histogram from printing in scientific notation
> power[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]
# change date column to date type
> power <- power[(Date >= "2007-02-01") & (Date <= "2007-02-02")]
# filter dates for 2007-02-01 and 2007-02-02
> png("plot1.png", width=480, height=480)
#set the parametres for .png picture
> hist(power[, Global_active_power], main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
#plot of the histogram (plot_1)
> dev.off()
