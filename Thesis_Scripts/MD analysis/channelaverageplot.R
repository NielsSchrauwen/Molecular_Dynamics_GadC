WT <- read.delim("D:/niels/Documents/thesis/December/Channel/Channel_averages/WT_channel_averages.txt", header=FALSE, comment.char="#")
mut01 <- read.delim("D:/niels/Documents/thesis/December/Channel/Channel_averages/mut01_channel_averages.txt", header=FALSE, comment.char="#")
mut02 <- read.delim("D:/niels/Documents/thesis/December/Channel/Channel_averages/mut02_channel_averages.txt", header=FALSE, comment.char="#")
mut03 <- read.delim("D:/niels/Documents/thesis/December/Channel/Channel_averages/mut03_channel_averages.txt", header=FALSE, comment.char="#")
mut04 <- read.delim("D:/niels/Documents/thesis/December/Channel/Channel_averages/mut04_channel_averages.txt", header=FALSE, comment.char="#")
mut05 <- read.delim("D:/niels/Documents/thesis/December/Channel/Channel_averages/mut05_channel_averages.txt", header=FALSE, comment.char="#")
mut06 <- read.delim("D:/niels/Documents/thesis/December/Channel/Channel_averages/mut06_channel_averages.txt", header=FALSE, comment.char="#")
mut07 <- read.delim("D:/niels/Documents/thesis/December/Channel/Channel_averages/mut07_channel_averages.txt", header=FALSE, comment.char="#")
mut08 <- read.delim("D:/niels/Documents/thesis/December/Channel/Channel_averages/mut08_channel_averages.txt", header=FALSE, comment.char="#")
mut09 <- read.delim("D:/niels/Documents/thesis/December/Channel/Channel_averages/mut09_channel_averages.txt", header=FALSE, comment.char="#")
mut10 <- read.delim("D:/niels/Documents/thesis/December/Channel/Channel_averages/mut10_channel_averages.txt", header=FALSE, comment.char="#")
mut11 <- read.delim("D:/niels/Documents/thesis/December/Channel/Channel_averages/mut11_channel_averages.txt", header=FALSE, comment.char="#")
mut12 <- read.delim("D:/niels/Documents/thesis/December/Channel/Channel_averages/mut12_channel_averages.txt", header=FALSE, comment.char="#")

mut03_aligned <-read.delim("D:/niels/Documents/thesis/December/Channel/Channel_averages/mut03_aligned_WT_channel_averages.txt", header=FALSE, comment.char="#")
mut03_control <- read.delim("D:/niels/Documents/thesis/December/Channel/Channel_averages/mut03_control_averages.txt", header=FALSE, comment.char="#")

mut05$V1 <- mut05$V1 + 15;
mut07$V1 <- mut07$V1 + 15;
mut10$V1 <- mut10$V1 + 15;
mut11$V1 <- mut11$V1 + 15;

mut05 <- mut05[-c(1:11),]
mut07 <- mut07[-c(1:13),]
mut10 <- mut10[-c(1:16),]
mut11 <- mut11[-c(1:16),]

mut06$V1 <- -mut06$V1
mut06$V1 <- mut06$V1 + 113

alldata <- c(WT,mut01,mut02,mut03,mut04,mut05,mut06,mut07,mut08,mut09,mut10,mut11,mut12,mut03_aligned,mut03_control)

library(tidyr)
library(ggplot2)
z <- c(WT$V1, mut01$V1,mut02$V1,mut03$V1,mut04$V1,mut05$V1,mut06$V1,mut07$V1,mut08$V1,mut09$V1,mut10$V1,mut11$V1,mut12$V1,
       mut03_aligned$V1,mut03_control$V1)
mean <- c(WT$V2, mut01$V2,mut02$V2,mut03$V2,mut04$V2,mut05$V2,mut06$V2,mut07$V2,mut08$V2,mut09$V2,mut10$V2,mut11$V2,mut12$V2,
          mut03_aligned$V2,mut03_control$V2)
sd <- c(WT$V3, mut01$V3,mut02$V3,mut03$V3,mut04$V3,mut05$V3,mut06$V3,mut07$V3,mut08$V3,mut09$V3,mut10$V3,mut11$V3,mut12$V3,
        mut03_aligned$V3,mut03_control$V3)
