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
#### Word Cloud
Para la elaboración del _Word cloud_ se ha utilizado la base de datos [_American Anxieties: Dear Abby's Questions_](https://www.kaggle.com/datasets/thedevastator/american-anxieties-dear-abby-s-questions?resource=download) disponible en [_Kaggle_](https://www.kaggle.com/). A continuación, se detallan los paquetes necesarios a instalar y librearías a cargar para la realización del _word cloud_:

```
# Download pack
if (!require("RColorBrewer")) install.packages("RColorBrewer")
if (!require("devtools")) install.packages("devtools")
devtools::install_github("lchiffon/wordcloud2")

library(RColorBrewer)
library(wordcloud2)
library(htmltools)
```

El objetivo de esta representación es mostrar las palabras más mencionadas por los americanos cuando se les pregunta por la anseidad a los largo del tiempo: _Before 2000s_ (1985 - 1999) vs _After 2000s_ (2000 - 2017).

![image](https://github.com/user-attachments/assets/27568bfc-3e9d-4405-83ee-cd281f697b05)


![image](https://github.com/user-attachments/assets/56d6c216-e7e6-4b24-9eba-1af6f656ee1c)


###### Conclusiones
- _husband_, _time_ y _children_ como palabras principales predominantes en el tiempo
- 

#### Correlation Matrix
La base de datos utilizada en este caso es [_Wine Quality_](https://archive.ics.uci.edu/dataset/186/wine+quality) disponible en [UC Irvine Machine Learning](https://archive.ics.uci.edu/). A continuación, se detallan los paquetes necesarios a instalar y librearias a cargar para la realización de la _correlation matrix_:

```
# Download pack
if (!require("corrplot")) install.packages("corrplot")
if (!require("rmcorr")) install.packages("rmcorr")

library(corrplot)
library(rmcorr)
```

Esta representación tiene como objetivo mostrar como los diferentes atributos que componen un vino estan correlacionados entre si. 

![image](https://github.com/user-attachments/assets/0382eeca-cfaa-4022-a11e-c2524adaf69c)

#### Violin Plot
Finalmente, se utiliza la base de datos [_Salary_Data_](https://www.kaggle.com/datasets/mohithsairamreddy/salary-data) de [_Kaggle_](https://www.kaggle.com/). El objetivo del _violin plot_ es observar las diferencias salariales entre hombres y mujeres por edad en la población de India.

Paquetes necesarios para la elaboración del gráfico:

```
# Download pack
if (!require("viridis")) install.packages("viridis")
devtools::install_github("hrbrmstr/hrbrthemes")
if (!require("ggplot2")) install.packages("ggplot2")
if (!require("forcats")) install.packages("forcats")
if (!require("scale")) install.packages("scale")

library(ggplot2)
library(dplyr)
library(forcats)
library(hrbrthemes)
library(viridis)
library(car)
library(scale)
```


![image](https://github.com/user-attachments/assets/be2a69e3-dc2f-4a6f-bc7b-72cf79a718a8)







