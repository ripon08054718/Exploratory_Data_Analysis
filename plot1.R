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


## Plot 1....
png("plot1.png", width = 480, height = 480)
plot1<-hist(data$Global_active_power, main="Global Active Power",
xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()