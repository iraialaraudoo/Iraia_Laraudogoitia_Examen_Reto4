#API PUMBLER
library(plumber)
library(dplyr)

#* @apiTitle API examen Iraia Laraudogoitia
#* @apiDescription API que permite a los usuarios buscar áreas que cumplan cierto criterio de calidad del agua.
#* @param calidad_minima El valor mínimo de calidad del agua a filtrar.
#* @get /API
#* 
filter_water_quality <- function(calidad_minima) {
  # Filtramos los datos para obtener solo los que tienen un valor mayor o igual a min_quality
  filtrado <- datos %>% filter(Value >= calidad_minima)
  
  # Devolvemos las columnas "Area", "Site" y "Value" de los resultados filtrados
  return(filtrado[, c("Area", "Site", "Value")])
}



