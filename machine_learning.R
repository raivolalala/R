library(caret)
data(iris)

my.data <- iris
validation.index <- createDataPartition(my.data$Species,
					p = 0.8,
					list = FALSE)
validation <- my.data[-validation.index,]
dataset <- my.data[validation.index,]

# Define input and output
x <- dataset[,1:4]
y <- dataset[,5]
################################################ Visuals start

# Univariate plots
# Boxplot for each attribute on one image
#par(mfrow=c(1,4))
#for(i in 1:4) {
#	boxplot(x[,i], main = names(iris)[i])
#}

# Barplot for class breakdown
#plot(y)

# Multivariate plots. TODO: THE BELOW DOESN'T FUCKING WORK!! NOTHING!!!
# Scatterplot matrix
#featurePlot(x=x, y=y, plot="ellipse")

# Box and whisker plots for each attribute
print(featurePlot(x=x, y=y, plot="box"))
plot(dataset)
################################################ Visuals end
