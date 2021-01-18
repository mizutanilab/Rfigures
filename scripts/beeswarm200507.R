load("YOUR_DATA.RData")
library(beeswarm)

#multiple beeswarm plots
vx = c(cs9p$curv, cs11p$curv, cs6p$curv, cs15p$curv, cs16p$curv, cs17p$curv, cs4p$curv, cs18p$curv)
fx = factor(rep(c("S1","S2","S3","S4","N1","N2","N3","N4"), c( length(cs9p$curv),length(cs11p$curv),length(cs6p$curv),length(cs15p$curv),length(cs16p$curv),length(cs17p$curv),length(cs4p$curv),length(cs18p$curv) )))
windows(width = 15, height = 8)
par(mar=c(4, 9, 2, 2), mgp=c(5, 1.8, 0))
beeswarm(vx ~ fx, cex=0.5, method="center", pch=16, spacing=1, cex.axis=3, lwd=3, col=4, cex.lab=3, ylab=expression(paste("Curvature (", mu, m^{-1}, ")")), xlab="")
bxplot(vx ~ fx, add = TRUE, lwd = 3)

#output it as png
png("YOUR_FILE_NAME.png", width = 1500, height = 800, res=120)
par(mar=c(4, 9, 2, 2), mgp=c(5, 1.8, 0))
beeswarm(vx ~ fx, cex=0.5, method="center", pch=16, spacing=1, cex.axis=3, lwd=3, col=4, cex.lab=3, ylab=expression(paste("Curvature (", mu, m^{-1}, ")")), xlab="")
bxplot(vx ~ fx, add = TRUE, lwd = 3)
dev.off()

#manually add y-axis 
tx = c(cs9p$tors, cs11p$tors, cs6p$tors, cs15p$tors, cs16p$tors, cs17p$tors, cs4p$tors, cs18p$tors)
ylim=c(-2,3)
windows(width = 15, height = 8)
par(mar=c(4, 9, 2, 2), mgp=c(5, 1.8, 0))
beeswarm(tx ~ fx, cex=0.4, method="center", pch=16, spacing=1, cex.axis=3, lwd=3, col=4, cex.lab=3, ylab=expression(paste("Torsion (", mu, m^{-1}, ")")), xlab="", yaxt="n", ylim=ylim)
axis(2,at=pretty(ylim),labels=sprintf("%.1f",pretty(ylim)),lwd=3,cex.axis=2.6)
bxplot(tx ~ fx, add = TRUE, lwd = 3)
