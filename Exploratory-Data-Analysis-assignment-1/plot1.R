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

png('plot1.png',width = 480, height = 480)
hist(household_consumption,
     main = 'Global Active Power',
     xlab = 'Global Active Power(KW)',
     ylab = 'Frequency',
     col = 'red')
dev.off()
