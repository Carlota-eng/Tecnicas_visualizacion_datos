#Install corrplot
install.packages("corrplot")
require(corrplot)

install.packages("rmcorr")
library(rmcorr)

# Cargar df
# https://archive.ics.uci.edu/dataset/186/wine+quality
df <- read.csv("C:/Utilidades Carlota/MDS/Visualizacion de datos/PEC2/winequality-red.csv",
               sep=";", header=TRUE)
head(df)

# opcion 2
corrplot.mixed(cor(df, use = "complete.obs"),
               lower = "ellipse", 
               upper = "number",
               tl.col = "black",
               title="Correlaciones Red-wine quality")

# Opcion 1
cor_matrix <- cor(df[, -ncol(df)], use = "complete.obs")
corrplot(cor_matrix, method = "circle")

