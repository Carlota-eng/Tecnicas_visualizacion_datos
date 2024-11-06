# PEC 2: Visualización de datos
Este proyecto forma parte de la asignatura de _Visualización de datos_ de la _Universitat Oberta de Catalunya_ (UOC), concretamente de la PEC2. A lo largo del proyecto, se exploran diferentes técnicas de visualización para representar datos de manera efectiva y facilitar su interpretación. Cada técnica seleccionada permite analizar un conjunto de datos específico, destacando patrones y características relevantes.
#### Objetivo
El objetivo de este proyecto es aplicar y comparar tres técnicas de visualización de datos diferentes, comprendiendo mejor la aplicación y el impacto visual de cada una. Para lograrlo, se han utilizado tres conjuntos de datos distintos, seleccionados específicamente para aprovechar cada técnica visual. Todo el trabajo se ha realizado en RStudio, una herramienta de programación estadística que permite gestionar datos y generar visualizaciones de alta calidad.
#### Técnicas de Visualización
Las técnicas de visualización que se trabajan en este proyecto son las siguientes:

- _Word cloud_: representación visual donde el tamaño de cada palabra indica su frecuencia o importancia en un conjunto de datos textuales. Ideal para visualizar datos de texto y resaltar los términos más frecuentes en ellos.
- _Correlation Matrix_: herramienta que muestra las relaciones entre diferentes variables numéricas. Los colores e intensidades en la matriz permiten identificar visualmente la correlación entre pares de variables.
- _Violin plot_: Combina características de un _box plot_ y un _kde plot_ para mostrar la distribución de datos y su densidad. Permite observar la variabilidad y forma de las distribuciones, lo cual es útil para comparaciones entre múltiples grupos o categorías.
  
## Visualizaciones
A continuación, se muestran las visualizaciones resultantes de cada técnica. Para cada una de ellas, se adjunta en la carpeta _/code_ el código necesario para su ejecución y en la carpeta _/images_ la imagen en formato .png de la representación:
###### Word Cloud
Para la elaboración del _Word cloud_ se ha utilizado la base de datos [_Wines Reviews_](https://www.kaggle.com/datasets/zynicide/wine-reviews) disponible en [_Kaggle_](https://www.kaggle.com/). A continuación, se detallan los paquetes necesarios a instalar y librearías a cargar para la realización del _word cloud_:

```
# Download pack
if (!require("wordcloud")) install.packages("wordcloud")
if (!require("RColorBrewer")) install.packages("RColorBrewer")
if (!require("devtools")) install.packages("devtools")
devtools::install_github("lchiffon/wordcloud2")

library(wordcloud)
library(RColorBrewer)
library(openxlsx)
library(wordcloud2)
```

El objetivo de esta representación es mostrar las palabras más mencionadas a nivel mundial a la hora de hablar sobre vinos o hacer una reseña sobre ellos.

![image](https://github.com/user-attachments/assets/a3257920-ba51-4b27-b761-56d545260362)

De igual forma, se podría construir la misma visualización pero diferenciando las reseñas por países. Por ejemplo estas serían las palabras más nombradas enl as reseñas hechas por estado unidenses:

![image](https://github.com/user-attachments/assets/120da111-0d7d-468a-9c68-0091d821242e)

O, las palabras más mencionadas por sudafricanos:

![image](https://github.com/user-attachments/assets/63c9298b-91c5-48b9-819d-e88f89f4313d)


En la carpeta de imagenes de este repositorio se incorporan _word clouds_ para diferentes paises como: US, Chile, Sud Africa y Italia.

###### Correlation Matrix
La base de datos utilizada en este caso es [_Wine Quality_](https://archive.ics.uci.edu/dataset/186/wine+quality) disponible en [UC Irvine Machine Learning](https://archive.ics.uci.edu/). Esta representación tiene como objetivo mostrar como los diferentes atributos que componen un vino estan correlacionados entre si. A continuación, se detallan los paquetes necesarios a instalar y librearias a cargar para la realización de la _correlation matrix_:

```
#Install corrplot
if (!require("corrplot")) install.packages("corrplot")
if (!require("rmcorr")) install.packages("rmcorr")

library(corrplot)
library(rmcorr)
```


