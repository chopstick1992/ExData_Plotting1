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
c$active_power<-as.character(c$Global_active_power)
c$active_power<-as.numeric(c$active_power)
hist(c$active_power,col="red",xlab="Global Active Power(killowatts)",
     main="Global Active Power")
dev.copy(png,file="plot1.png")
dev.off()
