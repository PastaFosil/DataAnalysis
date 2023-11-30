setwd('/home/juancho/Documents/DataAnalysis')

library(dplyr)
install.packages("lubridate")
library(lubridate)

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
weeks_between_dates <- function(date1, date2) {
  days_between <- as.numeric(difftime(date1, date2, units = "days"))
  weeks_between <- ceiling(days_between / 7)
  return(weeks_between+1)
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
get.best.arima <- function(x.ts, maxord = c(1, 1, 1, 1, 1, 1)){
  best.aic <- 1e8
  n <- length(x.ts)
  for(p in 0:maxord[1])for(d in 0:maxord[2])for(q in 0:maxord[3])
    for(P in 0:maxord[4])for(D in 0:maxord[5])for(Q in 0:maxord[6])
    {
      tryCatch({
        fit <- arima(x.ts, order = c(p, d, q),
                     seas = list(order = c(P, D, Q),
                                 frequency(x.ts)), method = "CSS")
        fit.aic <- -2*fit$loglik + (log(n) + 1)*length(fit$coef)
        
        #acf(resid(fit), main = "")
        #title(main = "Correlograma de los residuales del ajuste")
        
        
        #pr <- predict(fit, 12)$pred 
        #ts.plot(cbind(window(metro.month.ts, start = 2021),
        #              pr), col = c("blue", "red"), xlab = "")
        #title(main = "Predicción para la serie de afluencia del metro",
        #      xlab = "Mes",
        #      ylab = "Afluencia (M)")
        
        if(fit.aic < best.aic){
          best.aic <- fit.aic
          best.fit <- fit
          best.model <- c(p, d, q, P, D, Q)
        }
      },
      error=function(e) {
        NULL
      })
    }
  list(best.aic, best.fit, best.model)
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
df <- read.csv("Proyecto/metro.csv")

metro <- df[,c("fecha", "afluencia")]

metro <- mutate(metro, fecha = as.Date(fecha, "%Y-%m-%d"))

metro <- metro %>% 
  group_by(fecha) %>% summarise(afluencia = sum(afluencia))

metro$afluencia <- metro$afluencia/1e6

metro <- mutate(metro, Ym=format(fecha, "%Y-%m"))

View(metro)

metro.month <- metro %>% group_by(Ym) %>% summarise(afluencia = sum(afluencia))

View(metro.month)

metro.month.ts <- ts(metro.month$afluencia, start = 2021, freq = 12)

best.arima.metro <- get.best.arima(metro.month.ts,
               maxord = c(2, 2, 2, 2, 2, 2))

best.fit.metro <- best.arima.metro[[2]]  # Modelo
best.arima.metro[[3]] # Tipo de modelo (órdenes)
best.fit.metro
best.arima.metro[[1]] # AIC


acf(resid(best.fit.metro), main = "")
title(main = "Correlograma de los residuales del ajuste")


pr <- predict(best.fit.metro, 12)$pred 
ts.plot(cbind(window(metro.month.ts, start = 2021),
              pr), col = c("blue", "red"), xlab = "")
title(main = "Predicción para la serie de afluencia del metro",
      xlab = "Mes",
      ylab = "Afluencia (M)")

metro.decom.A <- decompose(metro.month.ts)
plot(metro.decom.A, xlab = "Tiempo", 
     sub = "Descomposición de los datos de producción de electricidad")

metro.decom.M <- decompose(metro.month.ts, type = "mult")
plot(metro.decom.M, xlab = "Tiempo", 
     sub = "Descomposición de los datos de producción de electricidad")