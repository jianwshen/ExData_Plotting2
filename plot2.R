################################
#Plot-2
################################

NEI <- readRDS("summarySCC_PM25.rds")
subData <- subset(NEI, fips == "24510")
emissions <- with(subData, tapply(Emissions, year, sum, na.rm = T))
barplot(emissions, xlab="Year", ylab="Emission(tons)", main="Total PM2.5 emission in Baltimore")
dev.copy(png, file="plot2.png", width=480, height=480, units="px")
dev.off()

