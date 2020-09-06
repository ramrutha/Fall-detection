library(tidyverse)
library(ggplot2)
library(ggpubr)

#data <- read.csv("F_04835861-01-2013-10-16-13-19-35.csv")
data <- read.csv("F_67458491-01-2013-11-07-12-36-22.csv")
colnames(data) <- c("Time","AbsTime","Acc_X","Acc_Y","Acc_Z","Gyr_X","Gyr_Y","Gyr_Z",
                    "Mag_X","Mag_Y","Mag_Z","Fall_Ind")

index <- as.numeric(rownames(data[data$Fall_Ind > 0,]))
data_to_plot<-data[seq(index-80,index+80),] 
data_to_plot$Index <- seq(1,nrow(data_to_plot))
toplot<-data_to_plot%>% select(Index,Acc_X,Acc_Y,Acc_Z) %>% gather("Axes","Acceleration",2:4)

ggplot(toplot, aes(x=Index,y=Acceleration,color=Axes))+
  geom_line(size = 0.5, alpha = 0.8)+
  #scale_color_manual(values=c("#1f78b4","#ff83c1","#33a02c"))+
  geom_vline(
    xintercept = 81 ,
    linetype = "dotted",
    color = "black",
    size = 1,
    alpha = 0.9
  )+
  geom_label(
    aes(
      x = 78,
      y = -23,
      label = "Fall event"
    ),
    color = "darkgrey",
    fill = "white",
    size = 4.0
  )
  
