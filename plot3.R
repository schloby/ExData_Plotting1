
#Be in the right directory and download and unzip the file if it doesn't exist

setwd("~/data science coursework/Lesson_4_Exploratory_Data_Analysis/Course_Project_1")


if  (!file.exists("household_power_consumption.txt")){
  url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(url, destfile="destfile.zip")
  unzip("destfile.zip")
}

#Read in the table and format the dates 
power<-read.table("household_power_consumption.txt", sep=";", header=TRUE, na.string="?")
power$Date<-as.Date(power$Date, "%d/%m/%Y")


#Subset for our dates and get the datetime
power.subset <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]
power.subset$datetime <- strptime(paste(power.subset$Date, power.subset$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 

#Make plot 3 and save to png:
png(filename="plot3.png",  width = 480, height = 480)

#Plot the first variable, then add the next two as lines
plot(power.subset$datetime, power.subset$Sub_metering_1,  type="l", xlab="", ylab="Energy sub metering")
lines(power.subset$datetime, power.subset$Sub_metering_2,  type="l", col="red")
lines(power.subset$datetime, power.subset$Sub_metering_3,  type="l", col="blue")

#Add the legend, getting the colors right
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "blue", "red"), lty=c(1,1,1))
dev.off()


