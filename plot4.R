setwd("/Users/grharon/OneDrive/CourseOnline/CourseraDataScience/assignment/4ExploratoryDataAnalysis")
data<- read.table("exdata-data-household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")
data<-data[data$Date=='1/2/2007' | data$Date=='2/2/2007',]
data$Date<-as.Date(strptime(data$Date,"%d/%m/%Y"))

par(mfrow = c(2,2),mar = c(4.5,4,4,2), oma = c(0,0,0,0))
with(data,{
  with(data,plot(strptime(paste(data$Date,data$Time),"%Y-%m-%d %H:%M:%S"),Global_active_power,ylab = "Global Active Power",xlab = "",type ="l"))
  
  with(data,plot(strptime(paste(data$Date,data$Time),"%Y-%m-%d %H:%M:%S"),Voltage,ylab = "Voltage",xlab = "datetime",type ="l"))
  
  with(data,plot(strptime(paste(data$Date,data$Time),"%Y-%m-%d %H:%M:%S"),Sub_metering_1,ylab = "Energy sub metering",xlab = "",type ="n"))
  with(data,lines(strptime(paste(data$Date,data$Time),"%Y-%m-%d %H:%M:%S"),Sub_metering_1,col = "black"))
  with(data,lines(strptime(paste(data$Date,data$Time),"%Y-%m-%d %H:%M:%S"),Sub_metering_2,col = "red"))
  with(data,lines(strptime(paste(data$Date,data$Time),"%Y-%m-%d %H:%M:%S"),Sub_metering_3,col = "blue"))
  legend("topright",bty="n",pch = c(NA,NA,NA),col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),adj = c(0, 0.5),pt.cex = 1,cex = 0.75,xjust=0,yjust=1, seg.len=0.75,lwd=1, lty=c(1,1,1),merge=FALSE)
  
  with(data,plot(strptime(paste(data$Date,data$Time),"%Y-%m-%d %H:%M:%S"),Global_reactive_power,ylab = "Global_Reactive_Power",xlab = "datetime",type ="l"))
})

dev.copy(png, file = "plot4.png")
dev.off()
