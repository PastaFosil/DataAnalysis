setwd('/home/juancho/Documents/DataAnalysis')

library(ggplot2)

names(mtcars)

ggplot(mtcars, aes(x=cyl, y=hp, colour=mpg)) + 
  geom_point() # geometry type

ggplot(mtcars, aes(x=cyl, y=hp, colour=mpg)) +
  geom_point() +
  theme_gray() + # theme
  facet_wrap("cyl") + # divides it by number of cylinders
  xlab('No. de cilindros') + # axis name
  ylab('Caballos de fuerza')

library(dplyr)
data <- read.csv('Databases/boxp.csv')

head(data)
names(data)

data3 <- mutate(data, Mediciones=Mediciones/1.23)
head(data3)

# HISTOGRAMS

# dplyr
hist(data$Mediciones, breaks=(seq(0,300,20)),
  main='Histograma de mediciones',
  xlab='Mediciones',
  ylab='Frecuencia')

# ggplot
data <- na.omit(data) # avoid warnings with rows with na's

data %>%
  ggplot() +
  aes(Mediciones) +
  geom_histogram(binwidth=10)

data %>%
  ggplot() +
  aes(Mediciones) +
  geom_histogram(binwidth=10, col='black', fill='blue') +
  ggtitle('Histograma de Mediciones') +
  ylab('Frecuencia') +
  xlab('Mediciones') +
  theme_light()


# SCATTER

(myscatplot <- ggplot(mtcars, aes(x=wt, y=mpg)) +
    geom_point()) # scatterplot

(myscatplot <- ggplot(mtcars, aes(x=wt, y=mpg)) +
    geom_point() +
    geom_smooth(method='lm', se=T)) # adds a trend line (method) and a shaded area with standard error (se)

myscatplot + xlab('Weight (x1000lbs)') + ylab('Miles per Gallon') # object stored in myscatplot and characteristics can be added with +

(my_scatplot <- ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) + geom_point())
my_scatplot + labs(x = 'Weight (x1000lbs)', y = 'Miles per Gallon', colour = 'Number of\n Cylinders') # adds colouring

myscatplot + facet_wrap('cyl') # divide by number of cylinders

myscatplot + facet_grid(am~cyl) # divide by number of cylinders and transmission (0=automatic, 1=manual)


# BOXPLOTS Y OUTLIERS

data <- read.csv('Databases/boxp.csv')
summary(data)
data <- na.omit(data)

head(data)
names(data)

data <- mutate(data, Categoria=factor(Categoria), Grupo=factor(Grupo))
str(data)

ggplot(data, aes(x=Categoria, y=Mediciones, fill=Grupo)) + # data divided by group
  geom_boxplot() +
  scale_fill_discrete(name='Dos Gps', labels=c('G1', 'G2')) + # legend title and group names
  ggtitle('Boxplots') +
  xlab('Categorias') +
  ylab('Mediciones')


# DIVERSE GRAPHS

install.packages('scales')
library(scales)

