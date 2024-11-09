#Install corrplot
if (!require("corrplot")) install.packages("corrplot")
require(corrplot)

if (!require("rmcorr")) install.packages("rmcorr")
library(rmcorr)

# Cargar df
df <- read.csv("df/winequality-red.csv", sep=";", header=TRUE)
head(df)
names(df)

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
mtext("Different wine's attribute correlations", side = 3, line = 2, cex = 1.5, font = 2)
