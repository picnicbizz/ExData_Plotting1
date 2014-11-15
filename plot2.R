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

supdf$Global_active_power<-as.numeric(supdf$Global_active_power)
#create new date time varable
temp<-paste(supdf$Date,supdf$Time,sep=' ')
#convert character date time to date time value
dt<-strptime(temp,"%Y-%m-%d %H:%M:%S")


plot(dt,supdf$Global_active_power,type = "l",ylab = "Global Active Power(kilowatts)",xlab = "")
dev.copy(png, file = "./ExData_Plotting1/plot2.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!

