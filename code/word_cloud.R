# Download pack
install.packages("wordcloud")
install.packages("RColorBrewer")

library(wordcloud)
library(RColorBrewer)
library(openxlsx)

install.packages("devtools")
devtools::install_github("lchiffon/wordcloud2")
library(wordcloud2)
library(tm)

df <- read.xlsx("C:/Utilidades Carlota/MDS/Visualizacion de datos/PEC2/df_wine.xlsx",
                sheet=1)

rm(stops)
stops <- read.table("C:/Utilidades Carlota/MDS/Visualizacion de datos/PEC2/stop_words.txt", header=F, encoding = "UTF-8")

# Limpiar df
# set.seed(4321)
# df <- df[sample( c(1:nrow(df)), 50000), c(1,2,3,13)]
df <- df[, c(1,2,3,13)] 
summary(df)

# Limpiar words
words <- df$description
words <- gsub('[[:punct:] ]+',' ', words)
words <- gsub("[[:digit:]]+", "", words) # Eliminar números
words <- tolower(words)
words <- strsplit(words, ' ')

a <- sapply(words, length) # cuento las palabras que cada reseña tiene
words2 <- rep(NA, sum(a)) # reservo espacio para un vector que contendra todas las palabras
inicio <- 1
for(i in words){
  final <- inicio+length(i)-1
  words2[ inicio:final] <- i
  inicio <- inicio+length(i)
}
tail(words2)

words <- words2
rm(words2, a, inicio, final, i)

words <- data.frame("palabras"=words,"largo"=nchar(words)) #lo dejo en data.frame
words <- words[words$largo>2, ] # me cargo las palabras de un solo 2 o menos carac...
filtro <-  words$palabras%in%stops$V1
words <- words[!filtro, ]
words_nowine <- words[words != "wine", ]

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
words_table <- table(words_nowine$palabras)
wordcloud2(data=words_table, size = 0.7, color = 'random-light',backgroundColor = 'Black')
