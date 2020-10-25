library(caret)
data(iris)

dataset <- iris
validation.index <- createDataPartition(dataset$Species,
					p = 0.8,
					list = FALSE)
validation <- dataset[-validation.index,]
dataset <- dataset[validation.index,]

x <- dataset[,1:4]
y <- dataset[,5]
################################################ Visuals start

##################### Univariate plots
# Boxplot for each attribute on one image
#par(mfrow=c(1,4))
#for(i in 1:4) {
#	boxplot(x[,i], main = names(iris)[i])
#}

# Barplot for class breakdown
#plot(y)

##################### Multivariate plots
# Scatterplot matrix
# TODO: Func below breaks...
#print(featurePlot(x=x, y=y, plot="ellipse", auto.key=list(columns=3)))

# TODO: works only when put in print atrocity...
print(featurePlot(x=x, y=y, plot="box"))

# TODO: Below func returns NULL...
#print(featurePlot(x=x, y=y, plot="scatter"))

################################################ Visuals end
