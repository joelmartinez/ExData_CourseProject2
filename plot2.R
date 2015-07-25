# 	2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the baseplotting system to make a plot answering this question. 
source("loadData.R")

filtered <- NEI[NEI$fips == "24510",]
summed <- aggregate(filtered$Emissions~filtered$year, data=filtered, sum)
regression <- lm(summed$"filtered$Emissions" ~ summed$"filtered$year")

png(filename='plot2.png', width=480, height=480, units="px")

plot(summed)
abline(regression)

dev.off()