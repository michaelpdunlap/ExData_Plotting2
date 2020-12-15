##Exploratory Data Analysis
##Week 4 Course Project
##Plot 5
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

##Question 5: How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City? 


##make a table of total emmissions

question5 <- left_join (NEI, SCC, by = c("SCC" = "SCC")) %>%
  filter(fips == 24510) %>%
  filter(SCC.Level.One == "Mobile Sources") %>%
  select(Emissions, year) %>%
  group_by(year) %>%
  summarize(Emissions = sum(Emissions))

##do it in qplot
##qplot(year, Emissions, data = question3, color = type)

##do it in ggplot2

g <- ggplot(question5, aes(year, Emissions))

chart <- g + geom_point() + geom_line() + labs(title = "Motor Vehicle Emmissions in Baltimore")
print(chart)


##export to PNG and close graphics device
dev.copy(png, file = "Course_Project_Plot5.png")
dev.off()


