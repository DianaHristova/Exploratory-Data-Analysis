week1<-read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?",stringsAsFactors=FALSE)
week1$Date<-as.Date(week1$Date,format="%d/%m/%Y")
mydates<-subset(week1,Date>="2007-02-01"&Date<="2007-02-02")
mydates$DateTime<-paste(mydates$Date,mydates$Time)
mydates$DateTime<-strptime(mydates$DateTime,format="%Y-%m-%d %H:%M:%S")

hist(mydates$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency", main="Global Active Power")
dev.copy(png,file="plot1.png",height=480,width=480)
dev.off()