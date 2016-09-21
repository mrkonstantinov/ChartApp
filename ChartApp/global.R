library(RSQLite)
library(DBI)

sqlite <- dbDriver("SQLite")
conn <- dbConnect(sqlite, "FxCommonDb.db")
pairs.query <- dbSendQuery(conn, "SELECT CurrencyPairId, Pair FROM vCurrencyPairs")
pairs.data <- dbFetch(pairs.query, n = -1)
pairs.list <- setNames(as.list(pairs.data[,1]), pairs.data[,2])


dbDisconnect(conn)



