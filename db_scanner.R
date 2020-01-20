# Contact me at lallo.raivo@gmail.com!
library(RMySQL)
library(tictoc)

# Enter your own user, password, database and host address!
connection = dbConnect(
  MySQL(),
  user = '',
  password = '',
  dbname = '',
  host = '')

# Pick your own name for your text file!
tables.list <- dbListTables(connection)
for (i in tables.list) {
  sink("your_text_file.txt", split = TRUE, append = TRUE)
  cat('\n############################################# NEW SCAN, TABLE:', i)
  my.table = dbSendQuery(
    connection, paste0("select * from ", i)
  )
  my.table <- fetch(my.table, n = -1)
  
  cat("\n Your table colnames:\n")
  print(names(my.table[,order(colnames(my.table))]))
  toc(log = TRUE, quiet = FALSE)
  tic(msg = 'Time elapsed for retrieving blanks: ')
  missing.from.my.table <- sapply(my.table, function(x) sum(is.na(x) | x==""))/nrow(my.table)
  cat("\n Columns with blanks more than 80%:\n")
  print(names(missing.from.my.table[missing.from.my.table > 0.8]))
  toc(log = TRUE, quiet = FALSE)
  tic(msg = 'Time elapsed for getting colnames: ')
  sink()
}

lapply(dbListConnections(dbDriver(drv = "MySQL")), dbDisconnect)
