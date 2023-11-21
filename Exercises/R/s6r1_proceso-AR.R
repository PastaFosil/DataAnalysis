# 1. Simulacion de proceso AR(1) de la forma x[t] = 0.5 * x[t-1] + w[t]

set.seed(1)
x <- w <- rnorm(200)

for (t in 2:200) x[t] = 0.5 * x[t-1] + w[t]

plot(x, type = "l", xlab = "", ylab = "")
title(main = "Proceso AR(1) simulado",
      xlab = "Tiempo",
      ylab = expression(x[t]),
      sub = expression(x[t]==0.5*x[t-1]+w[t]))

# 2. Obtener correlograma y correlograma parcial
acf(x, main = "")
title(main = "Correlograma del proceso AR(1) simulado", 
      sub = expression(x[t]==0.5*x[t-1]+w[t]))
pacf(x, main = "")
title(main = "Correlograma Parcial del proceso AR(1) simulado", 
      sub = expression(x[t]==0.5*x[t-1]+w[t]))

# 3. Ajuste
x.ar <- ar(x, method = "mle")
x.ar$order
x.ar$ar
x.ar$ar + c(-2, 2)*sqrt(x.ar$asy.var)
