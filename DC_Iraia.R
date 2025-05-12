#DATA CLEANING

#Cargar librerias
library(naniar)
library(class)
library(VIM)


#Cargar datos
datos<- read.csv("C:/Users/Larau/Downloads/Examen/water-quality-data.csv")


#1. Analizar Los missings tanto por variable como por registro
#Por variable
var<-miss_var_summary(datos)

#Por registro
reg<-miss_case_summary(datos)


#2. En que variable se concetran la mayoria de NA-s? Que porcentaje de NA-s presenta?
variables<- var$variable[1]
porcentaje_vairbale_uno<- var$pct_miss[1]

#3. Cunatos NA tienen los primero5 registros con mas NA? Que porcentaje de NA presentan?
reg$n_miss[1:5]
reg$pct_miss[1:5]


#4. Visuaiza la distribucion de los valores peridos. Que tipo de distribucion parece que tiene? (MCAR, MNAR, MAR..)
set.seed(42)
muestra <- datos[sample(nrow(datos), round(nrow(datos) * 0.01)), ]

vis_miss(muestra)

#5. IMputar los valores perdidos, utilizando KNN y las varibales "Area" y "Site.type" como referencia
muestra<- kNN(muestra, variable=c("RDL", "MDL", "Grab.ID", "Value"),
                       dist_var = c("Area", "Site.Type"), 
                       k=5)

