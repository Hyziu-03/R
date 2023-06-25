# Liczba dost�pnych pakiet�w

install.packages("languageserver")

nrow(available.packages())

# Zmienne

x <- 1
x

y <- 2
y

y <- c(23, 54, 16, 98, 70)
y

x + 10
y - 8

# R jest case-sensitive

X

# Przedzia�y

y[1]
1:20
y[1:3]

# Funkcje i pomoc

y
mean(y)

?mean
?? "standard deviation"

suma <- sum(y)
dlugosc <- length(y)
suma / dlugosc

srednia <- function(v) {
    sum(v, na.rm = TRUE) / length(v)
}
srednia(y)

mean(y) == srednia(y)

b <- c(89, NA, 64, 13, NA, 80, 46, NA, 85, 25)
b

srednia(b)
mean(b, na.rm = TRUE)
srednia(b) == mean(b, na.rm = TRUE)

?mean
?sum
?length

?na.omit

b

a <- sum(b > 50, na.rm = TRUE)
a

b <= 50
b == 80

print("Hello world")

ile_wartosci <- function(arg) {
    sum(arg <= 50, na.rm = TRUE)
}
ile_wartosci(b)

suma_wektora <- function(wektor) {
    sum(wektor > 50, na.rm = TRUE)
}
suma_wektora(b)

sekwencja <- seq(from = 10, to = 99, by = 1)

d <- rnorm(100000, mean = 0, sd = 10)
hist(d)

# Macierze i ramki

e <- matrix(1:9, ncol = 3)
e
f <- matrix(1:100, ncol = 8)
f
g <- matrix(5:8, ncol = 2)
g
g + 2
g[1, 1]

h <- rnorm(16)
i <- matrix(h, ncol = 4)
i

j <- data.frame(
    x = c(324, 865, 190),
    y = c("abc", "def", "ghi"),
    z = c(TRUE, FALSE, FALSE)
)
j
j$x == j[["x"]]
j[, 2]
