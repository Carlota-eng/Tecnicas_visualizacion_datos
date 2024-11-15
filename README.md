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
devtools::install_github("lchiffon/wordcloud2")

library(wordcloud2)
library(htmltools)
```

El objetivo de esta representación es mostrar las palabras más mencionadas por los americanos cuando se les pregunta por la anseidad a los largo del tiempo: _Before 2000s_ (1985 - 1999) vs _After 2000s_ (2000 - 2017).

![Captura de Pantalla 2024-11-09 a las 10 22 31](https://github.com/user-attachments/assets/6ab61918-649d-4e31-9dbc-bf06eb6f10b5)

###### Conclusiones
- _husband_, _time_ o _mother_ como palabras principales predominantes en el tiempo
- Principales preocupaciones _Before 2000s_: _husband_, _people_, _time_, _mother_, _children_, _married_, _man_, _family_, _love_, _wife_, _wedding_, _woman_, _day_, _good_, _problem_, _parents_, _daughter_, _child_, _son_ o _friends_
- Principales preocupaciones _After 2000s_: _husband_, _time_, _family_, _mother_, _feel_, _married_, _children_, _friends_, _people_, _love_, _daughter_, _wife_,  _parents_, _life_, _son_, _friend_, _problem_, _mom_, _man_, _day_, _work_ o _relationship_

  
#### Correlation Matrix
La base de datos utilizada en este caso es [_Wine Quality_](https://archive.ics.uci.edu/dataset/186/wine+quality) disponible en [UC Irvine Machine Learning](https://archive.ics.uci.edu/). A continuación, se detallan los paquetes necesarios a instalar y librearias a cargar para la realización de la _correlation matrix_:

```
# Download pack
if (!require("corrplot")) install.packages("corrplot")

library(corrplot)
```

Esta representación tiene como objetivo mostrar como los diferentes atributos que componen un vino estan correlacionados entre si. 

![image](https://github.com/user-attachments/assets/0382eeca-cfaa-4022-a11e-c2524adaf69c)

###### Conclusiones
- Principales correlaciones negativas:
  - _pH_ - _fixed.acidity_
  - _citric.acid_ - _volatile.acidity_
  - _pH_ - _citric.acid_
- Principales correlaciones positivas:
  - _citric.acid_ - _fixed.acidity_
  - _density_ - _fixed.acidity_
  - _total.sulfur.dioxide_ - _free.sulfur.dioxide_
- El principal elemento correlacionado negativamente con el _alcohol_ del vino es _density_, es decir, a mayor _density_ menor cantidad de _alcohol_

#### Violin Plot
Finalmente, se utiliza la base de datos [_Salary_Data_](https://www.kaggle.com/datasets/mohithsairamreddy/salary-data) de [_Kaggle_](https://www.kaggle.com/). El objetivo del _violin plot_ es observar las diferencias salariales entre hombres y mujeres por edad en la población de India.

Paquetes necesarios para la elaboración del gráfico:

```
# Download pack
if (!require("ggplot2")) install.packages("ggplot2")
if (!require("dplyr")) install.packages("dplyr")
if (!require("scale")) install.packages("scale")

library(ggplot2)
library(dplyr)
library(scales)
```

![image](https://github.com/user-attachments/assets/be2a69e3-dc2f-4a6f-bc7b-72cf79a718a8)

###### Conclusiones
- Distribución de sueldos por edad y género bastante similar para los 3 rangos de edades
- Las medias salariales por género bastante similar en cada grupo de edad, siendo en los 3 casos superior en el caso de los hombres ligeramente que las mujeres
- A mayor edad, mayor salario (independientemente del género)





