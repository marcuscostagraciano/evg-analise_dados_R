
# nome_func <- function(arg)
par_impar <- function(num){
  if((num %% 2) == 0){
    return("Par")
  }else
    return("Ímpar")
}

#Usando a função
num = 3
par_impar(num)

# função apply()
?apply

x <- seq(1:9)
x

matriz <- matrix(x, ncol = 3)
matriz

result1 <- apply(matriz, 1, sum)
result1

result2 <- apply(matriz, 2, sum)
result2


?list

numeros.p <- c(2,4,6,8,10,12)
numeros.i <- c(1,3,5,7,9,11)
numeros <- list(numeros.p,numeros.i)

numeros


?lapply
lapply(numeros, mean)


?sapply
sapply(numeros, mean)
