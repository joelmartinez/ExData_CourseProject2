# 	4.	Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008? 
source("loadData.R")

# first get the codes for coal-related classifications
fscc <- SCC[grepl("coal", as.character(SCC$SCC.Level.Three), ignore.case=T),]
coal.sources <- as.character(fscc$SCC)
coal.observations <- NEI[NEI$SCC %in% coal.sources,]

summed <- aggregate(Emissions~ year+type, data=coal.observations, sum)

png(filename='plot4.png', width=480, height=480, units="px")
g <- ggplot(summed, aes(year, Emissions))
p <- g + geom_point() + geom_smooth(method="lm")
print(p)
dev.off()

