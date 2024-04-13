# Actividad Ciencia de datos Fase 1 (Practicando con R)
# Juan David Yanayaco Sáenz
# Fundamentos de la ciencia de datos

# Ejercicio 1 -------------------------------------------------------------

# Crear un conjunto de datos de 30 estudiantes de un curso de Fundamentos de 
# ciencia de datos, los datos que se deben relacionar por cada estudiante son:
# Sexo
# Edad
# Estatura
# Nota
# Ciudad

df <- read.csv('https://raw.githubusercontent.com/JuanYanaya88/Ciencia-de-datos/main/Actividad%20Ciencia%20de%20datos%20R.csv', 
               sep = ';')
getwd()
list.files()
colnames(df) <- c('Sexo','Edad','Estatura','Nota','Ciudad')
colnames(df)
View(df)
str(df)
# Coercion de datos
df$Estatura <- gsub(pattern = '[,]',replacement = '.',x = df$Estatura)
df$Estatura <- as.numeric(df$Estatura)
df$Nota <- gsub(pattern = '[,]',replacement = '.',x = df$Nota)
df$Nota <- as.numeric(df$Nota)
str(df)

# 1. Realizar una tabla de frecuencias absolutas y otra de frecuencias relativas 
# para la variable Calificación. Almacena las tablas anteriores en dos variables
# y llámalas absolutas y relativas.

table(df$Nota) # Frecuencia absoluta
100*prop.table(table(df$Nota)) # Frecuencia relativa

# 2. Representar la variable ciudad mediante un diagrama de barras y un diagrama 
# de sectores. Incluye un título adecuado para cada gráfico y colorea las barras
# y los sectores de colores diferentes.

barplot(table(df$Ciudad),main = 'Gráfico de barras por ciudad',
        ylab = 'Frecuencia',xlab = 'Ciudad', col = 'yellow', 
        horiz = T, xlim = c(0,30), density = 30,cex.names = par("cex.axis"))
grid(col = 'blue')

pie(prop.table(table(df$Ciudad)),main = 'Diagrama de sectores',col = c('Green','Violet','Pink'))

# 3. Para la variable Edad, realizar un histograma y un diagrama de caja y 
# bigotes considerando la opción range = 1.5. Incluye un título apropiado para 
# cada gráfico y colorea las barras del histograma de color amarillo. ¿Existe
# algún valor atípico en esta variable? Reduce el valor del argumento range
# hasta 0.5. ¿Varían las conclusiones?

hist(df$Edad, col = 'yellow', main = 'Histograma edad') # Histograma
boxplot(df$Edad,col = 'red', main = 'Boxplot edad',
        range = 1.5) # Diagrama de caja y bigotes
table(df$Edad)
mean(df$Edad)

# ¿Existe algún valor atípico en esta variable?
# En esta variable con un rango de 1.5 no se encuentra ningún valor atípico.

bx <- boxplot(df$Edad,col = 'red', main = 'Caja de edad',
              range = 0.5) # Diagrama de caja y bigotes
bx$out

# ¿Varían las conclusiones?
# Si varía, ya que con un rango de 0.5 obtenemos un valor atípico en la variable.

# 4. Realizar un resumen de la variable Puntuación mediante la orden summary.
# Comprueba que las medidas que proporciona summary coinciden con las medidas
# calculadas de forma individual usando su función específica.

summary(df)
str(df$Nota)

summary(df$Nota)
min(df$Nota)
max(df$Nota)
quantile(df$Nota)
median(df$Nota)
mean(df$Nota)

# 5. Calcular la estatura media de los estudiantes y proporcionar al menos, dos
# medidas que indiquen la dispersión de esta variable.

var(df$Estatura)
sd(df$Estatura)
mean(df$Estatura)
100* sd(df$Estatura) / mean(df$Estatura) # >15% es dispersa

# 6. Conclusiones

# 1. Distribución de las calificaciones: La mayoría de los estudiantes 
# obtuvieron una calificación de 3.5.
# 2. Bogota tiene la mayor cantidad de estudiantes, seguida por Cali y Medellín.
# 3. La estatura promedio es de 1.67.


