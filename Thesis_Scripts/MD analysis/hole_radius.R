setwd("D:/niels/Documents/thesis/Channel_size")

radius_mut01 <- read.table("D:/niels/Documents/thesis/channel_size/mut01_snap_radius.dat", quote="\"")
radius_mut02 <- read.table("D:/niels/Documents/thesis/channel_size/mut02_snap_radius.dat", quote="\"")
radius_mut03 <- read.table("D:/niels/Documents/thesis/channel_size/mut03_snap_radius.dat", quote="\"")
radius_mut04 <- read.table("D:/niels/Documents/thesis/channel_size/mut04_snap_radius.dat", quote="\"")
radius_mut05 <- read.table("D:/niels/Documents/thesis/channel_size/mut05_snap_radius.dat", quote="\"")
radius_mut06 <- read.table("D:/niels/Documents/thesis/channel_size/mut06_snap_radius.dat", quote="\"")
radius_mut07 <- read.table("D:/niels/Documents/thesis/channel_size/mut07_snap_radius.dat", quote="\"")
radius_mut08 <- read.table("D:/niels/Documents/thesis/channel_size/mut08_snap_radius.dat", quote="\"")
radius_mut09 <- read.table("D:/niels/Documents/thesis/channel_size/mut09_snap_radius.dat", quote="\"")
radius_mut10 <- read.table("D:/niels/Documents/thesis/channel_size/mut10_snap_radius.dat", quote="\"")
radius_mut11 <- read.table("D:/niels/Documents/thesis/channel_size/mut11_snap_radius.dat", quote="\"")
radius_mut12 <- read.table("D:/niels/Documents/thesis/channel_size/mut12_snap_radius.dat", quote="\"")

plot_radius <- function(radius, mutant){
  colnames(radius) <- c("x", "y", "z", "radius", "closest_aa")
  timestep <- 10000
  radiustime <- c(timestep)
  for(i in 2:length(radius$z)){
    z1 <- radius$z[i-1]
    z2 <- radius$z[i]
    if((z1 - z2) > 10){
      timestep <- timestep + 900
    }
    radiustime <- c(radiustime, timestep)
  }
  radius$timestep <- radiustime 
  
  minimum <- min(radius$z)
  radius$z <- radius$z - minimum
  averagez <- unique(radius$z)
  averagez <- sort(averagez)
  averageradius <- rep(0,length(averagez))
  count <- rep(0,length(averagez))
  
  for(k in 1:length(radius$z)){
    for(l in 1:length(averagez)){
      if(radius$z[k] == averagez[l]){
        count[l] <- count[l]+1
        averageradius[l] <- averageradius[l] +radius$radius[k]
      }
    }
  }
  
  averagerad <- averageradius/count
  averagedata <- data.frame(averagez, count, averagerad)
  
  dev.new()
  plot(radius ~ z, type="l", data = subset(radius, timestep == 10000), col="grey", main = mutant, 
       xlab = "channel length (Angstrom)", xlim = c(0,70), ylab = "Radius (Angstrom)")
  for(j in seq(10900,100000, by=900)){
    lines(radius ~ z, type="l", data = subset(radius, timestep == j), col="grey")
  }
  lines(averagedata$averagerad ~averagedata$averagez, col = 'red')
  averagedata
}


WTtimestep <- 10000
WTradiustime <- c(WTtimestep)
for(i in 2:11390){
  z1 <- WTradius$z[i-1]
  z2 <- WTradius$z[i]
  if((z1 - z2) > 10){
    WTtimestep <- WTtimestep + 900
  }
  WTradiustime <- c(WTradiustime, WTtimestep)
}
WTradius$timestep <- WTradiustime 



WTminimum <- min(WTradius$z)
WTradius$z <- WTradius$z - WTminimum
WTaveragez <- unique(WTradius$z)
WTaveragez <- sort(WTaveragez)
WTaverageradius <- rep(0,length(WTaveragez))
WTcount <- rep(0,length(WTaveragez))

for(k in 1:length(WTradius$z)){
  for(l in 1:length(WTaveragez)){
    if(WTradius$z[k] == WTaveragez[l]){
      WTcount[l] <- WTcount[l]+1
      WTaverageradius[l] <- WTaverageradius[l] +WTradius$radius[k]
    }
  }
}


WTaveragerad <- WTaverageradius/WTcount
WTaveragedata <- data.frame(WTaveragez, WTcount, WTaveragerad)


lines(WTaveragedata$WTaveragerad ~WTaveragedata$WTaveragez, col = 'blue')

