## This first line will likely take a few seconds. Be patient!
if (!exists("NEI")) {
	NEI <- readRDS("summarySCC_PM25.rds")
}
if (!exists("SCC")) {
	SCC <- readRDS("Source_Classification_Code.rds")
}
if (!("ggplot2" %in% installed.packages())) {
	install.packages("ggplot2")
}
library(ggplot2)