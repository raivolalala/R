##################### Normal approach
filenames <- list.files(path = '~/Documents/COVID19_data', full.names = TRUE)
data <- sapply(
	       filenames, 
	       function(x){
		       read.csv2(x, header = FALSE, sep = ":")
	       }
	)

#print(data[,19])
print(data)
