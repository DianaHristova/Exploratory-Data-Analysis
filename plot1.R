## read in file saved in working directory
week1<-read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?",stringsAsFactors=FALSE)

## change dates to date class
week1$Date<-as.Date(week1$Date,format="%d/%m/%Y")

## subset to the dates needed for the assignment
mydates<-subset(week1,Date>="2007-02-01"&Date<="2007-02-02")

## merge dates and times into a new column
mydates$DateTime<-paste(mydates$Date,mydates$Time)

## change dates and times to date and time class
mydates$DateTime<-strptime(mydates$DateTime,format="%Y-%m-%d %H:%M:%S")

## create Plot 1
hist(mydates$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency", main="Global Active Power")

## copy plot 1 to a png file
dev.copy(png,file="plot1.png",height=480,width=480)
dev.off()
