rm(list=ls())
setwd("C:/Users/ENKHUY/Documents/TRAINING/R/explotary")
library(tidyr)
library(dplyr)
library(reshape2)
library(data.table)
library(tidyselect)
library(datasets)
library(lattice)

data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",
                 na.strings="?",nrows=1)
x<-names(data)                
data<-read.table("household_power_consumption.txt",sep=";",
                 na.strings="?",nrows=4800,
                 skip=grep("31/1/2007",readLines("household_power_consumption.txt")))

names(data)<-x
data <-subset(data,data$Date=="1/2/2007"|data$Date=="2/2/2007")



png(file="plot4.png")

par(cex=0.5,mfrow=c(2,2))

# Plot Up Left
plot(strptime(paste(as.character(data$Date),as.character(data$Time)),format="%e/%m/%Y %T")
     ,data$Global_active_power,
     xlab="",
     ylab="Global Active Power",
     type="l")

# Plot Up Right
plot(strptime(paste(as.character(data$Date),as.character(data$Time)),format="%e/%m/%Y %T")
     ,data$Voltage,
      xlab="datetime",
      ylab="Voltage",
     type="l")

# Plot Bottom Left
plot(strptime(paste(as.character(data$Date),as.character(data$Time)),format="%e/%m/%Y %T")
     ,data$Sub_metering_1,col="black",
     xlab="",
     ylab="Energy Sub Metering",
     type="l")

points(strptime(paste(as.character(data$Date),as.character(data$Time)),format="%e/%m/%Y %T")
       ,data$Sub_metering_2,col="red",
       type="l")

points(strptime(paste(as.character(data$Date),as.character(data$Time)),format="%e/%m/%Y %T")
       ,data$Sub_metering_3,col="blue",
       type="l")

legend("topright",pch="_",col=c("black","blue","red"),
       bty="n",
       legend=c("Sub Metering 1","Sub Metering 2","Sub Metering 3"))

#plot bottom right
plot(strptime(paste(as.character(data$Date),as.character(data$Time)),format="%e/%m/%Y %T")
     ,data$Global_reactive_power,
     xlab="datetime",
     ylab="Global_Reactive_Power",
     type="l")



dev.off()
     
