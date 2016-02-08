# Exploratory Data Analasys - Project 1 - plot3.R

# read in the file contents: skip 66636 rows and read 2880 rows from there (dates 2/1/2007-2/2/2007)
df <- read.table('household_power_consumption.txt', header = TRUE, sep=';', na.strings=c('?'),
	skip=66636, nrows=2880,
	col.names = c('Date', 'Time', 'Global_active_power', 'Global_reactive_power',
		'Voltage', 'Global_intensity', 'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
	colClasses = c(rep('character', 2), rep('numeric', 7)))

# create a new column for Posix Time that has the date and time rolled into one
df$datetime <- strptime(paste(df$Date, df$Time), '%d/%m/%Y %H:%M:%S')

# plot lines to png file
png(filename='plot3.png', width=480, height=480, units='px')

with(df, plot(datetime, Sub_metering_1, type='l', col='black', xlab='', ylab='Energy sub metering'))
with(df, lines(datetime, Sub_metering_2, type='l', col='red'))
with(df, lines(datetime, Sub_metering_3, type='l', col='blue'))
legend('topright', lty=c(1,1,1), col=c('black', 'red', 'blue'), legend=names(df)[7:9])
dev.off(which=dev.cur())
