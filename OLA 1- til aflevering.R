#OLA1. Gruppe 1: Daniel, Tyrese, Marie og Oliver

#OPGAVE 1: 

#Opgave 1.1- Find data: 

library(readr)
newhomes <- read_csv("newhomes.csv")
View(newhomes)

newhome <- newhomes[-1,]



Frigrunden9 <- newhome[newhome$vej=="Frigrunden 96270 Tønder",]

Hostrupvej13A <- newhome[newhome$vej=="Hostrupvej 13AJejsing, 6270 Tønder",]

#Opgave 1.2- Vælg

Valg1 <- newhome[newhome$vej=="Skodborg Stadionvej 106630 Rødding",]
Valg2 <- newhome[newhome$vej=="Nymarks Allé 2588320 Mårslet",]

#Opgave 1.3- NA værdi 
#- Se PDF 


#Opgave 1.4- Rescearch goal 
#- se PDF





