# Read the column names
colNames <- colnames (read.csv ("household_power_consumption.txt", sep=";", nrows=1))

# Define the column classes; using numeric makes data load faster and will less memory
cols <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")

# Read in the data; just for 1/2/2007 and 2/2/2007
ds <- read.csv ("household_power_consumption.txt", sep=";", colClasses = cols, skip=50000, nrows=25000, na.strings="?", col.names = colNames)
ds <- ds[(ds$Date=="1/2/2007") | (ds$Date=="2/2/2007"),]

# Four plots shown together
png ("Plot4.png", width=480, height=480)
par(mfcol=c(2,2))

# Compute this once, since it's used in all plots
xvals <- strptime (paste (ds$Date, ds$Time), "%d/%m/%Y %H:%M:%S")

# First plot is our old plot 2
plot (xvals, ds$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

# Second plot is our old plot 3
plot (xvals, ds$Sub_metering_1, type="l", col="black", ylab="Energy sub metering", xlab="")
lines (xvals, ds$Sub_metering_2, col="red")
lines (xvals, ds$Sub_metering_3, col="blue")
legend ("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1),col=c("black", "red", "blue"))

# New plot - Voltage
plot (xvals, ds$Voltage, type="l", ylab="Voltage", xlab="datetime")

# New plot - Global reactive power
plot (xvals, ds$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
dev.off()