

setwd("/mnt/data/Thesis_niels/data/GMX/")


RMSF_WT <- read.table("/mnt/data/Thesis_niels/data/GMX//RMSF/RMSF_WT.xvg", quote="\"", comment.char="@")
RMSF_mut01 <- read.table("/mnt/data/Thesis_niels/data/GMX//RMSF/RMSF_mut01.xvg", quote="\"", comment.char="@")
RMSF_mut02 <- read.table("/mnt/data/Thesis_niels/data/GMX//RMSF/RMSF_mut02.xvg", quote="\"", comment.char="@")
RMSF_mut03 <- read.table("/mnt/data/Thesis_niels/data/GMX//RMSF/RMSF_mut03.xvg", quote="\"", comment.char="@")
RMSF_mut04 <- read.table("/mnt/data/Thesis_niels/data/GMX//RMSF/RMSF_mut04.xvg", quote="\"", comment.char="@")
RMSF_mut05 <- read.table("/mnt/data/Thesis_niels/data/GMX//RMSF/RMSF_mut05.xvg", quote="\"", comment.char="@")
RMSF_mut06 <- read.table("/mnt/data/Thesis_niels/data/GMX//RMSF/RMSF_mut06.xvg", quote="\"", comment.char="@")
RMSF_mut07 <- read.table("/mnt/data/Thesis_niels/data/GMX//RMSF/RMSF_mut07.xvg", quote="\"", comment.char="@")
RMSF_mut08 <- read.table("/mnt/data/Thesis_niels/data/GMX//RMSF/RMSF_mut08.xvg", quote="\"", comment.char="@")
RMSF_mut09 <- read.table("/mnt/data/Thesis_niels/data/GMX//RMSF/RMSF_mut09.xvg", quote="\"", comment.char="@")
RMSF_mut10 <- read.table("/mnt/data/Thesis_niels/data/GMX//RMSF/RMSF_mut10.xvg", quote="\"", comment.char="@")
RMSF_mut11 <- read.table("/mnt/data/Thesis_niels/data/GMX//RMSF/RMSF_mut11.xvg", quote="\"", comment.char="@")
RMSF_mut12 <- read.table("/mnt/data/Thesis_niels/data/GMX//RMSF/RMSF_mut12.xvg", quote="\"", comment.char="@")




RMSF_mut01_y <- append(RMSF_mut01$V2, rep(0,6), after = 1113)
RMSF_mut05_y <- append(RMSF_mut05$V2, rep(0,15),after = 621)
RMSF_mut06_y <- append(RMSF_mut06$V2, rep(0,15), after = 618)
RMSF_mut11_y <- append(RMSF_mut11$V2, rep (0,6), after = 732)
RMSF_mut12_y <- append(RMSF_mut12$V2, rep(0, 6), after = 615)

RMSF_mut01_WT <- RMSF_mut01_y - RMSF_WT$V2
RMSF_mut02_WT <- RMSF_mut02$V2 - RMSF_WT$V2
RMSF_mut03_WT <- RMSF_mut03$V2 - RMSF_WT$V2
RMSF_mut04_WT <- RMSF_mut04$V2 - RMSF_WT$V2
RMSF_mut05_WT <- RMSF_mut05_y - RMSF_WT$V2
RMSF_mut06_WT <- RMSF_mut06_y - RMSF_WT$V2
RMSF_mut07_WT <- RMSF_mut07$V2 - RMSF_WT$V2
RMSF_mut08_WT <- RMSF_mut08$V2 - RMSF_WT$V2
RMSF_mut09_WT <- RMSF_mut09$V2 - RMSF_WT$V2
RMSF_mut10_WT <- RMSF_mut10$V2 - RMSF_WT$V2
RMSF_mut11_WT <- RMSF_mut11_y - RMSF_WT$V2
RMSF_mut12_WT <- RMSF_mut12_y - RMSF_WT$V2

RMSF_added <- RMSF_mut01_WT + RMSF_mut02_WT + RMSF_mut03_WT + RMSF_mut04_WT +RMSF_mut05_WT + RMSF_mut06_WT + RMSF_mut07_WT + RMSF_mut08_WT + RMSF_mut09_WT + RMSF_mut10_WT + RMSF_mut11_WT
RMSF_added <- RMSF_added / 12

