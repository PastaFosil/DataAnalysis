# 1. Simulacion de modelo arima: n = 1000 valores de un proceso ARIMA(1, 1, 1) con parámetros ar = 0.6 y ma = 0.2
x <- arima.sim(model = list(order = c(1, 1, 1), 
                            ar = 0.6, ma = 0.2), n = 1000)

plot(x, xlab = "", ylab = "")
title(main = "Modelo arima simulado",
      ylab = "Producción de electricidad (GWh)",
      xlab = "Tiempo")

# 2. Ajuste de modelo arima
fit <- arima(x, order = c(1, 1, 1))
coefficients(fit)
# 3. Correlograma de los residuales del ajuste
acf(resid(fit), main="")
title(main="Correlograma de los residuales del ajuste")

# 4. Prediccion del modelo ajustado
pred <- predict(fit, n.ahead=3)$pred

ts.plot(cbind(window(x, start=0),
              pred), col=c("blue", "red"), xlab="")
