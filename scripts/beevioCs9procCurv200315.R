load("YOUR_DATA.RData")
library(ggplot2)

ux = c(c9ba22$curv, c9ba24$curv)
uy = factor(rep(c("BA22","BA24"), c(length(c9ba22$curv),length(c9ba24$curv))))
data <- data.frame(name=uy, value=ux)
col = factor(rep(c("magenta","blue"), c(length(na.omit(c9ba22$curv)),length(na.omit(c9ba24$curv)))))
ylim=c(0,2.5)
yscale=seq(0, 2.5, by = 0.5)
windowsFonts(FONT1 = windowsFont("Calibri"))

p <- ggplot(data, aes(x=name, y=value)) + coord_cartesian(ylim=ylim) +scale_y_continuous(yscale) + geom_dotplot(binaxis='y', stackdir='center', dotsize=1., binwidth=0.02, linetype=0, fill=col) + geom_violin(lwd=1.5,scale="width",draw_quantiles = c(0.25, 0.5, 0.75),fill=NA) + geom_violin(lwd=1.5,aes(color = name),scale="width",fill=NA)
p+scale_color_manual(values = c("magenta",4))+ theme(legend.position = 'none') + theme(panel.background = element_rect(colour = "black",size=3,fill="transparent"),panel.grid = element_blank(),axis.text.y = element_text(angle = 90, hjust = 0.5),axis.text=element_text(size=36,family="FONT1"),axis.ticks.x = element_blank(),axis.ticks.y = element_line(size=2),axis.ticks.length = unit(3, "mm"),axis.title = element_blank())

ggsave("beevioCs9procCurv200315.png", width = 6, height = 7.5)
