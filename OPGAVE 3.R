#OPGAVE 3- Tilfældigheder og terninger 

#3.1- Funktion til terningen 

terning <- sample(1:6,25000,replace=TRUE)
terning_kast <- data.frame(terning=terning)

Tfem <- terning_kast[terning_kast$terning==5,]

#Vores terningskast på 25.000 kast, giver 4186 5'er 

4186/25000*100

#sandsynligheden for at vores terning slår 5'er er 16,74% og lidt over gennemsnittet 


#3.2- lav plot I

#Lav et script med 6 terninger der kan vise summen og slå nu 10.000 gange 

terning6 <- rep(1:6, 6, times= 6)

#Vi prøvede med rep, til at lave seks terninger, det fungerede ikke. fordi vi både skulle have 
#terningen til at slå forskellige slag, som man skal bruge sample til. -
#derudover skal vi bruge replace=true, til simulere terningkastet.

terning.6 <- sample(1:6, 6,replace = TRUE)

#Så for at skærer hele funktionen ud: 

#sample står for tilfældig udtræk eller stikprøve
#1:6 angiver, at terningen har værdier fra 1 til 6
#6 angiver antallet af terninger der skal slås med 
#replace= TRUE sikre, at hver terning kan få den sammen værdi, selvom værdien er slået 


terning.6 <- replicate(10000, sample(1:6, 6,replace = TRUE))
View(terning.6)

#Efter vi har lavet 6 terninger der slår tilfældigt fra 1 til 6, skal vi nu have den til at 
#slå 10.000 gange. Der bruger vi replicate, foran vores sample. Nu ved R at vi skal slå
#de seks terninger 10.000 gange.


#Opgave 3.3 plot II

#Vi skal nu slå med terningen 1 mio gange. Så derfor laver vi en vector, der er 6/1000000. 
seksdmio <- 1000000/6

tm.mio <- replicate(seksdmio, sample(1:6, 6,replace = TRUE))
View(tm.mio)

#Vi har seks terninger og mangler 4 slag, så den går desværre ikke op:) 


#Opgave 3.4

#Lav et script i R, med tilfældige tal fra 1:6, med 2 kolonner og 5 rækker
#den første kolonne skal være tallene 2:6 og den anden 1:6 

col1 <- sample(2:6,5, replace=TRUE)
col2 <- sample(1:6,5, replace=TRUE)
kcol <- cbind(col1,col2)
print(kcol)


#vi har lavet to vektorer, begge med sample funktionen for at lave dem tilfældige.

#Den ene er fra 2 til 6, og den anden er fra 1 til 6, som begge har 2 kolonner og 5 rækker. 
#Bagefter bruger vi cbind til at binde de to vektorer sammen. 

