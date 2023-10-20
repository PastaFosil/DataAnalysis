setwd('/home/juancho/Documents/DataAnalysis/Exercises/R')

amazon.best <- read.csv('../../Databases/amazon_bestsellers.csv')
View(amazon.best)

tAmazon <- as.data.frame(t(amazon.best))
View(tAmazon)

names(tAmazon) <- amazon.best$Name

min.price <- min(c(1,2,3))
max.price <- max(amazon.best$Price)
