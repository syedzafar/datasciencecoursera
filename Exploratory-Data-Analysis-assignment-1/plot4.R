#loading the package

library(dplyr)

# Reading .txt file

power <- read.table('household_power_consumption.txt',
                    header = TRUE,
                    sep = ';')
power <- tbl_df(power)

# checking the data set

head(power)

#taking just two dates into account

household_power <- subset(power,
                          power$Date == '1/2/2007' |power$Date == '2/2/2007')

consumption <- household_power$Global_active_power

household_consumption <- as.numeric(as.character(consumption))

#plot the graph

png('plot4.png',width = 480, height = 480)

par(mfrow=c(2,2))

datetime <- strptime(paste(household_power$Date,
                           household_power$Time,
                           sep = ' '),
                     "%d/%m/%Y %H:%M:%S")
plot(datetime,household_consumption,type = 'l',xlab = 'datetime',
     ylab = 'Global Active Power (kilowatts)')

volt <- as.numeric(as.character(household_power$Voltage))

plot(datetime,volt,type='l',xlab='datetime',ylab='Voltage')

plot(datetime,household_power$Sub_metering_1,
     type = 'l',xlab = '',
     ylab = 'Energy sub metering',col = 'green',
     ylim = c(0,40))

par(new=TRUE)

plot(datetime,household_power$Sub_metering_2,
     type = 'l',xlab = '',
     ylab = '',col = 'red',
     ylim = c(0,40))

par(new=TRUE)

plot(datetime,household_power$Sub_metering_3,
     type = 'l',xlab = '',
     ylab = '',col = 'blue',
     ylim = c(0,40))

legend('topright',legend=c('Sub_metering_1','Sub_metering_2',
                           'Sub_metering_3'),lty =1,
       col = c('green','red','blue'))

allplots <-as.numeric(as.character(household_power$Global_reactive_power))

plot(datetime,allplots,type='l',xlab='datetime',
     ylab = 'Global_reactive_power')

dev.off()
