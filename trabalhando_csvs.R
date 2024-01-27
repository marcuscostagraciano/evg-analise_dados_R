## OBTENÇÃO DOS DADOS

?read.csv

# writeLines(iconv(readLines('./dados/2019_Viagem.csv'), from = "cp1252", to = "UTF-8"), 
#  file('./dados/2019_Viagem.csv', encoding = "UTF-8"))


viagens = read.csv(
  file = './dados/2019_Viagem.csv',
  sep = ';',
  dec = ',',
)

head(viagens)
View(viagens)

dim(viagens)

summary(viagens)
summary(viagens$Valor.passagens)

library('dplyr')

glimpse(viagens)


## TRANSFORMAÇÃO DOS DADOS

?as.Date
viagens$data.inicio <- as.Date(viagens$Período...Data.de.início, "%d/%m/%Y")
viagens$data.fim <- as.Date(viagens$Período...Data.de.fim, "%d/%m/%Y")

glimpse(viagens)

?format
viagens$data.inicio.formatada <- format(viagens$data.inicio, "%Y-%m")
viagens$data.fim.formatada <- format(viagens$data.fim, "%Y-%m")

glimpse(viagens)


## EXPLORAÇÃO DOS DADOS

hist(viagens$Valor.passagens)

summary(viagens$Valor.passagens)

boxplot(viagens$Valor.passagens)

# Desvio Padrão
sd(viagens$Valor.passagens)

?is.na
?colSums

is.na(viagens)
colSums(is.na(viagens))

str(viagens$Situação)

# tabela qtd de situações (ocorrências)
table(viagens$Situação)

# valor percentual de ocorrências
prop.table(table(viagens$Situação)) * 100


## VISUALIZAÇÃO DOS RESULTADOS
library('ggplot2')

# 1 - Valor gasto por órgão?
p1 <- viagens %>%
  group_by(Nome.do.órgão.superior) %>%
  summarise(n = sum(Valor.passagens)) %>%
  arrange(desc(n)) %>%
  top_n(15)
names(p1) <- c('orgao', 'valor')
p1

ggplot(p1, aes(x=reorder(orgao, valor), y = valor)) + 
  geom_bar(stat='identity') +
  coord_flip() +
  labs(x = "Órgão", y = "Valor")


# Valor gasto por cidade?
p2 <- viagens %>%
  group_by(Destinos) %>%
  summarise(n = sum(Valor.passagens)) %>%
  arrange(desc(n)) %>%
  top_n(15)
names(p2) <- c('destino', 'valor')
p2

ggplot(p2, aes(x=reorder(destino, valor), y = valor)) + 
  geom_bar(stat='identity', fill='#0ba791') +
  geom_text(aes(label=valor), vjust = 0.3, size = 3) +
  coord_flip() +
  labs(x = "Destino", y = "Valor")

# Quantidade de viagens por mês?
p3 <- viagens %>%
  group_by(data.inicio.formatada) %>%
  summarise(n = n_distinct(Identificador.do.processo.de.viagem))
names(p3) <- c('data', 'qtd')
head(p3)

ggplot(p3, aes(x = data, y = qtd, group = 1)) +
  geom_line() + 
  geom_point()
