# join
install.packages("dplyr")
library(dplyr)

??dplyr

df1 <- data.frame(Produto = c(1,2,3,5), Preco = c(15,10,25,20))
head(df1)

df2 <- data.frame(Produto = c(1,2,3,4), Nome = c("A","B","C","D"))
head(df2)

df3 <- left_join(df1,df2,"Produto")
head(df3)


df4 <- right_join(df1,df2, "Produto")
head(df4)

df5 <- inner_join(df1, df2, "Produto")
head(df5)

