##### przykład 1 (baza Cereals) #####
View(Cereals)

# Wyświetlmy statystyki opisowe dla poszczególnych zmiennych z bazy Cereals
summary(Cereals)

# Zobaczmy jak korelują się ze sobą poszczególne zmienne
library(dplyr)
Cereals_1 <- select(Cereals, calories:rating)
Cereal_1_cor <- cor(Cereals_1, method = "pearson", use = "complete.obs")
View(Cereal_1_cor)
round(Cereal_1_cor, digits = 2)

# zobaczmy sobie jaka zmienna koreluje się najlepiej ze zmienną "rating"
# (przy okazji zaokrąglimy wyniki):

rating_cor <-
  round(
    cor(Cereals_1$rating,
        Cereals_1,
        use = "complete.obs"),
    digits = 2
  )
rating_cor

# zobaczmy, czy korelacja pomiędzy  rating a sugars jest istotna statystycznie:
cor.test(
  Cereals_1$rating,
  Cereals$sugars,
  use = "complete.obs"
)

# narysujmy wykres rozrzutu, aby lepiej zobaczyć tę zależność:
library(ggplot2)
ggplot(Cereals, aes(sugars, rating)) +
    geom_point() +
    geom_smooth(method = "lm")

# Znajdżmy równanie regresji dla zmiennych rating (zmienna objaśniana)
# i sugars (zmienna objaśniająca)
rating_model <- lm(Cereals$rating ~ Cereals$sugars)
summary(rating_model)

# Sprawdż w bazie Cereals, czy dla płatków o zawartości cukrów = 5g
# wartość odżywcza rzeczywiście wynosi 47.6
Cereals %>%
    select(name, sugars, rating) %>%
    filter(sugars == 5)

# Zobaczmy jeszcze raz jak to wygląda na wykresie:
ggplot(Cereals, aes(sugars, rating)) + geom_point() + geom_smooth(method = "lm")

# Sprawdźmy, czy błędy predykcji dla naszego modelu są równomiernie
# rozłożone wokół 0
plot(rating_model$residuals)

# sprawdźmy, czy błędy mają rozkład normalny
hist(rating_model$residuals)

### 1/4 ZAJĘĆ ###

# zastosujmy test Shapiro-Wilka
shapiro.test(rating_model$residuals)

# sprawdźmy jeszcze wizualnie za pomocą wykresu QQ
qqnorm(rating_model$residuals)
qqline(rating_model$residuals)

# współczynnik determinacji
summary(rating_model)
summary(rating_model)$r.square

# obliczmy jeszcze raz współczynnik korelacji dla zmiennych rating i sugars:
cor(Cereals_1$rating, Cereals$sugars, use = "complete.obs")
cor(Cereals_1$rating, Cereals$sugars, use = "complete.obs") ^ 2


##### przykład 2 (dane dendro i meteo) #####
install.packages("dplR")
library(dplR)

# wczytujemy plik z chronologią:
swed017_res <- read.crn("swed017_res.txt")

# zobaczmy początek danych:
head(swed017_res)

# narysujmy chronologię:
plot(swed017_res)

# władujmy dane gridowe (przez: import dataset, UWAGA:
# przy importowaniu danych należy ustawić "row names" na
# "use first column”)

# zobaczmy jak wyglądają dane
is(tmp_swed017)
tmp_swed017 <- as.vector(as.matrix(tmp_swed017))

# wyrysujmy dane w postaci wykresu liniowego:
plot(tmp_swed017, t = "l")

### POŁOWA ###

# wyrysujmy dane dla jednego miesiąca, np. maja:
plot(tmp_swed017[seq(5, 1440, 12)], t = "l")

### uwaga:kod w liniach od 63 do 85 służy do zestawienia powyzszych
# danych w jedną ramkę "swed017_data_cut" ###

### aby zaoszczędzić czas użyjemy już gotowej (władowujemy plik
# "swed017_data_cut") ###

################################################################

# ramka danych zawierająca dane temperaturowe
tmp5 <- round(tmp_swed017[seq(5, 1440, 12)], digits = 1)
tmp6 <- round(tmp_swed017[seq(6, 1440, 12)], digits = 1)
tmp7 <- round(tmp_swed017[seq(7, 1440, 12)], digits = 1)
tmp8 <- round(tmp_swed017[seq(8, 1440, 12)], digits = 1)
tmp9 <- round(tmp_swed017[seq(9, 1440, 12)], digits = 1)
tmp_swed017 <-
  data.frame(year = c(1901:2020), tmp5, tmp6, tmp7, tmp8, tmp9)
View(tmp_swed017)

# Wróćmy do chronologii
View(swed017_res)

# ramka z chronologią do połączenia z ramką tmp_swed017
swed017_chron <- select(swed017_res, swed017 = SWED01, -samp.depth)

# kolumną, którą połączymy obie ramki będzie "year", ale musi być to
# zmienna, dlatego:
swed017_chron$year <- as.integer(row.names(swed017_chron))
View(swed017_chron)

# jeszcze zmieńmy kolejność kolumn:
swed017_chron <- select(swed017_chron, year, swed017)
View(swed017_chron)

# łączymy ramki danych (tzn. ramkę z chronologią z ramką z danymi tmp.):
swed017_data <- right_join(swed017_chron, tmp_swed017, by = "year")
View(swed017_data)

# dane zostały przycięte - zaczynają się od roku danych temperaturowych

# przytnijmy dane do roku, w którym kończy się chronologia, aby
# wszystkie dane miały ten sam zakres czasowy:
swed017_data_cut <- filter(swed017_data, year <= 1978)
View(swed017_data_cut)

##############################################################

### 3/4 ZAJĘĆ ###
View(swed017_data_cut)

# zaczynamy analizę
cor(swed017_data_cut$swed017, swed017_data_cut)

# sprawdźmy istotność najlepszych korelacji
cor.test(swed017_data_cut$swed017, swed017_data_cut$tmp6)
cor.test(swed017_data_cut$swed017, swed017_data_cut$tmp7)

# sprawdźmy, czy nie uzyskalibyśmy wyższej korelacji dla chronologii
# ze średnią uzyskaną z tych dwóch miesięcy

# tworzymy więc dodatkową zmienną tmp_lato, będącą średnią z okresu
# czerwiec-lipiec
swed017_data_cut <- mutate(swed017_data_cut, tmp_lato = (tmp6 + tmp7) / 2)
View(swed017_data_cut)

# narysujmy teraz wykres rozrzutu dla zmiennej tmp_lato oraz chronologii swed017
ggplot(swed017_data_cut, aes(tmp_lato, swed017)) + geom_point()

# wrysujmy linię regresji
ggplot(swed017_data_cut, aes(tmp_lato, swed017)) +
  geom_point() +
  geom_smooth(method = "lm")

# znajdźmy równanie regresji (chronologia - zmienna objaśniana, temperatura
# lata - zmienna objaśniająca):
rating_model_swed017 <-
  lm(swed017_data_cut$swed017 ~ swed017_data_cut$tmp_lato)
summary(rating_model_swed017)

# ocena jakości modelu

## sprawdźmy, czy błędy są rozrzucone wokół 0:
plot(rating_model_swed017$residuals)

## narysujmy histogram błędów:
hist(rating_model_swed017$residuals)

## wykonajmy test Shapiro-Wilka:
shapiro.test(rating_model_swed017$residuals)

# narysujmy jeszcze wykres QQ:
qqnorm(rating_model_swed017$residuals)
qqline(rating_model_swed017$residuals)
