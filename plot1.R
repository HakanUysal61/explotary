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

png(file="plot1.png")

hist(data$Global_active_power,col="red",breaks=20,
     xlab = "Global Active Power (kilowatts)",
     ylab="Frequency")

dev.off()


