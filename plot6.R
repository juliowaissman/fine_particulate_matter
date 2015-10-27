# Plot 6: a plot comparing the emissions from motor vehicle sources
# in the Baltimore City, Maryland (fips == 24510) against
# Los Angeles County, California (fips == 06037)
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
tidy.data <-sqldf("select year, 
                   case fips 
                       when '24510' then 'Baltimore City' 
                                    else 'Los Angeles County' 
                       end as City, 
                   sum(Emissions) 'Emissions' 
                   from NEI, SCC 
                   where NEI.SCC = SCC.SCC and SCC.[EI.Sector] 
                   like 'Mobile%' and fips in ('24510','06037')
                   group by year, fips")

# Make plot
library(ggplot2)

png(filename = "plot6.png", bg = "transparent", 
    width = 480, height = 480, units = 'px')

ggplot(tidy.data, aes(year, Emissions)) + 
  geom_line(aes(color=City)) +  
  geom_point(size=3, aes(color=City)) +
  labs(title= "PM2.5 Emissions Motor vehicles Trend \n Baltimore vs Los Angeles") +
  xlab("Year") + 
  ylab("PM2.5 emissions (Tons)") 

dev.off()
