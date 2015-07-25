#	1.	Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008. 
source("loadData.R")
summed <- aggregate(NEI$Emissions~NEI$year, data=NEI, sum)
regression <- lm(summed$"NEI$Emissions" ~ summed$"NEI$year")

png(filename='plot1.png', width=480, height=480, units="px")

plot(summed)
abline(regression)

dev.off()