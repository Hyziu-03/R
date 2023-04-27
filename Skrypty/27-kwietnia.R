# wartości nietypowe
View(diamonds)
ggplot(diamonds, aes(y)) + geom_histogram(binwidth = 0.5)
ggplot(diamonds, aes(y)) + 
  geom_histogram(binwidth = 0.5) + 
  coord_cartesian(ylim = c(0, 50))
diamonds %>% filter(y < 3 | y > 20) %>% arrange(y)

# wartości nietypowe - pominięcie
diamonds2 <- diamonds %>% filter(between(y, 3, 20))
ggplot(diamonds2, aes(y)) + geom_histogram()

#wartości nietypowe - zastapienie
diamonds3 <- diamonds %>% mutate(y = ifelse(y < 3 | y > 20, NA, y))

## sprawdzmy, czy zostały usunięte
filter(diamonds3, y < 3 | y > 20)
ggplot (diamonds, aes(x, y)) + geom_point()
ggplot (diamonds3, aes(x, y)) + geom_point()

##### statystyki opisowe #####
ggplot(diamonds, aes(carat)) + geom_histogram(binwidth = 0.25)
ggplot(diamonds, aes(carat)) + geom_boxplot()

# wartość średnia
mean(diamonds$carat)
mean(diamonds$carat, trim = 0.1)

# mediana
median(diamonds$carat) 

# moda
find_mode <- function(x) {
  # unikalne wartości
  u <- unique(x)
  tab <- tabulate(match(x, u))
  # wartość maksymalna
  u[tab == max(tab)]
}
find_mode(diamonds$carat)

# wariancja i odchylenie standardowe
var(diamonds$carat)
sd(diamonds$carat)

# zakres wartości
range(diamonds$carat) 
max(diamonds$carat)
min(diamonds$carat)

# kwantyle, czyli części całości
a <- rnorm(8)
sort(a)
quantile(a)

# dla zmiennej carat:
quantile(diamonds$carat) 

# znajdżmy pierwszy decyl, pierwszy kwartyl, trzeci kwartyl, dziewiąty decyl
quantile(diamonds$carat, c(0.1, 0.25, 0.75, 0.9))

# średnia z 50% wartości środkowych
mean(diamonds$carat, trim = 0.25) 

# rozstęp międzykwartylowy
IQR(diamonds$carat) 

# statystyki opisowe dla wszystkich zmiennych w zbiorze diamonds
summary(diamonds)
summary(diamonds$carat)

# przykładowy histogram (z ustawionym zakresem danych i przedziałami, tytułem i opisami osi)
ggplot(katowice_t,aes(I)) +
  geom_histogram(breaks = seq(-10, 3.6, 1.8), fill = "orange", col = "grey") + 
  labs(title = "Styczeń", x = "Temperatura", y = "Częstość wystąpień") +
  theme_bw() + theme(text = element_text(size = 11))

# przykładowy wykres pudełkowy dla jednej zmiennej (z ustawionym ręcznie zakresem osi y):
ggplot(katowice_t, aes(I)) +
  geom_boxplot(fill = "orange", color = "blue") +
  scale_y_continuous(limits = c(-1,1))

# przykładowy wykres pudełkowy dla wielu zmiennych
boxplot(katowice_t[,2:13], border = "blue", col = "orange", 
  main = "Rozkład temperatur", xlab = "miesiące", ylab = "tmp [st.C]")

# przykładowy wykres liniowy 
ggplot(katowice_t, aes(Rok, I)) +
  geom_line(color = "orange") +
  geom_smooth(method = "lm", color = "red")
