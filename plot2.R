
#Be in the right directory and download and unzip the file if it doesn't exist

#setwd("~/data science coursework/Lesson_4_Exploratory_Data_Analysis/Course_Project_1")
#edit for you own WD if you need to change it

if  (!file.exists("household_power_consumption.txt")){
  url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(url, destfile="destfile.zip")
  unzip("destfile.zip")
}

#Read in the table and format the dates and times
power<-read.table("household_power_consumption.txt", sep=";", header=TRUE, na.string="?")
power$Date<-as.Date(power$Date, "%d/%m/%Y")


#Subset for our dates and get the datetime
power.subset <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]
power.subset$datetime <- strptime(paste(power.subset$Date, power.subset$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 


#Make plot 2 and save to png:
png(filename="plot2.png",  width = 480, height = 480)
plot(power.subset$datetime, power.subset$Global_active_power,  type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()








