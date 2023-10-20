ran <- c(rnorm(44))

(y <- ran[1:15])
for (i in 1:15) {
  y[i] <- ran[i]**3 + 12
}

df.al <- data.frame(ran[1:15],y)