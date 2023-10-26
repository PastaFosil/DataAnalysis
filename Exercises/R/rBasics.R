print('Hola R')

10000000

??mean
?mean

# vector (solo un tipo de dato)
x <- c(1,2,3,4)

# lista (no solo un tipo de dato) (indice empieza en 1)
y <- list(1, 2, 'a', 'casa', c(1,2,3))
y[1]

# matriz
z <- matrix(1:9, byrow=TRUE, nrow=3)
z[2,] #toda la fila 2
z[,1] #toda la columna 1
z[2,3]

install.packages("ggplot2")

library(ggplot2)

# funcion
saludo <- function(nombre) {
  mensaje <- paste("Hola", nombre)
  return(mensaje)
}
saludo("Juan")

operacion.personalizada <- function(a, b, c) {
  res <- a*(a + b)*4 + 2*a
  res <- res*2 + c/2
  return(res*3)
}

operacion.personalizada(1,2,3)
