## Librerías
if (!require("ggplot2")) install.packages("ggplot2")
if (!require("dplyr")) install.packages("dplyr")
if (!require("scale")) install.packages("scale")

library(ggplot2)
library(dplyr)
library(scales)

# Cargar df
df <- read.csv("df/salary.csv", sep=",", header=TRUE)

# Trabjar datos
str(df)
summary(df)

unique(df$Age)

df <- df[!is.na(df$Age),]

df$AgeR <- cut(
  df$Age,
  breaks = c(-Inf, 29, 40, Inf),
  labels = c("Since 29 years", "From 30-40 years", "More than 41 years"), 
  right = TRUE
)
table(df$AgeR)

df <- df %>% filter(Gender != "Other")
df <- df[!is.na(df$Salary),]
df <- df %>%
  filter(is.finite(Salary) & Salary >= 0)

# Violin plot
ggplot(df, aes(x = AgeR, y = Salary, fill = Gender)) +
  geom_violin() +
  scale_y_continuous(
    limits = c(0, 250000),
    labels = comma
  ) +
  labs(
    title = "Indian salary distribution by gender and age (Indian Rupees)",
    y = "Salary in Indian Rupee (INR)",
    x = "Age Group",
    fill = "Gender" 
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 16, face = "bold")
  ) +
  # Añadir puntos de media con leyenda
  stat_summary(
  fun = mean,                      
  geom = "point",                  
  aes(shape = "Mean"),             
  color = "black",                 
  size = 3,                        
  position = position_dodge(0.9),  
  ) +
  # Definir la leyenda para el marcador de media
  scale_shape_manual(
    name = "Indicator",            
    values = c("Mean" = 16)        
  )
