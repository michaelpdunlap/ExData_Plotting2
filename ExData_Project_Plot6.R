##Exploratory Data Analysis
##Week 4 Course Project
##Plot 6
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

##Question 6: Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County? 


##make a table of total emmissions: Year, Mobile Sourced based emmissions

question6 <- left_join (NEI, SCC, by = c("SCC" = "SCC")) %>%
  filter(fips == "06037" | fips == "24510") %>%
  filter(SCC.Level.One == "Mobile Sources") %>%
  select(Emissions, year, fips) %>%
  group_by(year, fips) %>%
  summarize(Emissions = sum(Emissions))

##do it in qplot
##qplot(year, Emissions, data = question3, color = type)

##do it in ggplot2

g <- ggplot(question6, aes(year, Emissions, color = fips))

chart <- g + geom_point() + geom_line() + labs(title = 
                                                 "Motor Vehicle Emmisions:Baltimore (24510) vs LA (06037)")
print(chart)


##export to PNG and close graphics device
dev.copy(png, file = "Course_Project_Plot6.png")
dev.off()


