install.packages("DescTools")
library(DescTools)

set.seed(134)

x <- round(rnorm(1000, 175, 6), 1)

mn <- mean(x)

(mdn <- median(x))

md <- Mode(x)

deciles <- seq(0,100, 10)/100
for (i in 0:10) {
  deciles[i] <- quantile(x, deciles[i])
}
print(deciles)

(iqr <- IQR(x)) # interquartile range

(std_dv <- sd(x)) # standard deviation

(vrnc <- var(x)) # variance
