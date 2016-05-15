setwd("/Users/grharon/OneDrive/CourseOnline/CourseraDataScience/assignment/4ExploratoryDataAnalysis")
data<- read.table("exdata-data-household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")
dim(data)
names(data)
data<-data[data$Date=='1/2/2007' | data$Date=='2/2/2007',]
dim(data)
names(data)

data$Date<-as.Date(strptime(data$Date,"%d/%m/%Y"))

typeof(data$Global_active_power)

with(data,plot(strptime(paste(data$Date,data$Time),"%Y-%m-%d %H:%M:%S"),Global_active_power,ylab = "Global Active Power(kilowatts)",xlab = "",type ="l"))
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
