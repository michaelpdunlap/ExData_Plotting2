##Exploratory Data Analysis
##Week 4 Course Project
##Plot 2
##By Mike Dunlap

##Load Libraries
library(dplyr)

##Download Data
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
temp <- tempfile()
download.file(fileURL, temp, method="curl")
unzip(temp)

##upload data to session
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Question 2: Have total emissions from PM2.5 decreased in the Baltimore City, Maryland decreased from 1999 to 2008? 


##make a table of total emmissions: Year, Total_Emissions

question2 <- NEI %>%
  filter(fips == 24510) %>%
  select(Emissions, year) %>%
  group_by(year) %>%
  summarize(Emmissions = sum(Emissions))

with(question2, plot(year, Emmissions, main = "Exploratory Data Analysis Plot 2", pch = 3, col = "red"))

##export to PNG and close graphics device
dev.copy(png, file = "Course_Project_Plot2.png")
dev.off()


