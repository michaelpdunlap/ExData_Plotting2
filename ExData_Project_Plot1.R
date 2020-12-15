##Exploratory Data Analysis
##Week 4 Course Project
##Plot 1
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

##Question 1: have total emissions decreased in the USA from 1999 to 2008?

##make a table of total emmissions: Year, Total_Emissions

question1 <- NEI %>%
  select(Emissions, year) %>%
  group_by(year) %>%
  summarize(Emmissions = sum(Emissions))

with(question1, plot(year, Emmissions, main = "Exploratory Data Analysis Plot 1", pch = 3, col = "red"))

##export to PNG and close graphics device
dev.copy(png, file = "Course_Project_Plot1.png")
dev.off()


