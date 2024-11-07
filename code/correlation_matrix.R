#Install corrplot
if (!require("corrplot")) install.packages("corrplot")
require(corrplot)

if (!require("rmcorr")) install.packages("rmcorr")
library(rmcorr)

# Cargar df
df <- read.csv("C:/Utilidades Carlota/MDS/Visualizacion de datos/PEC2/winequality-red.csv",
               sep=";", header=TRUE)
head(df)
names(df)

# opcion 2
corrplot.mixed(cor(df, use = "complete.obs"),
               lower = "ellipse", 
               upper = "number",
               tl.col = "black",
               title="Correlaciones Red-wine quality")

# Opcion 1
cor_matrix <- cor(df[, -ncol(df)], use = "complete.obs")
corrplot(cor_matrix, method = "circle")

# Visualización de la matriz de correlación sin el título
corrplot(cor_matrix, 
         method = "color",           
         type = "lower",              
         tl.col = "black",            
         tl.srt = 45,                 
         addCoef.col = "black",       
         number.cex = 0.7,            
         col = colorRampPalette(c("red", "white", "blue"))(200),  
         cl.pos = "b",                
         cl.length = 5,               
         diag = FALSE)

# Título en la parte superior con mayor separación
mtext("Different wine's attribute correlations", side = 1, line = 0.5, cex = 1.5, font = 2)


