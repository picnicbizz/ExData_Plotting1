# R Ploting graph: Data source from  Electric power consumption 
# date from 2007-02-01 and 2007-02-02
# read the data by subsetting them


fn<-"./dataloc/household_power_consumption.txt"
data <- read.table(fn, header = TRUE, sep = ";",stringsAsFactors=FALSE)
str(data)
head(data)
data$Date<-as.Date(data$Date,"%d/%m/%Y")
str(data)
supdf<-subset(data, Date=="2007-02-01" |Date=="2007-02-02" )
#remove(data)
str(supdf)

#Convert string to numeric
supdf$Sub_metering_1<-as.numeric(supdf$Sub_metering_1)
supdf$Sub_metering_2<-as.numeric(supdf$Sub_metering_2)
supdf$Sub_metering_3<-as.numeric(supdf$Sub_metering_3)

#create new date time varable
temp<-paste(supdf$Date,supdf$Time,sep=' ')
#convert character date time to date time value
dt<-strptime(temp,"%Y-%m-%d %H:%M:%S")


plot(dt,supdf$Sub_metering_1,col="black",type = "l",ylab = "Global Active Power(kilowatts)",xlab = "")
lines(dt,supdf$Sub_metering_2, col="red", type="l")
lines(dt,supdf$Sub_metering_3, col="blue", type="l")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1),lwd=c(1,1,1),col=c("black","red","blue"),cex=0.7,pt.cex=1)
dev.copy(png, file = "./ExData_Plotting1/plot3.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!

