library(RODBC)

creds <- read.csv('~/Documents/Creds/azure_server_creds', header = FALSE)

sqlServer <- creds[1,2]
sqlDatabase <- creds[2,2]
sqlUser <- creds[3,2]
sqlPassword <- creds[4,2]
sqlDriver <- creds[5,2]

conn_string <- paste0(
  "Driver=", sqlDriver,
  ";Server=", sqlServer,
  ";Database=", sqlDatabase,
  ";Uid=", sqlUser,
  ";Pwd=", sqlPassword
#  ";Encrypt=yes",
#  ";Port=1433")
  )

sql_query <- c('SELECT * FROM dbo."f_iss_coordinates";')

conn <- odbcConnect(conn_string)
sqlDataFrame <- sqlQuery(conn, sqlQuery)
close(conn)
csv.write(sqlDataFrame,  'iss_coordinates.csv')
