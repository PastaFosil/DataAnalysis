'''
A company that manufactures and bottles apple juice uses a machine that 
automatically fills 16-ounce bottles. However, there is variation in the 
amounts of liquid put into the bottles that are filled. It has been observed 
that the amount of liquid is normally distributed approximately with a mean of 
16 ounces and a standard deviation of 1 ounce.

Determine the proportion of bottles that will be larger than 18 ounces.
'''

x <- seq(-4, 4, 0.01)*1 + 16
y <- dnorm(x, mean=16, sd=1)

plot(x, y, type='l', xlab="", ylab="")
title(main='Densidad de probabilidad normal', sub=expression(paste(mu==16, " y ", sigma==1)))
polygon(c(x[x>18], max(x)), c(0, y[x>18]), col="red")
abline(v=16, lwd=2, lty=2)

(P <- 1 - pnorm(q=18, mean=16, sd=1)) # probability of getting a value over 18 in a distribution with those properties