mutations <- c("Wild Type","Ala372_Leu373del","Leu371Gln","Leu371Arg","Phe367Ser","Val208_Ser213delinsGly","Phe207_Ile211del",
              "Ala209Asp","Leu46Arg","Pro33Leu","Pro33His","Ala245_Ile246del","Ser249Ser250del","Leu371Arg aligned","Leu371Arg control")
mutation <- c()

for (i in 1:15) {
  reps <- rep(mutations[i],length(alldata[i*3-2]$V1))
  mutation <- c(mutation,reps)
}

df <- data.frame(z,mean,sd,mutation)

dfwt <- df[which(mutation == "Wild Type"),]

df0203 <- df[which(mutation == "Wild Type"| mutation == "Leu371Gln"|mutation == "Leu371Arg"),]
df0104 <- df[which(mutation == "Wild Type"| mutation == "Ala372_Leu373del"|mutation == "Phe367Ser"),]
df0506 <- df[which(mutation == "Wild Type"| mutation == "Val208_Ser213delinsGly"|mutation == "Phe207_Ile211del"),]
df0708 <- df[which(mutation == "Wild Type"| mutation == "Ala209Asp"|mutation == "Leu46Arg"),]
df0910 <- df[which(mutation == "Wild Type"| mutation == "Pro33Leu"|mutation == "Pro33His"),]
df1112 <- df[which(mutation == "Wild Type"| mutation == "Ala245_Ile246del"|mutation == "Ser249Ser250del"),]


df01 <- df[which(mutation == "Wild Type"| df$mutation == "Ala372_Leu373del"),]
df0102 <- df[which(mutation == "Wild Type"| df$mutation == "Ala372_Leu373del"|df$mutation == "Leu371Gln"),]
df010203 <- df[which(mutation == "Wild Type"| df$mutation == "Ala372_Leu373del"|df$mutation == "Leu371Gln"|
                   df$mutation == "Leu371Arg"),]
df02 <- df[which(mutation=="Wild Type"|mutation=="Leu371Gln"),]
df03 <- df[which(mutation=="Wild Type"|mutation=="Leu371Arg"),]
df04 <- df[which(mutation=="Wild Type"|mutation=="Phe367Ser"),]
df05 <- df[which(mutation=="Wild Type"|mutation=="Val208_Ser213delinsGly"),]
df06 <- df[which(mutation=="Wild Type"|mutation=="Phe207_Ile211del"),]
df07 <- df[which(mutation=="Wild Type"|mutation=="Ala209Asp"),]
df08 <- df[which(mutation=="Wild Type"|mutation=="Leu46Arg"),]
df09 <- df[which(mutation=="Wild Type"|mutation=="Pro33Leu"),]
df10 <- df[which(mutation=="Wild Type"|mutation=="Pro33His"),]
df11 <- df[which(mutation=="Wild Type"|mutation=="Ala245_Ile246del"),]
df12 <- df[which(mutation=="Wild Type"|mutation=="Ser249Ser250del"),]

dfa03 <- df[which(mutation=="Wild Type"|mutation=="Leu371Arg"|mutation=="Leu371Arg aligned"),]
df03control <- df[which(mutation=="Wild Type"|mutation=="Leu371Arg"|mutation=="Leu371Arg control"),]

mycols <- c("#1B9E77","#D95F02","#7570B3")

plotchannel <- function(datafr){
  ggplot(datafr)+ geom_line(mapping =aes(x=z, y = mean, group=mutation,color=mutation)) +
    labs(x= "Z-coordinate (Angstrom)", y = "Channel Radius (Angstrom)")+
    theme_bw()+theme(plot.title=element_text(hjust=0.5),legend.position = c(0.5,0.9),
                     legend.direction = "horizontal",legend.title = element_blank())+ 
    geom_ribbon(aes(x = z, ymin=mean - sd,ymax=mean + sd,group=mutation,fill=mutation),alpha=.2)+
    scale_color_manual(values = mycols )+scale_fill_manual(values=mycols)+
    ylim(-0.1,6.5)+xlim(17,90)
}
plotchannel(dfwt)
plotchannel(df01)
plotchannel(df02)
plotchannel(df03)
plotchannel(df04)
plotchannel(df05)
plotchannel(df06)
plotchannel(df07)
plotchannel(df08)
plotchannel(df09)
plotchannel(df10)
plotchannel(df11)
plotchannel(df12)

