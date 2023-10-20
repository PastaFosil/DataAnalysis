getwd()
setwd('/home/juancho/Documents/DataAnalysis/Exercises/R')

netflix.titles <- read.csv('../../Databases/netflix_titles.csv')

dim(netflix.titles)
typeof(netflix.titles)

net.after2015 <- netflix.titles[netflix.titles$release_year>2015,]
View(net.after2015)

net.2015 <- data.frame(net.after2015$title)
colnames(net.2015) <- 'titles'
View(net.2015)

write.csv(net.2015,file='titles.csv')
