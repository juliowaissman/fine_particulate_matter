# Plot 3: a plot showing the PM2.5 emission by type
# in the Baltimore City, Maryland (fips == 24510)
# for each of the years 1999, 2002, 2005, and 2008.

# Recovering and load the data
download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip', 
              'data.zip')
unzip('data.zip')
file.remove('data.zip')
NEI <- readRDS("summarySCC_PM25.rds")

#Tidyng data
library(plyr)
NEI_Baltimore <- NEI[NEI$fips==24510, ]
tidy.data <- ddply(NEI_Baltimore, ~year|type, summarise, total=sum(Emissions))

# Make plot
library(ggplot2)

png(filename = "plot3.png", bg = "transparent", 
    width = 480, height = 480, units = 'px')

ggplot(data = tidy.data, aes(year, total)) + 
  geom_line(aes(color=type)) + 
  geom_point(aes(color=type)) + 
  labs(title= "PM2.5 emissions by type in Baltimore") + 
  xlab("Year") + 
  ylab("PM2.5 emissions (tons)")

dev.off()
