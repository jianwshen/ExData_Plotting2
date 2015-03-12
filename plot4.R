################################
#Plot-4
################################

library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
scc_coal <- unique(subset(SCC, EI.Sector %in% c(
"Fuel Comb - Electric Generation - Coal",
"Fuel Comb - Comm/Institutional - Coal",
"Fuel Comb - Industrial Boilers, ICEs - Coal"), c(SCC)))
coal <- as.character(scc_coal[,1])
rowData <- subset(NEI, SCC %in% coal)
plotData <- with(rowData, tapply(Emissions, year, sum, na.rm = T))
barplot(plotData, xlab="Year", ylab="Emission(tons)", main="Total PM2.5 emission for coal combustion in US")
dev.copy(png, file="plot4.png", width=480, height=480, units="px")
dev.off()

