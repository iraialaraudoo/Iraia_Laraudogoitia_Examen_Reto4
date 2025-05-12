#EXAMEN 203-24 DATA SCIENCE RETO04

#Cargar librerias
library(dplyr)

#Cargar datos
datos<- read.csv("C:/Users/Larau/Downloads/Examen/water-quality-data.csv")
datos2<- read.csv("C:/Users/Larau/Downloads/Examen/water-quality-context.csv")

#Juntar ambos datasets
datos_juntos<- full_join(datos, datos2, by="ID")

#############         DATA DISCOVERING       ################
#1. En que rangos se mueven la varibales "Value", "MDL", "RDL"
summary(datos_juntos[,c(9,10,11)])
sd(datos_juntos$Value, na.rm=TRUE)
sd(datos_juntos$MDL, na.rm=TRUE)
sd(datos_juntos$RDL, na.rm=TRUE)

#2. Hay alguna que te llame la atencion?
summary(datos_juntos)
#Value nos puede llamar la atencion ya que su valor minimo es un numero negativo.
#Ademas varias variables etsan compuestas por Not Avalaliable number (NA)

#3. Compara e interpreta las medias y desviacion estandar de las variables MDL y RDL. Que quieren decir?
comparacion<- data.frame(medias=c(mean(datos_juntos$MDL, na.rm=TRUE), mean(datos_juntos$RDL,na.rm=TRUE)),
                         sd= c(sd(datos_juntos$MDL,na.rm=TRUE), sd(datos_juntos$RDL,na.rm=TRUE)))
rownames(comparacion)<- c("MDL", "RDL")
comparacion

#Tanto la media como la desviacion estandar de RDL es superior a la de MDL. 

#4.