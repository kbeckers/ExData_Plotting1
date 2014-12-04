library(data.table)
library(datasets)
library(lubridate)
## read in the file for household power consumption setting colClasses for speed
## hpc (working file - meaning Household Power Consumption)
hpc<-read.table("./household_power_consumption.txt",
                header = TRUE, 
                sep = c(";",""), 
                na.strings = "?",
                colClasses = c("character","character","numeric","numeric","numeric",                   
                               "numeric","numeric","numeric","numeric"))
## change the date to date format, so you can work with it
hpc$Date<-as.Date(hpc$Date,"%d/%m/%Y")
newhpc<-hpc[(hpc$Date=="2007-02-01"|hpc$Date=="2007-02-02"),]
##determine the first row with the resp. data in it
head(newhpc)
## use the numbers in the plotting files.
summary(newhpc)
str(newhpc)