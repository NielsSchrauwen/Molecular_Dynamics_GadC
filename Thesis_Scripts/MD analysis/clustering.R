cutoff <- c(0.03, 0.05,0.07,0.08,0.09,0.1,0.11,0.12,0.13,0.14,0.15,0.17)
clusternumber <- c(100001,9983,611,171,66,32,18,9,9,6,4,3)
cutoff2 <- cutoff[3:12]
clusternumber2 <- clusternumber[3:12]
cutoff3 <-cutoff[6:12]
clusternumber3 <-clusternumber[6:12]

library(ggplot2)

ggplot()+ geom_line(aes(x=cutoff,y=clusternumber))+geom_point(aes(x=cutoff,y=clusternumber))+
  labs(x= "Cutoff value", y = "amount of clusters")+
  theme_bw()

ggplot()+ geom_line(aes(x=cutoff2,y=clusternumber2))+geom_point(aes(x=cutoff2,y=clusternumber2))+
  labs(x= element_blank(), y = element_blank())+
  theme_bw()

ggplot()+ geom_line(aes(x=cutoff3,y=clusternumber3))+geom_point(aes(x=cutoff3,y=clusternumber3))+
  labs(x= element_blank(), y = element_blank())+
  theme_bw()


WT <- read.table("D:/niels/Documents/thesis/December/Clustering/Data/WT_clust-id12.xvg", quote="\"")
mut01 <- read.table("D:/niels/Documents/thesis/December/Clustering/Data/mut01_clust-id12.xvg", quote="\"")
mut02 <- read.table("D:/niels/Documents/thesis/December/Clustering/Data/mut02_clust-id12.xvg", quote="\"")
mut03 <- read.table("D:/niels/Documents/thesis/December/Clustering/Data/mut03_clust-id12.xvg", quote="\"")
mut04 <- read.table("D:/niels/Documents/thesis/December/Clustering/Data/mut04_clust-id12.xvg", quote="\"")
mut05 <- read.table("D:/niels/Documents/thesis/December/Clustering/Data/mut05_clust-id12.xvg", quote="\"")
mut06 <- read.table("D:/niels/Documents/thesis/December/Clustering/Data/mut06_clust-id12.xvg", quote="\"")
mut07 <- read.table("D:/niels/Documents/thesis/December/Clustering/Data/mut07_clust-id12.xvg", quote="\"")
mut08 <- read.table("D:/niels/Documents/thesis/December/Clustering/Data/mut08_clust-id12.xvg", quote="\"")
mut09 <- read.table("D:/niels/Documents/thesis/December/Clustering/Data/mut09_clust-id12.xvg", quote="\"")
mut10 <- read.table("D:/niels/Documents/thesis/December/Clustering/Data/mut10_clust-id12.xvg", quote="\"")
mut11 <- read.table("D:/niels/Documents/thesis/December/Clustering/Data/mut11_clust-id12.xvg", quote="\"")
mut12 <- read.table("D:/niels/Documents/thesis/December/Clustering/Data/mut12_clust-id12.xvg", quote="\"")

mutants <- c("Ala372_Leu373del","Leu371Gln","Leu371Arg","Phe367Ser","Val208_Ser213delinsGly","Phe207_Ile211del",
             "Ala209Asp","Leu46Arg","Pro33Leu","Pro33His","Ala245_Ile246del","Ser249Ser250del")

plotclusters <- function(dfa, mutation){
  ggplot(dfa)+geom_point(mapping=aes(x=V1/1000,y=V2))+
    labs(x="time (ns)", y="Cluster Number", title = mutation)+theme_bw()+
    theme(plot.title = element_text(hjust=0.5,size=20),axis.title = element_text(size=20),
          axis.text = element_text(size=17))+scale_y_continuous(breaks=seq(0,length(dfa$V2),1))
}

plotclusters(WT,"Wild Type")
plotclusters(mut01,mutants[1])
plotclusters(mut02,mutants[2])
plotclusters(mut03,mutants[3])
plotclusters(mut04,mutants[4])
plotclusters(mut05,mutants[5])
plotclusters(mut06,mutants[6])
plotclusters(mut07,mutants[7])
plotclusters(mut08,mutants[8])
plotclusters(mut09,mutants[9])
plotclusters(mut10,mutants[10])
plotclusters(mut11,mutants[11])
plotclusters(mut12,mutants[12])

count_clusters <- function(column){
  uniquevalues <- unique(column)
  counts = rep(0,length(uniquevalues))
  for (x in column){
    for (i in (1:length(uniquevalues))){
      if (x == uniquevalues[i]){
        counts[i] <- counts[i]+1
      }
    }
  }
  df <- data.frame(uniquevalues,counts)
  df <- df[order(uniquevalues),]
}


WT_counts <- count_clusters(WT$V2)
mut01_counts <- count_clusters(mut01$V2)
mut02_counts <- count_clusters(mut02$V2)
mut03_counts <- count_clusters(mut03$V2)
mut04_counts <- count_clusters(mut04$V2)
mut05_counts <- count_clusters(mut05$V2)
mut06_counts <- count_clusters(mut06$V2)
mut07_counts <- count_clusters(mut07$V2)
mut08_counts <- count_clusters(mut08$V2)
mut09_counts <- count_clusters(mut09$V2)
mut10_counts <- count_clusters(mut10$V2)
mut11_counts <- count_clusters(mut11$V2)
mut12_counts <- count_clusters(mut12$V2)

counts_plot <- function(dfa,mutation){
  ggplot(dfa)+geom_point(mapping=aes(x=uniquevalues,y=counts))+geom_line(mapping=aes(x=uniquevalues,y=counts))+
    labs(x="cluster number", y="Amount of frames in cluster", title = mutation)+theme_bw()+
    theme(plot.title = element_text(hjust=0.5,size=20),axis.title = element_text(size=20),
          axis.text = element_text(size=17))+scale_x_continuous(breaks=seq(0,length(dfa$uniquevalues),1))
}
counts_plot(WT_counts,"Wild Type")
counts_plot(mut01_counts,mutants[1])
counts_plot(mut02_counts,mutants[2])
counts_plot(mut03_counts,mutants[3])
counts_plot(mut04_counts,mutants[4])
counts_plot(mut05_counts,mutants[5])
counts_plot(mut06_counts,mutants[6])
counts_plot(mut07_counts,mutants[7])
counts_plot(mut08_counts,mutants[8])
counts_plot(mut09_counts,mutants[9])
counts_plot(mut10_counts,mutants[10])
counts_plot(mut11_counts,mutants[11])
counts_plot(mut12_counts,mutants[12])


