library(tidyverse)
library(ggplot2)
library(ggpubr)

data <- read.csv("all_data.csv")
colnames(data) <- c("Time","AbsTime","Acc_X","Acc_Y","Acc_Z","Gyr_X","Gyr_Y","Gyr_Z",
                    "Mag_X","Mag_Y","Mag_Z","Fall_Ind")


data

Values <- c("zero", "non-zero")
acc_x <- c(length(data$Acc_X[data$Acc_X == 0]),length(data$Acc_X[data$Acc_X != 0]))
acc_y <- c(length(data$Acc_Y[data$Acc_Y == 0]),length(data$Acc_Y[data$Acc_Y != 0]))
acc_z <- c(length(data$Acc_Z[data$Acc_Z == 0]),length(data$Acc_Z[data$Acc_Z != 0]))

accelerometer <- data.frame(Values,acc_x,acc_y,acc_z)

accelerometer %>% gather(Axes, Count, c(2:4)) %>%
  ggplot(aes(x=Axes,y=Count,fill = Values))+
  geom_col(position="dodge", alpha=0.5)+
  scale_fill_manual(values = c("#00cc00","red" ))


ang_x <- c(length(data$Gyr_X[data$Gyr_X == 0]),length(data$Gyr_X[data$Gyr_X != 0]))
ang_y <- c(length(data$Gyr_Y[data$Gyr_Y == 0]),length(data$Gyr_Y[data$Gyr_Y != 0]))
ang_z <- c(length(data$Gyr_Z[data$Gyr_Z == 0]),length(data$Gyr_Z[data$Gyr_Z != 0]))

gyroscope <- data.frame(Values,ang_x,ang_y,ang_z)

gyroscope %>% gather(Axes, Count, c(2:4)) %>%
  ggplot(aes(x=Axes,y=Count,fill = Values))+
  geom_col(position="dodge", alpha=0.5)+
  scale_fill_manual(values = c("#00cc00","red" ))



mag_x <- c(length(data$Mag_X[data$Mag_X == 0]),length(data$Mag_X[data$Mag_X != 0]))
mag_y <- c(length(data$Mag_Y[data$Mag_Y == 0]),length(data$Mag_Y[data$Mag_Y != 0]))
mag_z <- c(length(data$Mag_Z[data$Mag_Z == 0]),length(data$Mag_Z[data$Mag_Z != 0]))

magnetometer <- data.frame(Values,mag_x,mag_y,mag_z)

magnetometer %>% gather(Axes, Count, c(2:4)) %>%
  ggplot(aes(x=Axes,y=Count,fill = Values))+
  geom_col(position="dodge", alpha=0.5)+
  scale_fill_manual(values = c("#00cc00","red" ))




