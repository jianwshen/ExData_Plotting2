################################
#Plot-5
################################

library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
scc_motor_vehicle <- unique(subset(SCC, EI.Sector %in% c(
"Mobile - On-Road Diesel Heavy Duty Vehicles",
"Mobile - On-Road Diesel Light Duty Vehicles",
"Mobile - On-Road non-Diesel Heavy Duty Vehicles",
"Mobile - On-Road non-Diesel Light Duty Vehicles")
, c(SCC)))
vehicle <- as.character(scc_motor_vehicle[,1])
plotData <- subset(NEI, fips == "24510" & SCC %in% vehicle)
rowData <- subset(NEI, SCC %in% vehicle)
plotData <- with(rowData, tapply(Emissions, year, sum, na.rm = T))
barplot(plotData, xlab="Year", ylab="Emission(tons)", main="Total PM2.5 emission for motor vehicle in Baltimore")
dev.copy(png, file="plot5.png", width=480, height=480, units="px")
dev.off()
