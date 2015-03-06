##########################################################################################################
## Coursera Plotting Assignment 1 for Exploratory Data Analysis
## José Manuel Teles Louro da Silva 
## JoseLouro@gmail.com

### plot1.R File Description:

### This assignment uses data from the UC Irvine Machine Learning Repository, a popular repository for machine learning datasets. In particular, we will be using the "Individual household electric power consumption Data Set" which I have made available on the course web site:
### Dataset: Electric power consumption [20Mb]
### Description: Measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available.
### The following descriptions of the 9 variables in the dataset are taken from the UCI web site:
### Date: Date in format dd/mm/yyyy
### Time: time in format hh:mm:ss
### Global_active_power: household global minute-averaged active power (in kilowatt)
### Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
### Voltage: minute-averaged voltage (in volt)
### Global_intensity: household global minute-averaged current intensity (in ampere)
### Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
### Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
### Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.
##########################################################################################################
### Set working directory to the location where the Electric power consumption Dataset was unzipped.
# setwd("H:/My Documents/Personal Stuff/Career Docs/2. Data Science Specialization/4. Exploratory Data Analysis/3. Quizzes/ExData_Plotting1")


# Check for Data File Archive
fileName <- "exdata-data-household_power_consumption.zip"
if(! file.exists(fileName)) {
	 message("Downloading the data set archive...")
	 fileURL="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
	 download.file(url=fileURL,destfile=fileName,method="curl")
}
# Extract Data File
if(! file.exists("household_power_consumption.txt")) {
	 message("Extracting the data set files from the archive...")
	 unzip(zipfile = fileName)
}

# Read in the data set
message("Reading the data set file...")
consumption <- read.csv("household_power_consumption.txt",sep=";",na.strings='?',header=TRUE,colClasses = c("character",rep("factor",1),rep("numeric",7)))

# Extract a subset of the data for the dates 2007-02-01 and 2007-02-02
message("Extract a subset of the data for the dates 2007-02-01 and 2007-02-02...")
selection <- consumption[consumption$Date %in% c("1/2/2007","2/2/2007"),]

# Plot the Data!
message("Plotting the data...")
png("plot1.png",width=480,height=480,units="px",bg="transparent")
hist(
	selection$Global_active_power,
	col="red", 
	main="Global Active Power", 
	xlab="Global Active Power (kilowatts)",
	ylab="Frequency"
)

message("Saving the plot...")
dev.off() # Close the PNG device!
