
if (length(ls(pat="ElectricPowerConsumption"))==0) {
      ElectricPowerConsumption<-read.csv("household_power_consumption.txt",sep=";",header=T,stringsAsFactors=FALSE) 
      ElectricPowerConsumption$DT<-strptime(paste(ElectricPowerConsumption$Date, ElectricPowerConsumption$Time), format="%d/%m/%Y %H:%M:%S")
      ElectricPowerConsumption<-subset(ElectricPowerConsumption,DT>=strftime('2007-02-01 00:00:00')&DT<strftime('2007-02-03 00:00:00'))

      }

png(filename='plot4.png', width=480, height=480, units='px')

par(mfrow=c(2,2))

with(ElectricPowerConsumption,plot(DT,as.numeric(Global_active_power),xlab="",type="l",ylab="Global Active Power"))

with(ElectricPowerConsumption,plot(DT,as.numeric(Voltage),xlab="datetime",type="l",ylab="Voltage"))

with(ElectricPowerConsumption,plot(DT,as.numeric(Sub_metering_1),xlab="",type="l",ylab="Energy sub metering"))

with(ElectricPowerConsumption,lines(DT,as.numeric(Sub_metering_2),type="l",col="red"))

with(ElectricPowerConsumption,lines(DT,as.numeric(Sub_metering_3),type="l",col="blue"))

legend("topright", legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty=c(1, 1, 1),bty="n")

with(ElectricPowerConsumption,plot(DT,as.numeric(Global_reactive_power),xlab="datetime",ylab="Global_reactive_power",type="l"))

dev.off()