##Exploratory Data Analysis
##Week 4 Course Project
##Plot 3
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

##Question 3: For types of polution, which have increased and decreased in Baltimore City? 


##make a table of total emmissions: Year, Type, Total_Emissions for Baltimore

question3 <- NEI %>%
  filter(fips == 24510) %>%
  select(Emissions, year, type) %>%
  group_by(year, type) %>%
  summarize(Emissions = sum(Emissions))

##do it in qplot
##qplot(year, Emissions, data = question3, color = type)

##do it in ggplot2

g <- ggplot(question3, aes(year, Emissions, color = type))

chart <- g + geom_point() + geom_line() + labs(title = "Baltimore Emissions by Type")
print(chart)


##export to PNG and close graphics device
dev.copy(png, file = "Course_Project_Plot3.png")
dev.off()


