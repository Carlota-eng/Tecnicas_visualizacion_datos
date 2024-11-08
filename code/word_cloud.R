# Librerias
library(wordcloud2)
library(htmltools)

# Cargar dataset y stopwords
df <- read.csv("df/anxiety.csv",
               sep=",", header=TRUE)
stops <- read.table("df/stop_words.txt", header=F, encoding = "UTF-8")

# Limpiar df
df <- df[, c(1,2,8)]
summary(df)

# Limpiar words
words <- df$question_only
words <- gsub('[[:punct:] ]+',' ', words) # Eliminar puntuaciones (i.e comas, puntos, acentos,...)
words <- gsub("[[:digit:]]+", "", words) # Eliminar números
words <- tolower(words) # Todas las palabras en minúsculas
words <- strsplit(words, ' ') # Separar palabras

a <- sapply(words, length) # Contar las palabras que tiene cada reseña
words2 <- rep(NA, sum(a)) # Reservar espacio para un vector que contendra todas las palabras
year <- words2
inicio <- 1
posicion<-1
for(i in words){
  final <- inicio+length(i)-1
  words2[ inicio:final ] <- i
  year[ inicio:final ]<-rep(df[posicion,2], length(i))
  inicio <- inicio+length(i)
  posicion<-posicion+1
}

words <- words2
words <- data.frame("palabras"=words, "year"=year,"largo"=nchar(words))
rm(words2, a, inicio, final, i, year, posicion)

filtro <-  words$palabras%in%stops$V1 # Eliminar palabras que aparecen en el stop list
words <- words[!filtro, ]
words <- words[words$largo>2, ] # Eliminar palabras con menos de 2 letras

# Separar df total en: df de años 1985 - 1999
pre_2000 <- table(words_noyear$palabras[words_noyear$year < 2000])
pre_2000 <- data.frame(pre_2000)
pre_2000 <- pre_2000 [ order(pre_2000$Freq, decreasing = T), ]

# Separar df total en: df de años 2000 -2017
post_2000 <- table(words_noyear$palabras[words_noyear$year > 1999])
post_2000 <- data.frame(post_2000)
post_2000 <- post_2000 [ order(post_2000$Freq, decreasing = T), ]

# Word Cloud
plot_pre2000 <- wordcloud2(data=pre_2000, size = 0.6, color = 'random-dark',
                           backgroundColor = 'white', ellipticity = TRUE)
plot_post200 <- wordcloud2(data=post_2000, size = 0.6, color = 'random-dark',
                           backgroundColor = 'white', ellipticity = TRUE)

# Crear elemento HTML e incrustrar los wordclouds
doc <- tagList(
  # Título general centrado
  tags$p(
    style = "
        color: black;
        font-size: 24px;
        text-align: center;
        margin: 0 0 20px 0;
        padding-bottom: 10px;
        border-bottom: 2px solid #000;
        width: 100%;
      ",
    strong("MOST MENTIONED WORDS WHEN PEOPLE TALK ABOUT DEPRESSION")
  ),
  
  # Contenedor principal con menos espacio entre los gráficos
  div(
    style = "
      display: flex;
      justify-content: center;
      background-color: white;
      gap: -10px; 
      padding: 0 20px;
    ",
    
    # Contenedor del primer gráfico
    div(
      style = "
        display: flex; 
        flex-direction: column;
        font-size: 24px;
        align-items: center;
        margin: 0;
      ",
      tags$p(
        style = "margin-bottom: 5px;",
        "Before 2000s"
      ),
      plot_pre2000
    ),
    
    # Contenedor del segundo gráfico
    div(
      style = "
        display: flex; 
        flex-direction: column;
        font-size: 24px;
        align-items: center;
        margin: 0;
      ",
      tags$p(
        style = "margin-bottom: 5px;",
        "After 2000s"
      ),
      plot_post200
    )
  )
)

# Visualizar el HTML en el navegador
browsable(doc)
