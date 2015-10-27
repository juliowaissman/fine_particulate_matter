# Plot 1: a plot showing the total PM2.5 emission from all sources 
# for each of the years 1999, 2002, 2005, and 2008.

# Recovering and load the data
download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip', 
              'data.zip')
unzip('data.zip')
file.remove('data.zip')
NEI <- readRDS("summarySCC_PM25.rds")

#Tidyng data
library(plyr)
tidy.data <- ddply(NEI, ~year, summarise, total=sum(Emissions))

# Make plot
png(filename = "plot1.png", bg = "transparent", 
    width = 480, height = 480, units = 'px')
plot(tidy.data$year, tidy.data$total, type = "p", 
     main = "Total PM2.5 emission from all sources", 
     xlab = "Year", ylab = "PM2.5 total emission (tons)", 
     xaxt="n")
axis(1, at = c(1999, 2002, 2005, 2008), las=2)

dev.off()
