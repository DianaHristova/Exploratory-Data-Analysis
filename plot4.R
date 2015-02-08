week1<-read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?",stringsAsFactors=FALSE)
week1$Date<-as.Date(week1$Date,format="%d/%m/%Y")
mydates<-subset(week1,Date>="2007-02-01"&Date<="2007-02-02")
mydates$DateTime<-paste(mydates$Date,mydates$Time)
mydates$DateTime<-strptime(mydates$DateTime,format="%Y-%m-%d %H:%M:%S")

par(mfrow=c(2,2))
with(mydates,
	{plot(DateTime,Global_active_power, type="l",ylab="Global Active Power",xlab="")
	plot(DateTime,Voltage,type="l",ylab="Voltage",xlab="datetime")
	plot(DateTime,Sub_metering_1,type="l",col="Black",ylab="Energy sub metering",xlab="")
	lines(DateTime,Sub_metering_2,col="Red")
	lines(DateTime,Sub_metering_3,col="Blue")
	legend("topright",lty=1,lwd=1,col=c("Black","Blue","Red"),
		legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")) 
	plot(DateTime,Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
})
dev.copy(png,file="plot4.png",height=480,width=480)
dev.off()