# 6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

source("loadData.R")

# first get the codes for vehicle-related classifications
fscc <- SCC[grepl("vehicle", as.character(SCC$SCC.Level.Two), ignore.case=T),]
vehicle.sources <- as.character(fscc$SCC)
filtered <- NEI[NEI$fips %in% c("24510","06037"),]
vehicle.observations <- filtered[filtered$SCC %in% vehicle.sources,]

summed <- aggregate(Emissions~ year+fips, data=vehicle.observations, sum)
summed$fips.facet <- factor(summed$fips)

png(filename='plot6.png', width=480, height=480, units="px")
g <- ggplot(summed, aes(year, Emissions))
p <- g + geom_point() + facet_grid(.~fips.facet) + geom_smooth(method="lm")
print(p)
dev.off()
