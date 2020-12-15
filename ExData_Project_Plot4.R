##Exploratory Data Analysis
##Week 4 Course Project
##Plot 4
##By Mike Dunlap

##Load Libraries
library(dplyr)
library(ggplot2)

##Download Data
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
temp <- tempfile()
download.file(fileURL, temp, method="curl")
unzip(temp)

##upload data to session
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Question 4: Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008? 


##make a table of total emmissions

question4 <- left_join (NEI, SCC, by = c("SCC" = "SCC")) %>%
  filter(EI.Sector == "Fuel Comb - Electric Generation - Coal") %>%
  select(Emissions, year) %>%
  group_by(year) %>%
  summarize(Emissions = sum(Emissions))

##do it in qplot
##qplot(year, Emissions, data = question3, color = type)

##do it in ggplot2

g <- ggplot(question4, aes(year, Emissions))

chart <- g + geom_point() + geom_line() + labs(title = "Coal Emissions Across the US")
print(chart)


##export to PNG and close graphics device
dev.copy(png, file = "Course_Project_Plot4.png")
dev.off()


