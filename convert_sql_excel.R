library(RODBC)

sqlServer <- "raivoclout.database.windows.net"  #Enter Azure SQL Server
sqlDatabase <- "fromPS"                #Enter Database Name
sqlUser <- "admraivo"             #Enter the SQL User ID
sqlPassword <- "$dmR4!v0"        #Enter the User Password
sqlDriver <- "SQL Server"        #Leave this Drive Entry

connectionStringSQL <- paste0(
  "Driver=", sqlDriver,
  ";Server=", sqlServer,
  ";Database=", sqlDatabase,
  ";Uid=", sqlUser,
  ";Pwd=", sqlPassword,
  ";Encrypt=yes",
  ";Port=1433")

sql_query <-  c('SELECT * FROM dbo."f_iss_coordinates";')

conn <- odbcConnect(connectionStringSQL)
sqlDataFrame <- sqlQuery(conn, sqlQuery)
close(conn)
