# install.packages("rattle") # ejecutar los install 1 vez
# install.packages("rpart") 
# install.packages("RColorBrewer")

## cargando las librerias
library(rpart)
library(rattle)

## Cargando los datos
d_tennis=read.csv(file="tennis.csv", header = T, stringsAsFactors = F)

## Creando el decision tree default
fit_tree_1=rpart(data = d_tennis, 
                 formula = jugar_tenis ~  clima + temperatura + humedad + ventoso)
                 
               
## Dibujando el arbolito
fancyRpartPlot(fit_tree_1) 

## Creando el decision tree siendo menos restrictivo
fit_tree_2=rpart(data = d_tennis, 
                 formula = jugar_tenis ~  clima + temperatura + humedad + ventoso,
                 control =  rpart.control(
                   cp = 0.000001,
                   minbucket=2,
                   minsplit=2
                 )
                )


fit_tree_2 # <--- este es el modelo predictivo! 

## Ahora sí!
fancyRpartPlot(fit_tree_2) 

 ## Imprimiendo las reglas
asRules(fit_tree_2)

