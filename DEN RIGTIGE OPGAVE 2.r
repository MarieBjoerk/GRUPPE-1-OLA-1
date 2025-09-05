#OLA1. Gruppe 1: Daniel, Tyrese, Marie og Oliver

#OPGAVE 2- Korrelation og simple lineær regression 

#opgave 2.1- se både pdf og opgave 2.2- Korrelation 

library(readr)
newhomes <- read_csv("newhomes.csv")
View(newhomes)
newhome <- newhomes[-1,]


#Vi renser datasættet: 

newhome[newhome=="- m²"] <- NA
newhome[newhome=="Helårsgrund"] <-NA
newhome[newhome=="Fritidsgrund"] <-NA
newhome[newhome=="Helårsgrund/Fritidsgrund"] <-NA
newhome[newhome=="Fritidsgrund/Fritidsbolig"] <-NA

newhome2 <- na.omit(newhome)

#Vi fjerne NA værdier, men finder ydereligere NA værdier: 

newhome2[newhome2=="-"] <- NA
newhome2[newhome2==" - "] <- NA
newhome2[newhome2=="- "] <- NA
newhome2[newhome2=="Landejendom"] <-NA
newhome2[newhome2=="Landejendom/Landejendom"] <- NA

newhome2<- na.omit(newhome2)

#Her fjerner strings, så vi kun har med nummeriske tal at arbejde med: 

newhome2$kvm <- gsub("m²","",newhome2$kvm)
newhome2$pris <- gsub("kr.","",newhome2$pris)
newhome2$alder <- gsub("Opført","",newhome2$alder)
newhome2$grund <- gsub("Grund","",newhome2$grund)
newhome2$grund <- gsub("m²","",newhome2$grund)
newhome2$ejerudg <- gsub("Ejerudg.","",newhome2$ejerudg)
newhome2$ejerudg <- gsub("kr./md","",newhome2$ejerudg)
newhome2$vaer <- gsub("Vær.","",newhome2$vaer)
newhome2$liggetid <- gsub("dag","",newhome2$liggetid)
newhome2$liggetid <- gsub("e","",newhome2$liggetid)
newhome2$ejerudg <- gsub("Ydelse ","", newhome2$ejerudg)

#Vi laver 7 vektorer: 

prisV <- c(newhome2$pris)
kvmV <- c(newhome2$kvm)
alderV <- c(newhome2$alder)
grundV <- c(newhome2$grund)
ejerudgV <- c(newhome2$ejerudg)
vaerV <- c(newhome2$vaer)
liggetidV <- c(newhome2$liggetid)

#Vi transformerer fra charater til numerisk værdi:  

prisV <- as.numeric(gsub("[.]", "",prisV))
kvmV<- as.numeric(gsub("[.]", "",kvmV))
alderV <- as.numeric(gsub("[.]","",alderV))
grundV <- as.numeric(gsub("[.]","",grundV))
ejerudgV <- as.numeric(gsub("[.]","",ejerudgV))
vaerV <- as.numeric(gsub("[.]","",vaerV))
liggetidV <- as.numeric(gsub("[.]","",liggetidV))


#Vi laver data.frame over pris og 6 variabler:  

dfpk <- data.frame(prisV=c(prisV), kvmV=c(kvmV))
dfpa <- data.frame(prisV=c(prisV), alderV=c(alderV))
dfpg <- data.frame(prisV=c(prisV), grundV=c(grundV))
dfpe <- data.frame(prisV=c(prisV), ejerudgV=c(ejerudgV))
dfpv <- data.frame(prisV=c(prisV), vaerV=c(vaerV))
dfpl <- data.frame(prisV=c(prisV), liggetidV=c(liggetidV))

#Nu laver vi lineær regression: 

regpk <- lm(prisV~kvmV, data= dfpk)
summary(regpk)
regpa <- lm(prisV~alderV, data= dfpa)
summary(regpa)
regpg <- lm(prisV~grundV, data= dfpg)
summary(regpg)
regpe <- lm(prisV~ejerudgV, data=dfpe)
summary(regpe)
regpv <- lm(prisV~vaerV, data=dfpv)
summary(regpv)
regpl <- lm(prisV~liggetidV, data=dfpl)
summary(regpl)

#Nu laver vi pris per m²
ppk <- dfpk$prisV/dfpk$kvmV
View(ppk)

#Nu skal vi lave en samlede dataframe over de 5 regressioer, for at kunne bruge 
#cor_matrix 

kordata <- data.frame(prisKvm=ppk,
                      alderK=dfpa$alderV,
                      ejerudK=dfpe$ejerudgV,
                      grundK=dfpg$grundV,
                      liggetidK=dfpl$liggetidV,
                      vaerK=dfpv$vaerV
                      )
#Nu har vi lavet vores matrix: 
ppkmatx <- cor(kordata)




