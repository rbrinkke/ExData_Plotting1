# load de packages needed
library(dplyr)
library(pryr)
library(lubridate)


input_file <- "Z:/Rob/coursera_exploratory_data_analysis/household_power_consumption.txt"


# Read the data into R
hcm <- read.table( file=input_file, sep=";", header=TRUE , stringsAsFactors = FALSE , na.strings="?" , colClasses =  c(rep("character",2),rep("numeric",7)))

# The dates of the working data set
hcm <- filter(hcm, Date %in% c("1/2/2007","2/2/2007"))

# Add a formated date time column
hcm <- mutate(hcm,date_time=dmy_hms(paste(Date,Time)))

# Open the grafich device to create the plot
png(filename = 'Z:/Rob/coursera_exploratory_data_analysis/plot2.png', units='px' , width = 480, height = 480)

# PLOT2 
with(hcm , plot(Global_active_power~date_time, type="l" , xlab="" , ylab = "Global Active Power (Kilowatts)"))

# close device the grafich device
dev.off()