setwd('/home/juancho/Documents/DataAnalysis')

library(dplyr)

soccer <- read.csv("Databases/soccer.csv")
soccer <- mutate(soccer, date = as.Date(date, "%Y-%m-%d"))

View(soccer)
# 1. Crea un data frame para el Barcelona que indique el número de goles anotados en cada fecha que ha jugado.
home <- soccer[soccer$home.team=="Barcelona", c("date", "home.score")]
away <- soccer[soccer$away.team=="Barcelona", c("date", "away.score")]

barca <- data.frame(date=c(home$date, away$date),
                    score=c(home$home.score, away$away.score))

# 2. Obtén un data frame que indique el promedio de goles anotados en cada mes que ha jugado
barca <- mutate(barca, Ym=format(date, "%Y-%m"))

barca <- barca %>% group_by(Ym) %>% summarise(goles = mean(score))

# 3. Crea una serie de tiempo mensual para el número promedio de goles anotados por el Barcelona
(barca.monthly <- ts(barca$goles, start = c(1, 1), end = c(3, 5), # Hasta diciembre de 2019
             frequency = 10))

ts.plot(barca.monthly, col="blue", xlab="")

# 4. Realiza los pasos 1 a 3 para el Real Madrid
home <- soccer[soccer$home.team=="Real Madrid", c("date", "home.score")]
away <- soccer[soccer$away.team=="Real Madrid", c("date", "away.score")]

real <- data.frame(date=c(home$date, away$date),
                    score=c(home$home.score, away$away.score))

real <- mutate(real, Ym=format(date, "%Y-%m"))

real <- real %>% group_by(Ym) %>% summarise(goles = mean(score))

(real.monthly <- ts(real$goles, start = c(1, 1), end = c(3, 5), # Hasta diciembre de 2019
                     frequency = 10))

ts.plot(real.monthly, col="blue", xlab="")




ts.plot(cbind(barca.monthly, real.monthly), col = c(2, 4), ylim = c(0, 5))
abline(h = mean(barca.monthly), lwd = 2, col = 2, lty = 2)
abline(h = mean(real.monthly), lwd = 2, col = 4, lty = 2)
legend(x = 2, y = 5,
       legend = c("Barcelona", "Real Madrid"),
       col = c(2, 4), lty = c(1, 1))
