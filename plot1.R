################################
#Plot-1
################################

NEI <- readRDS("summarySCC_PM25.rds")
emissions <- with(NEI, tapply(Emissions, year, sum, na.rm = T))
barplot(emissions, xlab="Year", ylab="Emission(tons)", main="Total PM2.5 emission in US")
dev.copy(png, file="plot1.png", width=480, height=480, units="px")
dev.off()

