library(lubridate)

wd <- "/Users/krenganthan/Desktop/EDA ML"
setwd(wd)

# Reading input file

input_file <- read.table("household_power_consumption.txt",header = TRUE,sep=";"
                         ,colClasses=c(rep("character",9)))

input_file[input_file=="?"]<-""

input_file$Date <- as.Date(input_file$Date,format = "%d/%m/%Y")
input_file[, c(3:9)] <- sapply(input_file[, c(3:9)], as.numeric)

plot_file <- input_file[input_file$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]
plot_file$date_time <- as.POSIXct(paste(plot_file$Date,plot_file$Time,""),"%Y-%m-%d %H:%M:%S")

#plot 2

png("Plot2.png")
par(mfrow=c(1,1))


plot(plot_file$date_time, plot_file$Global_active_power,type="n", 
     ylab = "Global Active Power (kilowatts)",xlab="")
lines(plot_file$date_time,plot_file$Global_active_power)

dev.off()







