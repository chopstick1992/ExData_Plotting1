file <-"codingass/household.txt"
a<-read.table(file,header=TRUE,sep=";")
head(a)
b<-a
b$datetime<-paste(a[,1],a[,2],sep=" ")
b$datetime<-strptime(b$datetime,"%d/%m/%Y %H:%M:%S")
d<-b$datetime
mon<-d$mon+1
mday<-d$mday
year<-d$year+1900
c<-b[year==2007 & mon == 2 & (mday==1 | mday==2),]
c$Sub_metering_11<-as.character(c$Sub_metering_1)
c$Sub_metering_11<-as.numeric(c$Sub_metering_11)
c$Sub_metering_21<-as.character(c$Sub_metering_2)
c$Sub_metering_21<-as.numeric(c$Sub_metering_21)
c$Sub_metering_31<-as.character(c$Sub_metering_3)
c$Sub_metering_31<-as.numeric(c$Sub_metering_31)
c$active_power<-as.character(c$Global_active_power)
c$active_power<-as.numeric(c$active_power)
c$vol<-as.character(c$Voltage)
c$vol<-as.numeric(c$vol)
c$reactive_power<-as.character(c$Global_reactive_power)
c$reactive_power<-as.numeric(c$reactive_power)
par(mfcol = c(2,2),mar=c(4,4,1,1))

plot(c$datetime,c$active_power,type="l",ylab="Global Active Power",
     xlab="")

plot(c$datetime,c$Sub_metering_11,type="l",col="black",
     ylab = "Energy sub metering",xlab="")
lines(c$datetime,c$Sub_metering_21,col="red")
lines(c$datetime,c$Sub_metering_31,col="blue")


plot(c$datetime,c$vol,type="l",ylab="Voltage",xlab="datetime")

plot(c$datetime,c$reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")

dev.copy(png,file="plot4.png")
dev.off()

