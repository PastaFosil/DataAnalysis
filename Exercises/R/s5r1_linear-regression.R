library(dplyr)
library(ggplot2)

setwd('/home/juancho/Documents/DataAnalysis')

data <- read.csv('Databases/advertisement.csv')
attach(data)

tail(data, 2)

pairs(~ Sales + TV + Radio + Newspaper)

m1 <- lm(Sales ~ TV + Radio + Newspaper)

summary(m1)

m2 <- update(m1, ~. - Newspaper)
summary(m2)

anova(m1, m2) # comparing H0 (newspaper publicity matters) vs H1 (newspaper publicity doesn't matter)
# since p-value is ~0.95, we reject H0

plot(m2$fitted.values, Sales, xlab="Valores ajustados", ylab="Sales")
abline(lsfit(m2$fitted.values, Sales))

pairs(~ TV + Radio, data=data)

StanRes <- rstandard(m2)
par(mfrow=c(2,2))
plot(TV, StanRes, ylab="Residuales estandarizados")
plot(Radio, StanRes, ylab="Residuales estandarizados")

qqnorm(StanRes)
qqline(StanRes)

# the model seems to be correct

shapiro.test(StanRes)
