################################
#Plot-6
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
plotDataBA <- subset(NEI, fips == "24510" & SCC %in% vehicle)
plotDataLA <- subset(NEI, fips == "06037" & SCC %in% vehicle)
plotDataBA$City <- with(plotDataBA, "Baltimore")
plotDataLA$City <- with(plotDataLA, "L.A.")
rowData <- rbind(plotDataBA, plotDataLA)
plotData <- with(rowData, tapply(Emissions, list(year,City), sum, na.rm = T))
pData <- stack(as.data.frame(plotData))
pData$x <- rep(rownames(plotData), ncol(plotData))
pData$City <- pData$ind
ggplot(pData, aes(x = x, y = values, fill = City)) + 
  geom_bar(stat = "identity") +
  xlab("Year") +
  ylab("Emission(tons)") +
  ggtitle("Total PM2.5 emission for motor vehicle in Baltimore and LA")
dev.copy(png, file="plot6.png", width=480, height=480, units="px")
dev.off()

