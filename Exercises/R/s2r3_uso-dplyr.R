setwd('/home/juancho/Documents/DataAnalysis/Databases/fulbo/reto')

url1718 <- "https://www.football-data.co.uk/mmz4281/1718/D1.csv"
url1819 <- "https://www.football-data.co.uk/mmz4281/1819/D1.csv"
url1920 <- "https://www.football-data.co.uk/mmz4281/1920/D1.csv"
url2021 <- "https://www.football-data.co.uk/mmz4281/2021/D1.csv"

download.file(url = url1718, destfile = "bundes1718.csv", mode = "wb")
download.file(url = url1819, destfile = "bundes1819.csv", mode = "wb")
download.file(url = url1920, destfile = "bundes1920.csv", mode = "wb")
download.file(url = url2021, destfile = "bundes2021.csv", mode = "wb")

dir()

lista <- lapply(dir(), read.csv) # read files
lista <- lapply(lista, select, Date:FTR) # select columns
View(data.frame(lista[1]))

common_cols <- Reduce(intersect, lapply(lista, colnames)) # get list of common columns
lista_common <- lapply(lista, function(x) x[,common_cols]) # build list of data frames with only common columns

data <- do.call(rbind, lista_common) # combine data frames

View(data)