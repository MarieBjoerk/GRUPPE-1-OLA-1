#OPGAVE 5.1 Oprettede vi et datasæt med fire klasser (A–D), ni uger pr. klasse og en score-variabel fra 1 til 36. 
#Det gav en tabel med kolonnerne Klasse, Uge og Score.

klasser <- rep(LETTERS[1:4], each = 9)
uger    <- rep(1:9, times = 4)
score   <- seq(1,36)

klasse <- data.frame(
  Klasse = klasser,
  Uge    = uger,
  Score  = score
)

#Opgave 5.2 beregnede vi gennemsnittet af hver tredje observation inden for hver klasse.
#Ved hjælp af modulo-operatoren (%%) fandt vi rækkerne 3, 6 og 9 og tog gennemsnittet af de tre seneste scores. 
#Dermed fik hver klasse tre gennemsnit, i alt tolv observationer.

df <- klasse[order(klasse$Klasse, klasse$Uge),]

df1 <- data.frame(Klasse = character(),
                  Uge    = numeric(),
                  Score  = numeric())

for(g in unique(df$Klasse)){
  d <- df[df$Klasse == g, ]
  for(i in 1:nrow(d)){
    if(i %% 3 == 0){
      m <- mean(d$Score[(i-2):i])
      df1 <- rbind(df1,
                   data.frame(Klasse = g, Uge = d$Uge[i], Score = m))
    }
  }
}

library(tidyr)

library(tidyr)

klasse1 <- pivot_wider(df1,
                       names_from  = Klasse,