install.packages("DescTools")
library(DescTools)

set.seed(134)

x <- round(rnorm(1000, 175, 6), 1)

(mdn <- median(x))

median.func <- function(data) {
  len <- length(data)
  data <- sort(data)
  if (len%%2==0) {
    return ((data[len/2] + data[len/2+1])/2)
  } else {
    return (data[ceiling(len/2)])
  }
}x <- round(rnorm(1000, 175, 6), 1)
View(x)
median.func(x)

(y <- c(6,1,3,2,5,4))
sort(y)

median.func(y)
