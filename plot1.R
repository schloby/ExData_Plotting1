
#Be in the right directory and download and unzip the file if it doesn't exist

#setwd("~/data science coursework/Lesson_4_Exploratory_Data_Analysis/Course_Project_1")
#edit for you own WD if you need to change it

if  (!file.exists("household_power_consumption.txt")){
  url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(url, destfile="destfile.zip")
  unzip("destfile.zip")
}

#Read in the table and format the dates 
power<-read.table("household_power_consumption.txt", sep=";", header=TRUE, na.string="?")
power$Date<-as.Date(power$Date, "%d/%m/%Y")


#Subset for our dates
power.subset <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]

#Make plot 1 and save to png:
png(filename="plot1.png",  width = 480, height = 480)
hist(power.subset$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")
dev.off()








