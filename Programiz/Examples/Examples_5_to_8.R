# Generate random numbers

# Uniform distribution 

random_number = runif(1)
random_number

random_numbers = runif(10, min=10, max=100)
random_numbers

# Random distribution

random_number = rnorm(1)
random_number

random_numbers = rnorm(10, mean=50, sd=10)
random_numbers

# Sample for a population

population = c(23, 45, 67, 89, 10)
population

sample(population, 2)

coin = c("Heads", "Tails")
tosses = sample(coin, 10, replace = TRUE)
tosses

# Minimum and maximum in a vector

vector = c(98, 76, 54, 32, 10)

minimum = min(vector)
minimum

maximum = max(vector)
maximum

value_range = range(vector)
value_range

# Sort a vector

vector = c(56, 23, 89, 76, 12, 90)

sorted = sort(vector)
sorted

sorted = sort(vector, decreasing = TRUE)
sorted

vector
