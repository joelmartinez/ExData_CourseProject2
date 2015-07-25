# utility code to initialize the data on my system.
# you'll want to change your working directory and 
# the `method` for download.file if you're not on mac
# if you want to use this on your system.
setwd("~/dev/datascience/exdata2")

if (!file.exists("data.zip")) {
	data.url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
	download.file(data.url, "data.zip", "curl")
	unzip("data.zip")
}

