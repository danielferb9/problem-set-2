## Daniel Felipe Riaño Barrera - 202112753
## Andrés Felipe Guevara Pineda - 202022636
#Juan Kamilo Narvaez - 202113808
R.version.string

#Limpiar el entorno
rm(list=ls()) 

## instalar/llamar pacman
install.packages("pacman")
library(pacman)
require(pacman)

## usar la función p_load de pacman para instalar/llamar las librerías de la clase
p_load(rio,
       skimr,
       janitor,
       data.table,
       tidyverse)
#Verificar el directorio
getwd()
list.files()

## 1.importar/exportar
#importar bases de datos
location <-       import(file= "input/Modulo de sitio o ubicacion.csv", encoding="UTF-8") 
identification <- import(file= "input/Modulo de identificacion.csv", encoding="UTF-8") 

#Exportar bases de datos
export(x=location , file="output/location.rds")
export(x=identification , file="output/identification.rds")

##3. Generar variables
#tipo de empresa
identification = mutate(identification, bussiness_type = case_when(GRUPOS4 == 1 ~ "agricultura",
                                                                   GRUPOS4 == 2 ~ "industria manufacturera",
                                                                   GRUPOS4 == 3 ~ "comercio",
                                                                   GRUPOS4 == 4 ~ "servicos"))