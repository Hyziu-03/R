ggplot(
  mtcars,
  aes(wt, mpg)
) + geom_point(
      aes( 
        size=qsec, 
        colour=factor(cyl),
        shape=factor(gear)
      )
    )

rodents <- combined %>% 
  filter(taxa=="Rodent") %>% # selecting taxa
  mutate(species_full=paste(genus, species)) # adding new column

ggplot(rodents, aes(weight, hindfoot_length)) + geom_point(
  aes(colour=factor(species_full))
)

ggplot(rodents, aes(weight, hindfoot_length)) + geom_point(
  alpha=0.1, aes(colour=factor(species_full))
) + theme_gray(base_size=7)

ggplot(rodents, aes(weight, hindfoot_length)) + 
geom_point(alpha=0.1, aes(colour=species_full)) + 
guides(color = guide_legend(ncol1)) + 
theme(
  legend.text = element_text(size=8),legend.key.size = unit(0.5, 'cm')
)

ggplot(mpg,aes(fl)) + geom_bar(aes(fill=fl)) + scale_fill_grey(start=0.2, end=0.8)

set.seed(201)
n <- 100
dat <- data.frame(
  x_value=(1:n + rnorm(n, sd=5)) / 20, 
  y_value=10^((1:n + rnorm(n, sd=5)) / 20)
)
head(dat)
View(dat)
ggplot(dat, aes(x_value, y_value)) + geom_point()
ggplot(dat, aes(x_value, y_value)) + geom_point() + scale_y_log10()
