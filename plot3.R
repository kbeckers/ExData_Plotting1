library(data.table)
library(datasets)
library(lubridate)

## First READ the txt file
## extracting the columnnames from the household_power_consumption.txt file
colNames<-names(read.table("./household_power_consumption.txt",
                           header = TRUE, 
                           sep = c(";",""), 
                           na.strings = "?",
                           nrows=1))
## read in the file for household power consumption setting colClasses for speed and naming the columns 
## the skip number and the nrows got obtained through the first read.R file
hpc<-read.table("./household_power_consumption.txt",
                header = FALSE, 
                sep = c(";",""), 
                na.strings = "?",
                col.names=colNames,
                colClasses = c("character","character","numeric","numeric","numeric",                   
                               "numeric","numeric","numeric","numeric"), skip = 66637, nrows=2880)
hpc$newDate<-strptime(paste(hpc$Date,hpc$Time, sep=" "), "%d/%m/%Y %H:%M:%S")    
## explicitly launch graphics device(in this case .png file)
png(filename = "plot3.png", width = 480, height = 480)

plot(hpc$newDate,hpc$Sub_metering_1,type = "n",
     xlab="", ylab ="Energy sub metering")
lines(hpc$newDate,hpc$Sub_metering_1 ,col="black")
lines(hpc$newDate,hpc$Sub_metering_2 ,col="red")
lines(hpc$newDate,hpc$Sub_metering_3 ,col="blue")
## set legend in top right corner
legend("topright", lty=1,col= c("black","red","blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
## explicitly close graphics device          
dev.off()   