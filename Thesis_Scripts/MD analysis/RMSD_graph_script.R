setwd("/mnt/data/Thesis_niels/data/GMX/")

RMSD_WT <- read.table("D:/niels/Documents/thesis/December/RMSD/RMSD/RMSD_WT.xvg", quote="\"", comment.char="@")
RMSD_mut01 <- read.table("D:/niels/Documents/thesis/December/RMSD/RMSD/RMSD_mut01.xvg", quote="\"", comment.char="@")
RMSD_mut02 <- read.table("D:/niels/Documents/thesis/December/RMSD/RMSD/RMSD_mut02.xvg", quote="\"", comment.char="@")
RMSD_mut03 <- read.table("D:/niels/Documents/thesis/December/RMSD/RMSD/RMSD_mut03.xvg", quote="\"", comment.char="@")
RMSD_mut04 <- read.table("D:/niels/Documents/thesis/December/RMSD/RMSD/RMSD_mut04.xvg", quote="\"", comment.char="@")
RMSD_mut05 <- read.table("D:/niels/Documents/thesis/December/RMSD/RMSD/RMSD_mut05.xvg", quote="\"", comment.char="@")
RMSD_mut06 <- read.table("D:/niels/Documents/thesis/December/RMSD/RMSD/RMSD_mut06.xvg", quote="\"", comment.char="@")
RMSD_mut07 <- read.table("D:/niels/Documents/thesis/December/RMSD/RMSD/RMSD_mut07.xvg", quote="\"", comment.char="@")
RMSD_mut08 <- read.table("D:/niels/Documents/thesis/December/RMSD/RMSD/RMSD_mut08.xvg", quote="\"", comment.char="@")
RMSD_mut09 <- read.table("D:/niels/Documents/thesis/December/RMSD/RMSD/RMSD_mut09.xvg", quote="\"", comment.char="@")
RMSD_mut10 <- read.table("D:/niels/Documents/thesis/December/RMSD/RMSD/RMSD_mut10.xvg", quote="\"", comment.char="@")
RMSD_mut11 <- read.table("D:/niels/Documents/thesis/December/RMSD/RMSD/RMSD_mut11.xvg", quote="\"", comment.char="@")
RMSD_mut12 <- read.table("D:/niels/Documents/thesis/December/RMSD/RMSD/RMSD_mut12.xvg", quote="\"", comment.char="@")

colnames(RMSD) <- c("time (ps)", "RMSD (nm)")
plot(RMSD$'time (ps)', RMSD$'RMSD (nm)', main = "mut12", xlab = "time (ps)", ylab = "RMSD(nm)", type ="l", 
     lwd = 1)
library(ggplot2)

plotrmsd <- function(dfa, mutation){
  ggplot(dfa)+geom_line(mapping=aes(x=V1 / 1000,y=V2))+
    labs(x="time (ns)", y="RMSD (nm)", title = mutation)+theme_bw()+
    theme(plot.title = element_text(hjust=0.5,size=20),axis.title = element_text(size=20),
          axis.text = element_text(size=17))+xlim(0, 110)+ylim(0, 0.35)
}
plotrmsd(RMSD_WT, "wild type")
plotrmsd(RMSD_mut01,"Ala372_Leu373del")
plotrmsd(RMSD_mut02,"Leu371Gln")
plotrmsd(RMSD_mut03,"Leu371Arg")
plotrmsd(RMSD_mut04,"Phe367Ser")
plotrmsd(RMSD_mut05,"Val208_Ser213delinsGly")
plotrmsd(RMSD_mut06,"Phe207_Ile211del")
plotrmsd(RMSD_mut07,"Ala209Asp")
plotrmsd(RMSD_mut08,"Leu46Arg")
plotrmsd(RMSD_mut09,"Pro33Leu")
plotrmsd(RMSD_mut10,"Pro33His")
plotrmsd(RMSD_mut11,"Ala245_Ile246del")
plotrmsd(RMSD_mut12,"Ser249_Ser250del")

