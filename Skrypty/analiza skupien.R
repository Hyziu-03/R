##### Klasteryzacja #####

library(dplyr)

# Przykład 1 #
# Załaduj plik „sudety_res.csv” (ustaw "headings" na "yes").
# Spójrz jak wygląda baza.
# Tworzymy ramkę tylko z chronologiami (usuwamy lata)

sudety_res1 <- sudety_res[, 2:22]

# To samo inaczej (w dplyr)

sudety_res1 <- select(sudety_res, -rok)

# Wykonujemy transpozycję
# (Chcemy grupować chronologie, a nie lata)
# Given a matrix or data.frame x,
# t returns the transpose of x.

sudety_res1_t <- t(sudety_res1)
View(sudety_res1_t)

# Teraz mozemy już grupować chronologie.
# Obiekty, które będziemy grupować stanowią wiersze.


## Ustalamy odległość (metoda wyliczania: euklidesowa) ##

d <- dist(sudety_res1_t, method = "euclidean")

## I grupujemy (z wykorzystaniem metody wiązania Warda) ##

fit <- hclust(d, method = "ward.D")

# Narysujmy wynik - dendrogram

plot(fit)

# Narysujmy drzewo z wydzielonymi klastrami
# (Ustalmy ich liczbę na 3)

rect.hclust(fit, k = 3, border = "#800000")

# Zainstaluj i załaduj pakiet amap

install.packages("amap")
library(amap)

# Grupowanie chronologii metodą Warda, z dystansem korelacja
# (Wsp. korel. Pearsona)

fit <- hcluster(
  sudety_res1_t,
  method = "correlation",
  link = "ward"
)

plot(fit)
rect.hclust(fit, k = 3, border = "#800000")

# Przykład 2
# Załaduj plik "tempVII.txt"
# Tworzymy ramkę bez kolumny "rok"

tempVII_1 <- tempVII[2:13]

# Transpozycja

temp_VII_1_t <- t(tempVII_1)
fit <- hcluster(
  temp_VII_1_t,
  method = "euclidean",
  link = "ward"
)
plot(fit)

fit <- hcluster(
  temp_VII_1_t,
  method = "correlation",
  link = "ward"
)
plot(fit)

fit <- hcluster(
  temp_VII_1_t,
  method = "pearson",
  link = "ward"
)
plot(fit)

# Przykład 3: grupowanie metodą k-średnich
# Ściągnij i załaduj plik iris.data

View(iris)
?iris
str(iris)

# Usuwamy z danych ostatnią kolumnę ("class")

iris_gr <- iris[, 1:4]

# Grupujemy zakładając podział na 3 grupy

iris_kmeans <- kmeans(iris_gr, 3)
print(iris_kmeans)

# Struktura skupień

plot(iris_gr, pch = iris_kmeans$cluster)
plot(iris_gr, pch = 19, col = iris_kmeans$cluster)

# Wybór optymalnej liczby klastrów

print(iris_kmeans)
summary(iris)
plot(iris_kmeans$cluster, xlab = "kolejne osobniki")

## Metoda "łokcia" ##

k <- 20
wss_1 <- sapply(1:k, function(k) {
  kmeans(iris_gr, k)$tot.withinss
})

plot(
  1:k,
  wss_1,
  type = "b",
  pch = 16,
  xlab = "liczba klastrów",
  ylab = "łączna suma wariancji klastrów",
  col = "#000080"
)
grid()

# Dodanie linii odcięcia

abline(v = 3, lty = 2)
