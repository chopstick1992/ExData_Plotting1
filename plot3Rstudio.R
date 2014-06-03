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

plot(c$datetime,c$Sub_metering_11,type="l",col="black",
     ylab = "Energy sub metering",xlab="")
lines(c$datetime,c$Sub_metering_21,col="red")
lines(c$datetime,c$Sub_metering_31,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
lty=1,col=c("black","red","blue"))


dev.copy(png,file="plot3Rstudio.png")
dev.off()
