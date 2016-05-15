setwd("/Users/grharon/OneDrive/CourseOnline/CourseraDataScience/assignment/4ExploratoryDataAnalysis")
data<- read.table("exdata-data-household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")
data<-data[data$Date=='1/2/2007' | data$Date=='2/2/2007',]
data$Date<-as.Date(strptime(data$Date,"%d/%m/%Y"))

hist(data1$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab="Frequency", main = "Global Active Power")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