x=(1:1533)
x = x/3



dev.new()

plot(x, RMSF_WT$V2, main = "RMS fluctuation", xlab = "residue", ylab = "RMSF (nm)", type = "l", lwd = 1, col = "black")
lines(x,RMSF_mut01_y, lwd = 1, col = "red")
lines(x, RMSF_mut02$V2, lwd = 1, col = "blue")
lines(x, RMSF_mut03$V2, lwd = 1, col = "chocolate")
lines(x, RMSF_mut04$V2, lwd = 1, col = "red")
lines(x, RMSF_mut05_y, lwd = 1, col = "red")
lines(x, RMSF_mut06_y, lwd = 1, col = "blue")
lines(x, RMSF_mut07$V2, lwd = 1, col = "chocolate")
lines(x, RMSF_mut08$V2, lwd = 1, col = "red")
lines(x, RMSF_mut09$V2, lwd = 1, col = "blue")
lines(x, RMSF_mut10$V2, lwd = 1, col = "chocolate")
lines(x, RMSF_mut11_y, lwd = 1, col = "blue")
lines(x, RMSF_mut12_y, lwd = 1, col = "chocolate")
lines(x, RMSF_WT$V2, col="black")
legend("top", legend = c("WT", "mut04", "mut11","mut12"), col = c("black", "red", " blue", "chocolate"), lty = rep(1, 4))


dev.new()

plot(x, RMSF_mut08_WT, main = "RMSF difference with WT", xlab = "residue", ylab = "RMSF difference (nm)", ylim = c(-0.25, 0.35), type = "l", lwd = 1, col = "red")
lines(x, RMSF_mut01_WT, lwd = 0.0001, col = "red")
lines(x, RMSF_mut02_WT, lwd = 1, col = "blue")
lines(x, RMSF_mut03_WT, lwd = 1, col = "chocolate")
lines(x, RMSF_mut04_WT, lwd = 1, col = "green")
lines(x, RMSF_mut05_WT, lwd = 1, col = "red")
lines(x, RMSF_mut06_WT, lwd = 1, col = "blue")
lines(x, RMSF_mut07_WT, lwd = 1, col = "chocolate")
lines(x, RMSF_mut08_WT, lwd = 1, col = "blue")
lines(x, RMSF_mut09_WT, lwd = 1, col = "blue")
lines(x, RMSF_mut10_WT, lwd = 1, col = "chocolate")
lines(x, RMSF_mut11_WT, lwd = 1, col = "blue")
lines(x, RMSF_mut12_WT, lwd = 1, col = "chocolate")

legend("top", legend = c("mut08", "mut09", "mut10"), col = c("red", "blue", "chocolate"), lty = rep(1, 3))

dev.new()

plot(x, RMSF_added, main = "RMSF difference of all mutants averaged", xlab = "residue", ylab = "RMSF difference (nm)", type = "l", lwd = 1, col = "red")

RMSF_added_dataframe <- data.frame(x, RMSF_added)
write.table(RMSF_added_dataframe, "RMSF_added_REAL.txt", row.names = FALSE, sep = "\t")

RMSF_mut05_df <- data.frame(x, RMSF_mut05_WT)
write.table(RMSF_mut05_df, "RMSF_mut05_tabd.txt", row.names = FALSE, sep = "\t")

RMSF_mut07_df <- data.frame(x, RMSF_mut07_WT)
write.table(RMSF_mut07_df, "RMSF_mut07_tabd.txt", row.names = FALSE, sep = "\t")

RMSF_mut10_df <- data.frame(x, RMSF_mut10_WT)
write.table(RMSF_mut10_df, "RMSF_mut10_tabd.txt", row.names = FALSE, sep = "\t")

RMSF_mut11_df <- data.frame(x, RMSF_mut11_WT)
write.table(RMSF_mut11_df, "RMSF_mut11_tabd.txt", row.names = FALSE, sep = "\t")
getwd()
