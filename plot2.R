############################################################
####			Explanatory Data analysis		   ###
####				Md. Sahidul Islam			   ###
############################################################


# Loading data into R...
data<-read.table("household_power_consumption.txt",header=T, sep=';', na.strings="?",
nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

data$Date <- as.Date(data$Date, format="%d/%m/%Y")


## Subsetting the data...
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
dim(data)
head(data)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 2....
png("plot2.png", width = 480, height = 480)
names = c("Thu","Fri","Sat")
plot(data[,3],type='l', ylab="Global Active Power (kilowatts)", xaxt='n',xlab="")
axis(1,at=c(0,1441,2880),
labels=names)
dev.off()