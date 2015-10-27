# Plot 4: a plot of the trend of the coal related emissions 
# in the United States for each of the years 1999, 2002, 2005, and 2008.

# Recovering and load the data
download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip', 
              'data.zip')
unzip('data.zip')
file.remove('data.zip')
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Tidyng data
coal.list <- SCC[grepl("Coal", SCC$Short.Name), ]$SCC
NEI.coal <- NEI[NEI$SCC %in% coal.list]
library(plyr)
tidy.data <- ddply(NEI.coal, ~year, summarise, total=sum(Emissions))


# Make plot
library(ggplot2)

png(filename = "plot4.png", bg = "transparent", 
    width = 480, height = 480, units = 'px')

ggplot(tidy.data, aes(year, total)) + 
  geom_line(size=1) + 
  geom_point(size=3) +
  labs(title= "PM2.5 Emissions Coal related Trend - US") +
  xlab("Year") + 
  ylab("PM2.5 emissions (Tons)") 

dev.off()
