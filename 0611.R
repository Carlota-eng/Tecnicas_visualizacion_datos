# Download pack
if (!require("wordcloud")) install.packages("wordcloud")
if (!require("RColorBrewer")) install.packages("RColorBrewer")
if (!require("devtools")) install.packages("devtools")
devtools::install_github("lchiffon/wordcloud2")
if (!requireNamespace("htmltools", quietly = TRUE)) {
  install.packages("htmltools")
}

# Cargar el paquete htmltools
library(htmltools)
library(wordcloud2)
library(wordcloud)
library(RColorBrewer)
library(openxlsx)
library(wordcloud2)
library(htmlwidgets)

# Cargar df
df <- read.xlsx("C:/Utilidades Carlota/MDS/Visualizacion de datos/PEC2/df_wine.xlsx",
                sheet=1)

stops <- read.table("C:/Utilidades Carlota/MDS/Visualizacion de datos/PEC2/stop_words.txt", header=F, encoding = "UTF-8")

# Limpiar df
df <- df[, c(1,2,3)] 
summary(df)
# tabla_frec <- table(df$country) # visualizar países y muestra de cada uno en el df

# Limpiar words
words <- df$description
words <- gsub('[[:punct:] ]+',' ', words) # Eliminar puntuaciones (i.e comas, puntos, acentos,...)
words <- gsub("[[:digit:]]+", "", words) # Eliminar números
words <- tolower(words) # Todas las palabras en minúsculas
words <- strsplit(words, ' ') # separar palabras

a <- sapply(words, length) # contar las palabras que tiene cada reseña
words2 <- rep(NA, sum(a)) # reservar espacio para un vector que contendra todas las palabras
inicio <- 1
for(i in words){
  final <- inicio+length(i)-1
  words2[ inicio:final] <- i
  inicio <- inicio+length(i)
}
words <- words2
rm(words2, a, inicio, final, i)

words <- data.frame("palabras"=words,"largo"=nchar(words)) # lo dejo en data.frame
words <- words[words$largo>2, ] # Eliminar palabras con menos de 2 letras
filtro <-  words$palabras%in%stops$V1 # Eliminar palabras que aparecen en el stop list
words <- words[!filtro, ]
words_nowine <- words[words != "wine", ] # Eliminar palabra en concreto "Wine"

tabla_frec <- table(words_nowine$palabras)
tabla_frec <- data.frame(tabla_frec)
tabla_frec <- tabla_frec [ order(tabla_frec$Freq, decreasing = T), ]

# Word Cloud / Tag Cloud
# Opción 1
main_words <- head(tabla_frec,2000)
set.seed(4321)
wordcloud(words = main_words$Var1, freq = main_words$Freq, scale = c(3,0.5), min.freq = 1,
          max.words=2000, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"),
          family="sans")

# Opción 2
wordcloud2(data=tabla_frec, size = 0.7, color = 'random-light',backgroundColor = 'Black')

grafico <- wordcloud2( data = tabla_frec,  backgroundColor = "black")

doc <- tagList(
    div(style = "display: flex; flex-direction: column; align-items: center; background-color: black",
        tags$p(style="font-family: Ubuntu; color: white; font-size: 50px;",
               strong("MOST MENTIONED WORDS IN WINES REVIEWS WORLDWIDE")),
        grafico
    )
  )

browsable(doc)

