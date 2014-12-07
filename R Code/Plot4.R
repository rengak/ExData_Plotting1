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

#plot 4

png("Plot4.png")

par(mfrow=c(2,2))

plot(plot_file$date_time, plot_file$Global_active_power,type="n", 
     ylab = "Global Active Power (kilowatts)",xlab="")
lines(plot_file$date_time,plot_file$Global_active_power)
plot(plot_file$date_time, plot_file$Voltage,type="n", 
     ylab = "Voltage",xlab="datetime")
lines(plot_file$date_time,plot_file$Voltage)
plot(plot_file$date_time, plot_file$Sub_metering_1,type="n",ylab="Energy Sub Metering",xlab="")
lines(plot_file$date_time,plot_file$Sub_metering_1,col="black")
lines(plot_file$date_time,plot_file$Sub_metering_2,col="red")
lines(plot_file$date_time,plot_file$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty =1,col=c("black","red","blue")
       ,text.font=1,bty="n")
plot(plot_file$date_time, plot_file$Global_reactive_power,type="n", 
     ylab = "Global_reactive_power",xlab="datetime")
lines(plot_file$date_time,plot_file$Global_reactive_power)

dev.off()






