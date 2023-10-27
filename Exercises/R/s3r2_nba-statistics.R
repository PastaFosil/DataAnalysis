setwd('/home/juancho/Documents/DataAnalysis')

library(dplyr)
library(ggplot2)

data <- read.csv('Databases/players_stats.csv')

names(data)

data <- na.omit(data)

data %>%
  ggplot() +
  aes(MIN) +
  geom_histogram(binwidth=100, col='black', fill='blue') +
  geom_vline(xintercept=mean(data$MIN), col='red') +
  ggtitle('Minutos totales') +
  xlab('Minutos') +
  ylab('Frecuencia')

data %>%
  ggplot() +
  aes(Age) +
  geom_histogram(binwidth=2, col='black', fill='blue') +
  geom_vline(xintercept=mean(data$Age), col='red') +
  ggtitle('Histograma de edad') +
  xlab('Edad') +
  ylab('Frecuencia')

(scattery <- ggplot(data, aes(x=Weight, y=Height/100)) + 
    geom_point() +
    labs(title='Weight vs Height', x='Weight', y='Height') +
    geom_smooth(method='lm', se=T))

n.max <- which.max(data$Height)
paste('El jugador mas alto es ', data$Name[n.max], ', con una altura de ', data$Height[n.max]/100, ' m.', sep='')

n.min <- which.min(data$Height)
paste('El jugador mas bajito es ', data$Name[n.min], ', con una altura de ', data$Height[n.min]/100, ' m.', sep='')

mean.height <- mean(data$Height)/100
paste('La altura promedio es de', mean.height, 'm.')

ggplot(data, aes(x=AST.TOV, y=PTS)) +
  geom_point() +
  labs(title='Asistencias vs. puntos', x='Asistencias', y='Puntos') +
  facet_wrap('Pos')