# 5. How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

source("loadData.R")

# first get the codes for vehicle-related classifications
fscc <- SCC[grepl("vehicle", as.character(SCC$SCC.Level.Two), ignore.case=T),]
vehicle.sources <- as.character(fscc$SCC)
filtered <- NEI[NEI$fips == "24510",]
vehicle.observations <- filtered[filtered$SCC %in% vehicle.sources,]

summed <- aggregate(Emissions~ year+type, data=vehicle.observations, sum)

png(filename='plot5.png', width=480, height=480, units="px")
g <- ggplot(summed, aes(year, Emissions))
p <- g + geom_point() + geom_smooth(method="lm")
print(p)
dev.off()
