## Read in table

DF <- read.table("household_power_consumption.txt", header=TRUE, as.is = T , sep=";") 

## Convert Data field to Date format
DF$DD<-as.Date(DF$Date,"%d/%m/%Y")

## Filter only 2 days needed
DF.select = DF[(DF$DD == "2007-02-01" | DF$DD == "2007-02-02"),]

## make GAP field a number
DF.select$Global_active_power<-as.numeric(DF.select$Global_active_power)

## make date-time field
x <- paste(as.Date(DF.select$Date, "%d/%m/%Y"), DF.select$Time)
x<- strptime(x, "%Y-%m-%d %H:%M:%S")

## make plot3
plot(x, as.numeric(DF.select$Sub_metering_1), type="l",
     ylab="Energy sub metering", xlab="")
lines(x, as.numeric(DF.select$Sub_metering_2), type="l", col="red")
lines(x, as.numeric(DF.select$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd =2.5,
       col=c("black", "red", "blue"))



# Make a png
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()