# Ejercicio 2 -------------------------------------------------------------

SexoA <- factor(c('Mujer', 'Hombre', 'Mujer', 'Mujer', 'Mujer', 'Hombre', 'Mujer',  'Hombre', 'Hombre', 'Mujer', 'Mujer' ,'Hombre', 'Hombre', 'Mujer', 'Mujer', 'Hombre', 'Mujer', 'Mujer', 'Mujer', 'Mujer' ), levels = c('Mujer', 'Hombre'))

EdadA <- c(25, 30, 28, 20, 23, 22, 22, 22, 21, 21, 22, 20, 22, 29, 29, 21, 30, 21, 22, 23)

EstaturaA <- c(1.82, 1.83, 1.78, 1.79, 1.80, 1.90, 1.79, 1.83, NA, 1.65, 1.73, 1.79, 1.80, 1.77, 1.69, 1.75, 1.66, NA, 1.79, 1.80)

GrupSangA <- c('A', 'B', 'A', 'AB', '0', 'A', 'B', 'A', 'B', 'AB', 'A', 'B', '0', '0', 'A', 'B', 'AB', 'B', 'B', 'B')

GrA<- data.frame (SexoA,EdadA, EstaturaA, GrupSangA)
GrA

SexoB <- factor(c('Mujer', 'Hombre', 'Mujer', 'Mujer', 'Mujer', 'Hombre', 'Mujer',  'Hombre', 'Hombre', 'Mujer', 'Mujer' ,'Hombre', 'Hombre', 'Mujer', 'Mujer', 'Hombre', 'Mujer', 'Mujer', 'Mujer', 'Mujer' ), levels = c('Mujer', 'Hombre'))

EdadB <- c(25, 30, 38, 26, 23, 22, 32, 26, 25, 28, 22, 30, 22, 39, 29, 25, 30, 23, 32, 33)

EstaturaB <- c(1.72, 1.73, 1.78, 1.79, 1.83, 1.90, 1.79,1.83, NA, 1.75, 1.79, 1.79, 1.85, 1.77, 
               1.79, 1.75, 1.66, NA, 1.79, 1.83)

GrupSangB <- c('B', 'B', 'A', 'AB', '0', 'AB', 'B', 'B', 'B', 'AB', 'A', 'B','0', '0', 'B',
               'B', 'A', '0', 'B', 'B')

GrB<- data.frame (SexoB,EdadB, EstaturaB, GrupSangB)
GrB

install.packages("moments")
library("moments")

# 1. Representar la variable Grupo Sanguíneo mediante un diagrama de sectores en
# cada uno de los grupos. Incluir un título descriptivo en cada gráfico y 
# colorear los sectores de azul, amarillo, rosa y verde.

colores <- c('blue', 'yellow', 'pink', 'green')

# Diagrama de sectores para Grupo Sanguineo (GrA)
datos_GrA <- table(GrA$GrupSangA)
pie(datos_GrA, col = colores, main = 'Diagrama de sectores para  Grupo Sanguineo (GrA)')

# Diagrama de sectores para Grupo Sanguineo (GrB)
datos_GrB <- table(GrB$GrupSangB)
pie(datos_GrB, col = colores, main = 'Diagrama de sectores para Grupo Sanguineo (GrB)')


# 2. Representar la variable Estatura mediante un histograma en cada uno de los
# grupos.

# Histograma para Estatura (GrA)
datos_EstaturaA <- table(GrA$EstaturaA)
hist(datos_EstaturaA, col = "pink", main = "Histograma para Estatura grupo A", xlab="Estatura", ylab="Frecuencia")

# Histograma para Estatura (GrB)
datos_EstaturaB <- table(GrB$EstaturaB)
hist(datos_EstaturaB, col = "purple", main = "Histograma para Estatura grupo B", xlab="Estatura", ylab="Frecuencia")


