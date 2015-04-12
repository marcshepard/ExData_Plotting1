# Read the column names
colNames <- colnames (read.csv ("household_power_consumption.txt", sep=";", nrows=1))

# Define the column classes; using numeric makes data load faster and will less memory
cols <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")

# Read in the data; just for 1/2/2007 and 2/2/2007
ds <- read.csv ("household_power_consumption.txt", sep=";", colClasses = cols, skip=50000, nrows=25000, na.strings="?", col.names = colNames)
ds <- ds[(ds$Date=="1/2/2007") | (ds$Date=="2/2/2007"),]

# Plot the histogram shown in the assigment instructions
png ("Plot2.png", width=480, height=480)
plot (strptime (paste (ds$Date, ds$Time), "%d/%m/%Y %H:%M:%S"), ds$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
