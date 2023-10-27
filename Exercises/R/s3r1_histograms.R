setwd('/home/juancho/Documents/DataAnalysis')

library(dplyr)
library(ggplot2)

data <- read.csv('Databases/BD_Altura_Alunos.csv', sep=';')

head(data)

hist(data$Altura, 
     main='dplyr',
     xlab='Altura',
     ylab='Frecuencia')

data %>%
  ggplot() +
  aes(Altura) +
  geom_histogram(binwidth=4, col='black', fill='blue') +
  ggtitle('ggplot') +
  xlab('Altura') +
  ylab('Frecuencia')