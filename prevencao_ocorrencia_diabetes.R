if(!require('dplyr')) {
  install.packages('dplyr')
}
if(!require('caret')) {
  install.packages('caret')
}
if(!require('e1071')) {
  install.packages('e1071')
}
if(!require('caTools')) {
  install.packages('caTools')
}
library('caTools')
library('dplyr')
library('caret')
library('e1071')

diabetes <- read.csv(
  file = './dados/diabetes.csv'
)

head(diabetes)
str(diabetes)

diabetes$Outcome <- as.factor(diabetes$Outcome)

# Preparação
colSums(is.na(diabetes))

boxplot(diabetes)

# Análise exploratória
hist(diabetes$Pregnancies)
hist(diabetes$Age)
hist(diabetes$BMI)

diabetes2 <- diabetes %>%
  filter(Insulin <= 250)
boxplot(diabetes2$Insulin)
summary(diabetes2$Insulin)


## CONSTRUÇÃO MODELO PREDITIVO
set.seed(123)
index = sample.split(diabetes2$Pregnancies, SplitRatio = 2/3)

train = subset(diabetes2, index == TRUE)
test = subset(diabetes2, index == FALSE)

dim(diabetes2)
dim(train)
dim(test)


# Modelo 1
modelo <- train(
  Outcome ~., data = train, method = 'knn',
)

modelo$results
modelo$bestTune

# Modelo 2
modelo2 <- train(
  Outcome ~., data = train, method = 'knn',
  tuneGrid = expand.grid(k = c(1:20))
)

modelo2$results
modelo2$bestTune
plot(modelo2)

# Modelo 3
modelo3 <- train(
  Outcome ~., data = train, method = 'naive_bayes'
)

modelo3$results
modelo3$bestTune

# Modelo 4
set.seed(100)
modelo4 <- train(
  Outcome ~., data = train, method = 'svmRadialSigma',
  preProcess = c('center')
)

modelo4$results
modelo4$bestTune

?predict

predicoes <- predict(modelo4, test)
predicoes

confusionMatrix(predicoes, test$Outcome)

# Simulando dados de um novo paciente
novos.dados <- data.frame(
  Pregnancies = c(3),           
  Glucose = c(111.50),
  BloodPressure = c(70),
  SkinThickness = c(20),          
  Insulin = c(47.49),
  BMI = c(30.80),       
  DiabetesPedigreeFunction = c(0.34),
  Age = c(28)                     
)

novos.dados

previsao <- predict(modelo4, novos.dados)
resultado <- ifelse(previsao == 1, "Positivo", "Negativo")
print(paste("Resultado:", resultado))

write.csv(predicoes, 'resultados_predicao.csv')
