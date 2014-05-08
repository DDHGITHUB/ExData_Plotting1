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

## make plot2
plot(x, DF.select$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")


# Make a png
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()

