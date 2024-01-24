install.packages("dplyr")
install.packages("tidyr")
library("dplyr")
library("tidyr")

df = data.frame(
  Produto = c("Produto A", "Produto B", "Produto C"),
  ano_2015 = c(10, 12, 20),
  ano_2016 = c(20, 25, 35),
  ano_2017 = c(15, 20, 30)
  )
head(df)

# Utilizando a função gather para mudar o formato da tabela
?gather

df2 <- gather(df, "Ano", "Quantidade", 2:4)
head(df2)

?separate

# Criando uma nova coluna para separar os dados
df3 <- separate(df2, Ano, c("ano_", "Ano"))
df3

# Removendo a coluna 
df3 <- df3[-2]
df3

# Acrescentando uma coluna Mês
df3$Mes <- c('01','02','03')

df3

#Fazendo a união da coluna Ano e Mês
?unite

#Criando a coluna Data para receber Mês e Ano - separado por /
df4 <- df3 %>%
  unite(Data, Mes, Ano, sep = '/')

head(df4)
