Data for Peer Assessment [29Mb]
The [zip file](https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip) contains two files:

1. **PM2.5 Emissions Data** (`summarySCC_PM25.rds`): This file contains a data frame with all of the PM2.5 emissions data for 1999, 2002, 2005, and 2008. For each year, the table contains number of tons of PM2.5 emitted from a specific type of source for the entire year. 
    1. fips: A five-digit number (represented as a string) indicating the U.S. county

    2. SCC: The name of the source as indicated by a digit string (see source code classification table)

    3. Pollutant: A string indicating the pollutant

    4. Emissions: Amount of PM2.5 emitted, in tons

    5. type: The type of source (point, non-point, on-road, or non-road)

    6. year: The year of emissions recorded

2. **Source Classification Code Table** (`Source_Classification_Code.rds`): This table provides a mapping from the SCC digit strings in the Emissions table to the actual name of the PM2.5 source. The sources are categorized in a few different ways from more general to more specific and you may choose to explore whatever categories you think are most useful. For example, source “10100101” is known as “Ext Comb /Electric Gen /Anthracite Coal /Pulverized Coal”.

You can read each of the two files using the readRDS() function in R. For example, reading in each file can be done with the following code:
```
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
```


