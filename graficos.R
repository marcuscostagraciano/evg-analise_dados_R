# dataset
?mtcars

# filtrando colunas do dataset
carros <- mtcars[,c(1,2,9)]

# visualizando o dataset
head(carros)

# histograma
hist(carros$mpg)

# gráfico de dispersão
plot(carros$mpg,carros$cyl)

install.packages("ggplot2")
library(ggplot2)

# criando gráfico de barras com ggplot2
ggplot(carros,aes(am))+
  geom_bar()
