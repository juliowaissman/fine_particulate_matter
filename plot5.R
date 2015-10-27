# Plot 5: a plot showing the emissions from motor vehicle sources
# in the Baltimore City, Maryland (fips == 24510)
# for each of the years 1999, 2002, 2005, and 2008.

# Recovering and load the data
download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip', 
              'data.zip')
unzip('data.zip')
file.remove('data.zip')
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Tidyng data
library(sqldf)
tidy.data <-sqldf("select year, sum(Emissions) 'Emissions' from NEI, SCC 
              where NEI.SCC = SCC.SCC and SCC.[EI.Sector] like 'Mobile%' and fips='24510' 
              group by year")

# Make plot
library(ggplot2)

png(filename = "plot5.png", bg = "transparent", 
    width = 480, height = 480, units = 'px')

ggplot(tidy.data, aes(year, Emissions)) +
  geom_line(size=1) +  
  geom_point(size=3) + 
  geom_smooth(method="lm") + 
  labs(title= "PM2.5 Emissions Motor vehicles Trend - Baltimore City") +
  xlab("Year") + 
  ylab("PM2.5 emissions (Tons)")

dev.off()
