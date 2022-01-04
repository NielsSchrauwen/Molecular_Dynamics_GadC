RMSF_WT <- read.table("D:/niels/Documents/thesis/December/RMSF/RMSF/RMSF_WT.xvg", quote="\"", comment.char="@")
RMSF_mut01 <- read.table("D:/niels/Documents/thesis/December/RMSF/RMSF/RMSF_mut01.xvg", quote="\"", comment.char="@")
RMSF_mut02 <- read.table("D:/niels/Documents/thesis/December/RMSF/RMSF/RMSF_mut02.xvg", quote="\"", comment.char="@")
RMSF_mut03 <- read.table("D:/niels/Documents/thesis/December/RMSF/RMSF/RMSF_mut03.xvg", quote="\"", comment.char="@")
RMSF_mut04 <- read.table("D:/niels/Documents/thesis/December/RMSF/RMSF/RMSF_mut04.xvg", quote="\"", comment.char="@")
RMSF_mut05 <- read.table("D:/niels/Documents/thesis/December/RMSF/RMSF/RMSF_mut05.xvg", quote="\"", comment.char="@")
RMSF_mut06 <- read.table("D:/niels/Documents/thesis/December/RMSF/RMSF/RMSF_mut06.xvg", quote="\"", comment.char="@")
RMSF_mut07 <- read.table("D:/niels/Documents/thesis/December/RMSF/RMSF/RMSF_mut07.xvg", quote="\"", comment.char="@")
RMSF_mut08 <- read.table("D:/niels/Documents/thesis/December/RMSF/RMSF/RMSF_mut08.xvg", quote="\"", comment.char="@")
RMSF_mut09 <- read.table("D:/niels/Documents/thesis/December/RMSF/RMSF/RMSF_mut09.xvg", quote="\"", comment.char="@")
RMSF_mut10 <- read.table("D:/niels/Documents/thesis/December/RMSF/RMSF/RMSF_mut10.xvg", quote="\"", comment.char="@")
RMSF_mut11 <- read.table("D:/niels/Documents/thesis/December/RMSF/RMSF/RMSF_mut11.xvg", quote="\"", comment.char="@")
RMSF_mut12 <- read.table("D:/niels/Documents/thesis/December/RMSF/RMSF/RMSF_mut12.xvg", quote="\"", comment.char="@")

library(RColorBrewer)
library(ggplot2)

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

aa=(1:1533)
aa= aa/3
aa=rep(aa,12)
mutants <- c("Ala372_Leu373del","Leu371Gln","Leu371Arg","Phe367Ser","Val208_Ser213delinsGly","Phe207_Ile211del",
          "Ala209Asp","Leu46Arg","Pro33Leu","Pro33His","Ala245_Ile246del","Ser249Ser250del")
mutants <- rep(mutants,each=1533)
RMSF <- c(RMSF_mut01_WT,RMSF_mut02_WT,RMSF_mut03_WT,RMSF_mut04_WT,RMSF_mut05_WT,
        RMSF_mut06_WT,RMSF_mut07_WT,RMSF_mut08_WT,RMSF_mut09_WT,RMSF_mut10_WT,RMSF_mut11_WT,RMSF_mut12_WT)


differences<-data.frame(aa,mutants,RMSF)
dataset1<- differences[1:6132,]
dataset2<- differences[6133:10731,]
dataset3 <- differences[10732:15330,]
datset4 <- differences[15331:18396,]

bb=(1:1533)
bb=bb/3


ggplot()+geom_line(aes(x=bb,y=RMSF_WT$V2))+
  labs(x="residues", y="RMSF wild type (nm)")+theme_bw()+
  ylim(0,0.5)+
  annotate(geom="vline",x=c(372.7,371,367,210.5,209,46,33,246,250,180,483,490),xintercept=c(372.7,371,367,210.5,209,46,33,246,250,180,483,490),linetype="dashed")+
  annotate("rect",xmin=15,xmax=65,ymin=-Inf,ymax=Inf,fill="blue",alpha=.1)+
  annotate("rect",xmin=203,xmax=257,ymin=-Inf,ymax=Inf,fill="blue",alpha=.1)+
  annotate("rect",xmin=477,xmax=511,ymin=-Inf,ymax=Inf,fill="yellow",alpha=.1)+
  annotate("text",x=40,y=0.5,label="TM1-2")+
  annotate("text",x=230,y=0.5,label="TM6-7")+
  annotate("text",x=495,y=0.5,label="C-plug")

