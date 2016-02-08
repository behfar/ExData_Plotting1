# Exploratory Data Analasys - Project 1 - plot1.R

# read in the file contents: skip 66636 rows and read 2880 rows from there (dates 2/1/2007-2/2/2007)
df <- read.table('household_power_consumption.txt', header = TRUE, sep=';', na.strings=c('?'),
	skip=66636, nrows=2880,
	col.names = c('Date', 'Time', 'Global_active_power', 'Global_reactive_power',
		'Voltage', 'Global_intensity', 'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
	colClasses = c(rep('character', 2), rep('numeric', 7)))

# plot histogram to png file
png(filename='plot1.png', width=480, height=480, units='px')
hist(df$Global_active_power, col='red', main='Global Active Power', xlab='Global Active Power (kilowatts)')
dev.off(which=dev.cur())
