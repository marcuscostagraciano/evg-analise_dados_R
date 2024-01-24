# Vetores
?c

cidade <- c(
    "Brasília",
    "São Paulo",
    "Rio de Janeiro",
    "Porto Alegre"
)

cidade

temperatura <- c(32, 22, 35, 17)

regiao <- c(1, 2, 2, 3)

# Primeiro elemento
cidade[1]

# Intervalo de elementos
temperatura[1:3]

cidade2 <- cidade

# Todas as temperaturas MENOS a segunda
temperatura[-2]

# Alterando uma posição do vetor
cidade2[3] <- "Belo Horizonte"

# Adicionando um novo elemento ao vetor
cidade2[5] <- "Curitiba"

# Deletando o vetor
cidade2 <- NULL
rm(cidade2)

# Fatores
?factor

UF <- factor(c("DF", "SP", "RJ", "RS"))
UF

grau_instrucao <- factor(
  c("Nível Médio", "Superior", "Fundamental"),
  levels = c("Fundamental", "Nível Médio", "Superior"),
  ordered = TRUE
)
grau_instrucao

# Listas
?list

pessoa <- list(sexo = "M", cidade = cidade[1], idade = 20)
pessoa

pessoa[1]
pessoa[[1]]

pessoa[["idade"]] <- 23
pessoa

pessoa[["idade"]] <- NULL
pessoa

pessoa <- list(sexo = "M", cidade = cidade[1], idade = 20)

# Filtrando elementos da lista
pessoa[c("cidade", "idade")]

# Lista de listas
cidades <- list(
  cidade = cidade,
  temperatura = temperatura,
  regiao = regiao
)
cidades

# Dataframe com vetores
df <- data.frame(cidade, temperatura)
df

df2 <- data.frame(cidades)
df2

# Filtrando valores do df
# linha 1, coluna 2
df[1, 2]

# todas as linhas da primeira coluna
df[, 1]
# todas as colunas da primeira linha
df[1, ]

# 3 primeiras linhas, da coluna 1 e 3
df2[c(1:3), c(1, 3)]

# nomes das colunas
names(df)
# dimensões do df
dim(df)
# tipos dos dados
str(df)

# acessar uma coluna do df
df$cidade
df["cidade"]

# Matrizes
?matrix

m <- matrix(seq(1:9), nrow = 3)
m

m2 <- matrix(
  seq(1:25),
  ncol = 5,
  byrow = TRUE,
  dimnames = list(
    c(seq(1:5)),
    c("A", "B", "C", "D", "E")
  )
)
m2

m2[c(1:2), c("B", "C")]
