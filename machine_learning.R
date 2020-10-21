library(caret)
data(iris)

my.data <- iris
validation.index <- createDataPartition(my.data$Species,
					p = 0.8,
					list = FALSE)
validation <- my.data[-validation.index,]
dataset <- my.data[validation.index,]

