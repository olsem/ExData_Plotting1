
if (length(ls(pat="ElectricPowerConsumption"))==0) {
      ElectricPowerConsumption<-read.csv("household_power_consumption.txt",sep=";",header=T,stringsAsFactors=FALSE) 
      ElectricPowerConsumption$DT<-strptime(paste(ElectricPowerConsumption$Date, ElectricPowerConsumption$Time), format="%d/%m/%Y %H:%M:%S")
      ElectricPowerConsumption<-subset(ElectricPowerConsumption,DT>=strftime('2007-02-01 00:00:00')&DT<strftime('2007-02-03 00:00:00'))

      }

png(filename='plot3.png', width=480, height=480, units='px')

with(ElectricPowerConsumption,plot(DT,as.numeric(Sub_metering_1),xlab="",type="l",ylab="Energy sub metering"))

with(ElectricPowerConsumption,lines(DT,as.numeric(Sub_metering_2),type="l",col="red"))

with(ElectricPowerConsumption,lines(DT,as.numeric(Sub_metering_3),type="l",col="blue"))

legend("topright", legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty=c(1, 1, 1))

dev.off()