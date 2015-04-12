# Read the column names
colNames <- colnames (read.csv ("household_power_consumption.txt", sep=";", nrows=1))

# Define the column classes; using numeric makes data load faster and will less memory
cols <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")

# Read in the data; just for 1/2/2007 and 2/2/2007
ds <- read.csv ("household_power_consumption.txt", sep=";", colClasses = cols, skip=50000, nrows=25000, na.strings="?", col.names = colNames)
ds <- ds[(ds$Date=="1/2/2007") | (ds$Date=="2/2/2007"),]

# Plot the histogram shown in the assigment instructions
png ("Plot1.png", width=480, height=480)
hist (ds$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()