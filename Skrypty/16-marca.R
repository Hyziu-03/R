# wczytywanie i formatowanie pliku

colnames(lesko_p) <- c(
    "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", "X", "XI", "XII"
)

print(lesko_p)
head(lesko_p)
lesko_p

rownames(lesko_p) <- c(1955:2014)
head(lesko_p)

lesko_p[rownames(lesko_p) == "1970", ] # wiersz o nazwie 1970, wszystkie kolumny

# analiza danych

mean(lesko_p$"VII")

july <- lesko_p$"VII"
july

mean(july)

sum(lesko_p[rownames(lesko_p) == "1970", ])

avg_june <- mean(lesko_p$"VI")
avg_june

months_number <- sum(lesko_p$"VI" > avg_june)
months_number

sum(lesko_p$"VI"[lesko_p$"VI" > avg_june])
june <- lesko_p$"VI"
sum(june[june > avg_june])

colnames(lesko_p)[c(1, 2)] <- cbind("styczeń", "luty")
lesko_p

lesko_lato <- lesko[c(6:8)]
head(lesko_lato)

lesko_lato_jesien <- cbind(lesko_lato, lesko[c(9, 10)])
head(lesko_lato_jesien)

# pakiety

install.packages("tidyverse")

library(tidyverse) # załaduje pakiet tidyverse, który już został zainstalowany
library(dplyr)

install.packages("nycflights13")
library(nycflights13)

head(flights)
View(flights)
tail(flights)
colnames(flights)
str(flights)

select(flights, year, month, day)
colnames(flights)
select(flights, origin, dest, distance)
View(select(flights, origin, dest, distance))

View(krakow_balice_t)
wiosna <- select(krakow_balice_t, III, IV, V)
wiosna

View(select(flights, -tailnum))
View(select(krakow_balice_t, -rok))

View(select(flights, contains("time")))
View(select(flights, year, carrier, destination = dest))

colnames(krakow_balice_t)
View(select(krakow_balice_t, styczen = I, luty = II, marzec = III))

View(krakow_balice_t)

View(select(flights, contains("dep")))
View(select(
    flights,
    departure_time = dep_time,
    scheduled_departure_time = sched_dep_time,
    departure_delay = dep_delay
))

filter(flights, month == 12, day == 8)
filter(flights, month == 3, day == 24, dep_time > 1500)

filter(krakow_balice_t, VII >= 19, VIII >= 19)
filter(krakow_balice_t, I <= -7, II <= -7)
