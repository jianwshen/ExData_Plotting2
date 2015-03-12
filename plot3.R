################################
#Plot-3
################################

library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
rowData <- subset(NEI, fips == "24510")
plotData <- with(rowData, tapply(Emissions, list(year, type), sum, na.rm = T))
pData <- stack(as.data.frame(plotData))
pData$x <- rep(rownames(plotData), ncol(plotData))
pData$Type <- pData$ind
qplot(x, values, data = pData, group = Type, colour = Type, 
	geom = c("line","point"),
	xlab="Year", 
	ylab="Emission(tons)", 
	main="PM2.5 emission in Baltimore by type"
)
dev.copy(png, file="plot3.png", width=480, height=480, units="px")
dev.off()

