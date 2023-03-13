# Add two vectors 

v = c(12, 34, 56, 78, 90)
u = c(98, 76, 54, 32, 10)

sum <- v + u
sum

add_vectors <- function(u, v) { v + u }
add_vectors(v, u)

# Find sum, mean and product of vector

sum(v, na.rm = TRUE)
mean(v, na.rm = TRUE)

?? "product of a vector"

prod(v, u, na.rm = TRUE)

# Take input from user

?? "input"

variable = readline(prompt = "Enter something: ")
variable

