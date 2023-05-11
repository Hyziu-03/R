#narysujmy wykres rozrzutu
ggplot(mtcars, aes(mpg, wt))+ geom_point()
#dodajmy do wykresu prostą regresji
ggplot(mtcars, aes(mpg, wt))+ geom_point()+ geom_smooth(method="lm")
#teraz narysuj wykres rozrzutu dla zmiennych drat (liczba obrotów silnika na obrót osi koła) i qsec (przyspieszenie)
ggplot(mtcars, aes(drat, qsec))+ geom_point()
#zadanie 1
cor( mtcars$mpg, mtcars$wt)
ggplot(mtcars, aes(mpg, wt))+geom_point()
#zadanie 2
cor( mtcars$mpg, mtcars$qsec)
ggplot(mtcars, aes(mpg, qsec))+geom_point()
#zadanie 3
cor(ci2_CRU2_1_t$VI, my1_CRU2_1_t$VI)
plot(ci2_CRU2_1_t$VI, my1_CRU2_1_t$VI, xlab="ci2_t_VI", ylab="my1_t_VI")
abline(lm(my1_CRU2_1_t$VI~ci2_CRU2_1_t$VI))
#zadanie 4
##Wybieramy co trzeba z istniejących ramek (select):
ci2_t_VI<-select(ci2_CRU2_1_t, rok, ci2_t_VI=VI)
my1_t_VI<-select(my1_CRU2_1_t, rok, my1_t_VI=VI)
##i tworzymy nową ramkę danych (left_join):
t_VI_my1_ci2<-left_join(ci2_t_VI, my1_t_VI, by="rok")
##inny sposób (select i data.frame):
ci2_t_VI <- select(ci2_CRU2_1_t, ci2_t_VI=VI)
my1_t_VI <- select(my1_CRU2_1_t, my1_t_VI=VI)
VI_t_my1_ci2<-data.frame(my1_t_VI, ci2_t_VI)
##i jeszcze wykres
ggplot(t_VI_my1_ci2, aes(ci2_t_VI, my1_t_VI))+geom_point()+geom_smooth(method="lm")
#zadanie 5
cor(ci2_CRU2_1_p$VI, my1_CRU2_1_p$VI)
plot(ci2_CRU2_1_p$VI, my1_CRU2_1_p$VI)
abline(lm(my1_CRU2_1_p$VI~ci2_CRU2_1_p$VI))
#zadanie 6
cor(karpacz_t$V, karpacz_p$V)
View(karpacz_t)
View(karpacz_p)
cor(karpacz_t$V, karpacz_p$V, use="complete.obs")
#obliczmy istotno?? statystyczn? korelacji dla zmiennych mpg i wt z bazy mtcarts:
cor.test( mtcars$mpg, mtcars$wt)
ggplot(mtcars, aes(mpg, wt))+geom_point()+geom_smooth(method="lm")
#zadanie 7
cor.test (karpacz_t$VII, jelenia_gora_t$VII, method="pearson", use="complete.obs")
jelenia_gora_t_1<-jelenia_gora_t[1:64,]
cor.test (karpacz_t$VII, jelenia_gora_t_1$VII, method="pearson", use="complete.obs")
##i jeszcze wykres
plot(karpacz_t$VII, jelenia_gora_t_1$VII)
abline(lm(jelenia_gora_t_1$VII~karpacz_t$VII))
#zadanie 8
ggplot (diamonds, aes(x, y)) + geom_point()
cor(diamonds$x, diamonds$y)
cor(diamonds$x, diamonds$y, method="spearman")
#korelogramy dla wielu zmiennych (tu dla 4 zmiennych):
pairs(~mpg+disp+drat+wt, data=mtcars)
#dla 6 zmiennych
pairs(mtcars [1:6])
#korelogramy dla macierzy korelacyjnych
install.packages("corrgram")
library(corrgram)
corrgram(mtcars, order=TRUE, 
         lower.panel=panel.shade,
         upper.panel=panel.pie, 
         text.panel=panel.txt, 
         main= "Car Milage Data")
