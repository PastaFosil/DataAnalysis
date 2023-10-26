setwd('/home/juancho/Documents/DataAnalysis/Databases')

library(dplyr)

# ==================================================================
# NA.OMIT Y COMPLETE.CASES

head(airquality)

str(airquality) # object type and type of contained variables

dim(airquality) # dimensions

(bien <- complete.cases(airquality)) # rows with no na values (FALSE where there are)

sum(bien) # quantity of complete cases

airquality[bien,] # filtering rows without na's

data <- select(airquality, Ozone:Temp) # selecting variables from Ozone to Temp

apply(data, 2, mean) # column mean (using na elements)
apply(data, 2, mean, na.rm = T) # column mean (removing na elements)

(m1 <- apply(na.omit(data), 2, mean)) #column mean (removing whole cases with na's)
(b <- complete.cases(data))

(m2 <- apply(data[b,], 2, mean))

identical(m1, m2)

# ==================================================================
# CBIND Y RBIND

cbind(1:10, 11:20, 21:30) # combine by columns
cbind(1:10, matrix(11:30,ncol=2))
cbind(data.frame(x=1:10, y=11:20), z=21:30)

(df1 <- data.frame(x=1:5, y=6:10, z=16:20))
(df2 <- data.frame(x=51:55, y=101:105, z=151:155))

rbind(df1,df2) # combine by rows

# ==================================================================
# APPLY, LAPPLY Y DO.CALL
(X <- matrix(1:49, ncol=7))

apply(X, 1, mean) # row mean
apply(X, 2, median) #column median

setwd('/home/juancho/Documents/DataAnalysis/Databases/fulbo')

# links to databases
u1011 <- "https://www.football-data.co.uk/mmz4281/1011/SP1.csv"
u1112 <- "https://www.football-data.co.uk/mmz4281/1112/SP1.csv"
u1213 <- "https://www.football-data.co.uk/mmz4281/1213/SP1.csv"
u1314 <- "https://www.football-data.co.uk/mmz4281/1314/SP1.csv"

# downloading databases
download.file(url = u1011, destfile = "SP1-1011.csv", mode = "wb")
download.file(url = u1112, destfile = "SP1-1112.csv", mode = "wb")
download.file(url = u1213, destfile = "SP1-1213.csv", mode = "wb")
download.file(url = u1314, destfile = "SP1-1314.csv", mode = "wb")

# list contents of current directory
dir()

(lista <- lapply(dir(), read.csv)) # apply read.csv function to elements of dir and save results to a list

lista <- lapply(lista, select, Date:FTR) # select certain columns

data <- do.call(rbind, lista) # combine elements in lista to a single data frame
data
View(data)
