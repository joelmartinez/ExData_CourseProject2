# 3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

source("loadData.R")

NEI$type.facet <- factor(NEI$type)
filtered <- NEI[NEI$fips == "24510",]

summed <- aggregate(Emissions~ year+type.facet, data=filtered, sum)

png(filename='plot3.png', width=480, height=480, units="px")
g <- ggplot(summed, aes(year, Emissions))
p <- g + geom_point() + facet_grid(.~type.facet) + geom_smooth(method="lm")
print(p)
dev.off()