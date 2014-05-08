## Read in table

DF <- read.table("household_power_consumption.txt", header=TRUE, as.is = T , sep=";") 

## Convert Data field to Date format
DF$DD<-as.Date(DF$Date,"%d/%m/%Y")

## Filter only 2 days needed
DF.select = DF[(DF$DD == "2007-02-01" | DF$DD == "2007-02-02"),]

## make GAP field a number
DF.select$Global_active_power<-as.numeric(DF.select$Global_active_power)

## make the histogram
hist(DF.select$Global_active_power,col="Red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")


# Make a png
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()

