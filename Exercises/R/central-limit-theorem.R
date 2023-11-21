# NORMAL DISTRIBUTION

x <- seq(-4, 4, 0.01)*6 + 175
y <- dnorm(x, mean=175, sd=6)

plot(x, y, type='l', xlab="", ylab="")
title(main='Densidad de probabilidad normal', sub=expression(paste(mu==175, " y ", sigma==6)))
abline(v=175, lwd=2, lty=2)

pnorm(q=90, mean=75, sd=10) # probability of getting a value below 90 in a distribution with those properties



# STUDENT T DISTRIBUTION

x <- seq(-4,4,0.01)
y <- dt(x, df=7) # df == freedom degrees

plot(x,y, type='l', main='Densidad t de Student, gl=7', xlab="", ylab="")
abline(v=0, lwd=2, lty=2)

qt(0.10, df=5, lower.tail=FALSE) # x tal que P(X>x)=0.10


# CENTRAL LIMIT THEOREM

muestra <- c(1.82165160, 1.06824486, 0.38492498, 0.52779737, # sample taken from a right-skewed population 
             0.17989299, 0.38599556, 0.01565589, 0.53166559, 1.08000160, 0.61289266, 0.16050136, 0.35143952, 0.41076615, 1.09468497, 0.53319069, 1.09299258, 0.61343642, 0.15565428, 1.44299912, 0.43475144, 0.60773249, 3.09911364, 0.36185393, 1.00729974, 0.30582083, 0.35948934, 0.20484999, 0.13779880, 0.28064973, 2.03910927, 0.19785169, 0.46706578, 0.30224129)
data <- as.data.frame(muestra)

library(ggplot2)

ggplot(data, aes(muestra)) +
  geom_histogram(colour='red', fill='pink', alpha=0.7, bins=7) +
  ggtitle('Histograma para la muestra de tamano 33') +
  labs(x='valores', y='frecuencia') +
  theme_get() +
  theme(plot.title=element_text(hjust=0.5,size=16))


# HYPOTHESIS PROOF

# Upper tail testing
# Testing the hypotheses H0: mu=0.1 vs Ha: mu>0.1, random sample size n=40
muestra <- c(0.191825830, 0.090832594, 0.078292920, 0.023187365, 0.275329543, 0.120594281, 0.011730131, 0.727012539, 0.108018454, 0.004800318, 0.070778142, 0.539517386, 0.165975518, 0.136258035, 0.216427932, 0.002537893, 0.563361006, 0.027473375, 0.380678788, 0.310481407, 0.142732480, 0.836212104, 0.149678939, 0.288385634, 0.535300943, 0.491167954, 0.429518316, 0.043545325, 0.443696671, 0.078943105, 0.205748181, 0.167813525, 0.017052988, 0.082652468, 0.125213495, 0.166680130, 0.128717925, 0.003860131, 0.045212421, 0.086816614)

# test statistic value:
(z0 <- (mean(muestra)-0.1)/(sd(muestra)/sqrt(40)))
# looking for the rejection region with significance alpha=0.05 (upper tail, value z0.05 such that P(Z<-z0.05))
(z.05 <- qnorm(p=0.05, lower.tail=FALSE)) # since z0>z.05, we reject H0

x <- seq(-4,4,0.01)
y <- dnorm(x)

plot(x,y,type='l', xlab="", ylab="")
title(main="Densidad normal estandar", sub=expression(paste(mu == 0, " y ", sigma == 1)))
polygon(c(z.05, x[x>=z.05], max(x)), c(0, y[x>=z.05], 0), col="red")
axis(side = 1, at = z.05, font = 2, padj = 1, lwd = 2)
text(2.5, 0.1, labels = expression(alpha == 0.05), col = "red")

# Getting the p-value
(pvalue <- pnorm(z0, lower.tail=FALSE))
# Usually, we reject H0 based on the p-value: p-value<0.05 or 0.01 == reject H0


# Lower tail testing
# Testing H0: p=0.9 vs H1: p<0.9, n=45 (p == probability of success in 0 or 1 outcome experiment)
muestra <- c(0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0,
             1, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0)
(z0 <- (mean(muestra)-0.9)/sqrt((0.9*(1-0.9))/45))
 # Find rejection region with alpha=0.05
(z.05 <- qnorm(p=0.05)) #z0<z.05 => H0 rejected

x <- seq(-4, 4, 0.01)
y <- dnorm(x)
plot(x, y, type = "l", xlab="", ylab="")
title(main = "Densidad normal estándar", sub = expression(paste(mu == 0, " y ", sigma == 1)))
polygon(c(min(x), x[x<=z.05], z.05), c(0, y[x<=z.05], 0), col="red")
axis(side = 1, at = z.05, font = 2, padj = 1, lwd = 2)
text(-3, 0.05, labels = expression(alpha == 0.05), col = "red")

# p-value
(pvalue <- pnorm(z0))
