library(RODBC)

sqlServer <- c("raivoclout.database.windows.net")	#Enter Azure SQL Server
sqlDatabase <- c("fromPS") 	               		#Enter Database Name
sqlUser <- c("admraivo")             			#Enter the SQL User ID
sqlPassword <- c("$dmR4!v0")        			#Enter the User Password
sqlDriver <- c("SQL Server")        			#Leave this Drive Entry

conn_string <- paste0(
  "Driver=", sqlDriver,
  ";Server=", sqlServer,
  ";Database=", sqlDatabase,
  ";Uid=", sqlUser,
  ";Pwd=", sqlPassword,
  ";Encrypt=yes",
  ";Port=1433")

sql_query <- c('SELECT * FROM dbo."f_iss_coordinates";')

conn <- odbcConnect(conn_string)
sqlDataFrame <- sqlQuery(conn, sqlQuery)
close(conn)
csv.write(sqlDataFrame,  'iss_coordinates.csv')