plotchannel(df0102)
plotchannel(df010203)

plotchannel(df0104)
plotchannel(df0203)
plotchannel(df0506)
plotchannel(df0708)
plotchannel(df0910)
plotchannel(df1112)

plotchannel(dfa03)
plotchannel(df03control)




WT_cluster1 <- read.delim("D:/niels/Documents/thesis/December/Channel/Channel_averages/WT_cluster_40channelres/WT_cluster1_averages.txt", header=FALSE, comment.char="#")
WT_cluster2 <- read.delim("D:/niels/Documents/thesis/December/Channel/Channel_averages/WT_cluster_40channelres/WT_cluster2_averages.txt", header=FALSE, comment.char="#")
WT_cluster3 <- read.delim("D:/niels/Documents/thesis/December/Channel/Channel_averages/WT_cluster_40channelres/WT_cluster3_averages.txt", header=FALSE, comment.char="#")
WT_cluster4 <- read.delim("D:/niels/Documents/thesis/December/Channel/Channel_averages/WT_cluster_40channelres/WT_cluster4_averages.txt", header=FALSE, comment.char="#")

alldata_cluster <- c(WT_cluster1, WT_cluster2, WT_cluster3,WT_cluster4)

z_clusters <- c(WT_cluster1$V1,WT_cluster2$V1,WT_cluster3$V1,WT_cluster4$V1)
mean_clusters <- c(WT_cluster1$V2,WT_cluster2$V2,WT_cluster3$V2,WT_cluster4$V2)
sd_clusters <- c(WT_cluster1$V3,WT_cluster2$V3,WT_cluster3$V3,WT_cluster4$V3)
clusters <- c("cluster 1 (7317)","cluster 2 (2428)","cluster 3 (186)", "cluster 4 (46)")
cluster <- c()

for (i in 1:4) {
  reps <- rep(clusters[i],length(alldata_cluster[i*3-2]$V1))
  cluster <- c(cluster,reps)
}

cluster_df <- data.frame(z_clusters,mean_clusters,sd_clusters,cluster)
clustercols <- c("#EEE1B3","#56666B","#2F394D","#38182F")

plotclusterchannel <- function(datafr){
  ggplot(datafr)+ geom_line(mapping =aes(x=z_clusters, y = mean_clusters, group=cluster,color=cluster)) +
    labs(x= "Z-coordinate (Angstrom)", y = "Channel Radius (Angstrom)", title = "Clustered WT GadC channel size (mean + sd)")+
    theme_bw()+theme(plot.title=element_text(hjust=0.5),legend.position = c(0.5,0.9),
                     legend.direction = "horizontal",legend.title = element_blank())+ 
    geom_ribbon(aes(x = z_clusters, ymin=mean_clusters - sd_clusters,ymax=mean_clusters
                    + sd_clusters,group=cluster,fill=cluster),alpha=.2)
}

plotclusterchannel(cluster_df)

WT_cluster4_all <-  read.delim("D:/niels/Documents/thesis/December/Channel/Channel_averages/WT_cluster_40channelres/WT_cluster4_output.txt", header=FALSE, comment.char="#")
WT_cluster3_all <-  read.delim("D:/niels/Documents/thesis/December/Channel/Channel_averages/WT_cluster_40channelres/WT_cluster3_output.txt", header=FALSE, comment.char="#")
WT_cluster2_all <-  read.delim("D:/niels/Documents/thesis/December/Channel/Channel_averages/WT_cluster_40channelres/WT_cluster2_output.txt", header=FALSE, comment.char="#")
WT_cluster1_all <-  read.delim("D:/niels/Documents/thesis/December/Channel/Channel_averages/WT_cluster_40channelres/WT_cluster1_output.txt", header=FALSE, comment.char="#")

ggplot(WT_cluster4_all)+geom_line(mapping=aes(x=V1,y=V2,group=V3))
ggplot(WT_cluster3_all)+geom_line(mapping=aes(x=V1,y=V2,group=V3))
ggplot(WT_cluster2_all)+geom_line(mapping=aes(x=V1,y=V2,group=V3))