ggplot(dataset1)+geom_line(aes(x=aa,y=RMSF,group=mutants,color=mutants))+
  labs(x="residues", y="RMSF difference with wild type (nm)")+theme_bw()+
  theme(legend.position = c(0.5,0.95),legend.direction = "horizontal",legend.title = element_blank())+
  ylim(-0.2,0.2)+scale_color_brewer(palette = "Paired" )+
  annotate(geom="vline",x=c(367.3,371.3,372.3,373.3),xintercept=c(367.3,371.3,372.3,373.3),linetype="dashed")+
  annotate("rect",xmin=15,xmax=65,ymin=-Inf,ymax=Inf,fill="blue",alpha=.1)+
  annotate("rect",xmin=203,xmax=257,ymin=-Inf,ymax=Inf,fill="blue",alpha=.1)+
  annotate("rect",xmin=477,xmax=511,ymin=-Inf,ymax=Inf,fill="yellow",alpha=.1)+
  annotate("text",x=40,y=0.15,label="TM1-2")+
  annotate("text",x=230,y=0.15,label="TM6-7")+
  annotate("text",x=495,y=0.15,label="C-plug")


ggplot(dataset2)+geom_line(aes(x=aa,y=RMSF,group=mutants,color=mutants))+
  labs(x="residues", y="RMSF difference with wild type (nm)")+theme_bw()+
  theme(legend.position = c(0.5,0.95),legend.direction = "horizontal",legend.title = element_blank())+
  ylim(-0.2,0.2)+scale_color_brewer(palette = "Paired" )+
  annotate(geom="vline",x=c(207.3,213.3),xintercept=c(207.3,213.3),linetype="dashed")+
  annotate("rect",xmin=15,xmax=65,ymin=-Inf,ymax=Inf,fill="blue",alpha=.1)+
  annotate("rect",xmin=203,xmax=257,ymin=-Inf,ymax=Inf,fill="blue",alpha=.1)+
  annotate("rect",xmin=477,xmax=511,ymin=-Inf,ymax=Inf,fill="yellow",alpha=.1)+
  annotate("text",x=40,y=0.15,label="TM1-2")+
  annotate("text",x=230,y=0.15,label="TM6-7")+
  annotate("text",x=495,y=0.15,label="C-plug")

ggplot(dataset3)+geom_line(aes(x=aa,y=RMSF,group=mutants,color=mutants))+
  labs(x="residues", y="RMSF differenc with wild type (nm)")+theme_bw()+
  theme(legend.position = c(0.5,0.95),legend.direction = "horizontal",legend.title = element_blank())+
  ylim(-0.2,0.2)+scale_color_brewer(palette = "Paired" )+
  annotate(geom="vline",x=c(33,46),xintercept=c(33,46),linetype="dashed")+
  annotate("rect",xmin=15,xmax=65,ymin=-Inf,ymax=Inf,fill="blue",alpha=.1)+
  annotate("rect",xmin=203,xmax=257,ymin=-Inf,ymax=Inf,fill="blue",alpha=.1)+
  annotate("rect",xmin=477,xmax=511,ymin=-Inf,ymax=Inf,fill="yellow",alpha=.1)+
  annotate("text",x=40,y=0.15,label="TM1-2")+
  annotate("text",x=230,y=0.15,label="TM6-7")+
  annotate("text",x=495,y=0.15,label="C-plug")

ggplot(datset4)+geom_line(aes(x=aa,y=RMSF,group=mutants,color=mutants))+
  labs(x="residues", y="RMSF difference with wild type (nm)")+theme_bw()+
  theme(legend.position = c(0.5,0.95),legend.direction = "horizontal",legend.title = element_blank())+
  ylim(-0.2,0.2)+scale_color_brewer(palette = "Paired" )+
  annotate(geom="vline",x=c(246,250),xintercept=c(246,250),linetype="dashed")+
  annotate("rect",xmin=15,xmax=65,ymin=-Inf,ymax=Inf,fill="blue",alpha=.1)+
  annotate("rect",xmin=203,xmax=257,ymin=-Inf,ymax=Inf,fill="blue",alpha=.1)+
  annotate("rect",xmin=477,xmax=511,ymin=-Inf,ymax=Inf,fill="yellow",alpha=.1)+
  annotate("text",x=40,y=0.15,label="TM1-2")+
  annotate("text",x=230,y=0.15,label="TM6-7")+
  annotate("text",x=495,y=0.15,label="C-plug")

