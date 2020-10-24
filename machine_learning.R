library(caret)
data(iris)

my.data <- iris
validation.index <- createDataPartition(my.data$Species,
					p = 0.8,
					list = FALSE)
validation <- my.data[-validation.index,]
dataset <- my.data[validation.index,]

# split input and output
x <- dataset[,1:4]
y <- dataset[,5]

par(mfrow=c(1,4))
for(i in 1:4) {
	boxplot(x[,i], main = name(iris)[i])
}
