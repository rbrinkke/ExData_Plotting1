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
hcm <- mutate(hcm,datetime=dmy_hms(paste(Date,Time)))

# Open the grafich device to create the plot
png(filename = 'Z:/Rob/coursera_exploratory_data_analysis/plot4.png', units='px' , width = 480, height = 480)

# Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with ( hcm,
       {
         plot(Global_active_power~datetime, type="l" , xlab="" , ylab = "Global Active Power")
         plot(Voltage~datetime, type="l" , ylab = "Voltage")
         plot( Sub_metering_1~datetime, type="n", xlab="" , ylab = "Energy sub metering" )
         points(Sub_metering_1~datetime, type="l")
         points(Sub_metering_2~datetime, type="l", col="red")
         points(Sub_metering_3~datetime, type="l", col="blue")
         legend("topright" , legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3") , lty=c(1,1,1),col=c("black","red", "blue"))
         plot(Global_reactive_power~datetime, type="l" , ylab = "Global_reactive_power") 
       }  
)

# close device the grafich device
dev.off()