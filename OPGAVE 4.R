#OPGAVE 4- Danskernes forhold til alkohol 

#4.1- hent data 

library(ggplot2)

library(readxl)
FU02 <- read_excel("FU02.xlsx")
View(FU02)

#Illustere udviklingen i hver enkelte gruppe 

#Vi laver en dataframe, over de relevante data: 


dffu <- data.frame(yearz= as.numeric(FU02[2, 3:ncol(FU02)]),
  spol= as.numeric(FU02[4, 3:ncol(FU02)]),
  alkl= as.numeric(FU02[5, 3:ncol(FU02)]),
  vAfd=as.numeric(FU02[6, 3:ncol(FU02)]),
  vina=as.numeric(FU02[7, 3:ncol(FU02)]),
  hedvin=as.numeric(FU02[8, 3:ncol(FU02)]),
  vinbdrik=as.numeric(FU02[9, 3:ncol(FU02)]),
  pilz=as.numeric(FU02[10, 3:ncol(FU02)]),
  and.pilz=as.numeric(FU02[11, 3:ncol(FU02)]),
  lav.pilz=as.numeric(FU02[12, 3:ncol(FU02)]),
  bas.pilz=as.numeric(FU02[13, 3:ncol(FU02)])
)

#Nu skal vi illustere udviklingen i de enkelte grupper: 

ggplot(dffu)

#Det har vi gjort ved hjælp af ggplot og geom_line 


#02.1.1.1 Spiritus og likør

ggplot(dffu, aes(x= yearz,y= spol))+
  geom_line()

#02.1.1.2 Alkoholiske læskedrikke

ggplot(dffu, aes(x= yearz,y= alkl))+
  geom_line()

#02.1.2.1 Vin af druer

ggplot(dffu, aes(x= yearz,y= vAfd))+
  geom_line()

#02.1.2.2 Vin af andre frugter

ggplot(dffu, aes(x= yearz,y= vina))+
  geom_line()

#02.1.2.3 Hedvin

ggplot(dffu, aes(x= yearz,y= hedvin))+
  geom_line()

#02.1.2.4 Vinbaserede drikkevarer og alkoholfri vin

ggplot(dffu, aes(x= yearz,y= vinbdrik))+
  geom_line()

#02.1.3.1 Pilsnerøl, guldøl

ggplot(dffu, aes(x= yearz,y= pilz))+
  geom_line()

#02.1.3.2 Andre alkoholholdige øl

ggplot(dffu, aes(x= yearz,y= and.pilz))+
  geom_line()

#02.1.3.3 Øl med lavt alkoholindhold og alkoholfri øl

ggplot(dffu, aes(x= yearz,y= lav.pilz))+
  geom_line()

#02.1.3.4 Øl-baserede drikkevarer

ggplot(dffu, aes(x= yearz,y= bas.pilz))+
  geom_line()


#Opave 4.2- lav en korrelationsmatrix

cor(dffu$spol,dffu$alkl)
cormx<- cor(dffu)
View(cormx)


#Opgave 4.3 - beskriv resultaterne

#Sammenehængen mellem variablerne kan beskrives på to måder, den ene er postiv sammenhæng og 
#den anden er negativ sammenhæng. 

#Vi har eksperimenteret med et heatmap, for at kunne visualiserer vores korrelationsmatrix. 


heatmap(cormx, Rowv = NA, Colv  = NA, col = terrain.colors(256), scale = "none")