# 3. ¿Existe algún dato atípico en la variable Edad en el grupo A?
# ¿Y en el grupo B?

# Cajas y bigotes de la Edad (GrA)
datos_EdadA <- GrA$EdadA
boxplot(datos_EdadA, xlab="Edad", main = "Cajas y bigotes de la Edad grupo A")

# No existe un dato atípico en la variable edad en el grupo A.

# Cajas y bigotes de la Edad (GrB)
datos_EdadB <- GrB$EdadB
boxplot(datos_EdadB, xlab="Edad", main = "Cajas y bigotes de la Edad grupo B")

# No existe un dato atípico en la variable edad en el grupo B.


# 4. ¿Cuál es el valor máximo del 40% de las estaturas más pequeñas de los 
# individuos en el grupo A? ¿Y el valor mínimo del 30% de las estaturas mayores 
# de los individuos en el grupo B?

# Cuantil para Estatura (GrA)
datos_EstaturaA <- GrA$EstaturaA
quantile(datos_EstaturaA, na.rm = TRUE, probs = c(0.40))

# El valor máximo de las estaturas mas pequeñas del 40% en el grupo A es de 1.788

# Cuantil para Estatura (GrB)
datos_EstaturaB <- GrB$EstaturaB
quantile(datos_EstaturaB, na.rm = TRUE, probs = c(0.70))

# El valor mínimo de las estaturas mas mayores del 30% en el grupo B es de 1.79

# 5. ¿Dónde son las variables edad y estatura más homogéneas: en el grupo A o en el B?

media_Edad_A <- mean(GrA$EdadA, na.rm = TRUE)
var_Edad_A <- 19/20 * var(GrA$EdadA, na.rm = TRUE)
dt_Edad_A <- sqrt(var_Edad_A)
CV_Edad_A <- dt_Edad_A/media_Edad_A
CV_Edad_A

media_Edad_B <- mean(GrB$EdadB, na.rm = TRUE)
var_Edad_B <- 19/20 * var(GrB$EdadB, na.rm = TRUE)
dt_Edad_B <- sqrt(var_Edad_B)
CV_Edad_B <- dt_Edad_B/media_Edad_B
CV_Edad_B

# La edad con las variables mas homogeneas estan en el grupo A con 0.143.

media_Est_A <- mean(GrA$EstaturaA, na.rm = TRUE)
var_Est_A <- 19/20 * var(GrA$EstaturaA, na.rm = TRUE)
dt_Est_A <- sqrt(var_Est_A)
CV_Est_A <- dt_Est_A/media_Est_A
CV_Est_A

media_Est_B <- mean(GrB$EstaturaB, na.rm = TRUE)
var_Est_B <- 19/20 * var(GrB$EstaturaB, na.rm = TRUE)
dt_Est_B <- sqrt(var_Est_B)
CV_Est_B <- dt_Est_B/media_Est_B
CV_Est_B

# La Estatura con las variables más homogéneas estan en el Grupo B con 0.029.

# 6. ¿En qué grupo presentan los individuos una altura media mayor? ¿En qué grupo
# presentan los individuos una altura mediana menor?

mean(GrA$EstaturaA, na.rm = TRUE)
median(GrA$EstaturaA, na.rm = TRUE)

mean(GrB$EstaturaB, na.rm = TRUE)
median(GrB$EstaturaB, na.rm = TRUE)

# En el grupo A se encuentra la media mayor y en ambos esta la mediana menor.

# 7. Estudia la asimetría y la curtosis de la variable Estatura en el grupo A.

skewness(GrA$EstaturaA, na.rm = TRUE) # Asimetria de -0.50
kurtosis (GrA$EstaturaA, na.rm = TRUE) # Curtosis de 3.18

# 8. Conclusiones

# En el grupo A, los grupos de sangre mas repetidos eran A y B.
# En el grupo B, los grupos de sangre mas repetido era O.
# La variable de estatura mas homogenea se encontraba en el grupo B.
# La variable de edad mas homogenea se encuentra en el grupo A.
# No hay valores atípicos.



