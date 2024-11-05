# Download pack
if (!require("wordcloud")) install.packages("wordcloud")
if (!require("RColorBrewer")) install.packages("RColorBrewer")
if (!require("devtools")) install.packages("devtools")
devtools::install_github("lchiffon/wordcloud2")
library(wordcloud)
library(RColorBrewer)
library(openxlsx)
library(wordcloud2)

# Cargar el dataframe
df <- read.xlsx("df/df_wine.xlsx", sheet=1)

# Cargar palabras qeu se excluiran de la visualización
stops <- read.table("df/stop_words.txt", header=F, encoding = "UTF-8")

# Limpiar df
df <- df[, c(1,2,3)] 
summary(df)
tabla_frec <- table(df$country) # visualizar países y muestra de cada uno en el df

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
main_words <- head(tabla_frec,900)
set.seed(4321)
wordcloud(words = main_words$Var1, freq = main_words$Freq, scale = c(3,0.5), min.freq = 1,
          max.words=1000, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"),
          family="sans")

# Opción 2
wordcloud2(data=tabla_frec, size = 0.7, color = 'random-light',backgroundColor = 'Black')

# Word Cloud por paises
# Replicar el código anterior para US
df_us <- subset(df, df$country=="US")
words_us <- df_us$description
words_us <- gsub('[[:punct:] ]+',' ', words_us)
words_us <- gsub("[[:digit:]]+", "", words_us)
words_us <- tolower(words_us)
words_us <- strsplit(words_us, ' ')

a <- sapply(words_us, length)
words2 <- rep(NA, sum(a))
inicio <- 1
for(i in words_us){
  final <- inicio+length(i)-1
  words2[ inicio:final] <- i
  inicio <- inicio+length(i)
}
words_us <- words2
rm(words2, a, inicio, final, i)

words_us <- data.frame("palabras"=words_us,"largo"=nchar(words_us))
words_us <- words_us[words_us$largo>2, ]
filtro <-  words_us$palabras%in%stops$V1
words_us <- words_us[!filtro, ]
words_nowine <- words_us[words_us != "wine", ]

tabla_frec <- table(words_nowine$palabras)
tabla_frec <- data.frame(tabla_frec)
tabla_frec <- tabla_frec [ order(tabla_frec$Freq, decreasing = T), ]
wordcloud2(data=tabla_frec, size = 0.7, color = 'random-light',backgroundColor = 'Black')

# Replicar el código anterior para Chile
df_chile <- subset(df, df$country=="Chile")
words_chile <- df_chile$description
words_chile <- gsub('[[:punct:] ]+',' ', words_chile)
words_chile <- gsub("[[:digit:]]+", "", words_chile)
words_chile <- tolower(words_chile)
words_chile <- strsplit(words_chile, ' ')

a <- sapply(words_chile, length)
words2 <- rep(NA, sum(a))
inicio <- 1
for(i in words_chile){
  final <- inicio+length(i)-1
  words2[ inicio:final] <- i
  inicio <- inicio+length(i)
}
words_chile <- words2
rm(words2, a, inicio, final, i)

words_chile <- data.frame("palabras"=words_chile,"largo"=nchar(words_chile))
words_chile <- words_chile[words_chile$largo>2, ]
filtro <-  words_chile$palabras%in%stops$V1
words_chile <- words_chile[!filtro, ]
words_nowine <- words_chile[words_chile != "wine", ]

tabla_frec <- table(words_nowine$palabras)
tabla_frec <- data.frame(tabla_frec)
tabla_frec <- tabla_frec [ order(tabla_frec$Freq, decreasing = T), ]
wordcloud2(data=tabla_frec, size = 0.7, color = 'random-light',backgroundColor = 'Black')

# Replicar el código anterior para South Africa
df_southafrica <- subset(df, df$country=="South Africa")
words_sa <- df_southafrica$description
words_sa <- gsub('[[:punct:] ]+',' ', words_sa)
words_sa <- gsub("[[:digit:]]+", "", words_sa)
words_sa <- tolower(words_sa)
words_sa <- strsplit(words_sa, ' ')

a <- sapply(words_sa, length)
words2 <- rep(NA, sum(a))
inicio <- 1
for(i in words_sa){
  final <- inicio+length(i)-1
  words2[ inicio:final] <- i
  inicio <- inicio+length(i)
}
words_sa <- words2
rm(words2, a, inicio, final, i)

words_sa <- data.frame("palabras"=words_sa,"largo"=nchar(words_sa))
words_sa <- words[words$largo>2, ]
filtro <-  words_sa$palabras%in%stops$V1
words_sa <- words_sa[!filtro, ]
words_nowine <- words_sa[words_sa != "wine", ]

tabla_frec <- table(words_nowine$palabras)
tabla_frec <- data.frame(tabla_frec)
tabla_frec <- tabla_frec [ order(tabla_frec$Freq, decreasing = T), ]
wordcloud2(data=tabla_frec, size = 0.7, color = 'random-light',backgroundColor = 'Black')

# Replicar el código anterior para Italia
df_italy <- subset(df, df$country=="Italy")
words_italy <- df_italy$description
words_italy <- gsub('[[:punct:] ]+',' ', words_italy)
words_italy <- gsub("[[:digit:]]+", "", words_italy)
words_italy <- tolower(words_italy)
words_italy <- strsplit(words_italy, ' ')

a <- sapply(words_italy, length)
words2 <- rep(NA, sum(a))
inicio <- 1
for(i in words_italy){
  final <- inicio+length(i)-1
  words2[ inicio:final] <- i
  inicio <- inicio+length(i)
}
words_italy <- words2
rm(words2, a, inicio, final, i)

words_italy <- data.frame("palabras"=words_italy,"largo"=nchar(words_italy))
words_italy <- words_italy[words_italy$largo>2, ]
filtro <-  words_italy$palabras%in%stops$V1
words_italy <- words_italy[!filtro, ]
words_nowine <- words_italy[words_italy != "wine", ]

tabla_frec <- table(words_nowine$palabras)
tabla_frec <- data.frame(tabla_frec)
tabla_frec <- tabla_frec [ order(tabla_frec$Freq, decreasing = T), ]
wordcloud2(data=tabla_frec, size = 0.7, color = 'random-light',backgroundColor = 'Black')
