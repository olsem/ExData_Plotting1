
if (length(ls(pat="ElectricPowerConsumption"))==0) {
      ElectricPowerConsumption<-read.csv("household_power_consumption.txt",sep=";",header=T,stringsAsFactors=FALSE) 
      ElectricPowerConsumption$DT<-strptime(paste(ElectricPowerConsumption$Date, ElectricPowerConsumption$Time), format="%d/%m/%Y %H:%M:%S")
      ElectricPowerConsumption<-subset(ElectricPowerConsumption,DT>=strftime('2007-02-01 00:00:00')&DT<strftime('2007-02-03 00:00:00'))

      }

png(filename='plot1.png', width=480, height=480, units='px')

with(ElectricPowerConsumption,hist(as.numeric(Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)"))

dev.off()