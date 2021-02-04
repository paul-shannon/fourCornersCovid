library(httr)

#----------------------------------------------------------------------------------------------------
countyInfectionStats <- function(state, county)
{
    urlCountyInfectionStats <- paste0(
        "https://knowi.com/api/data/ipE4xJhLBkn8H8jisFisAdHKvep",
        "FR5I4bGzRySZ2aaXlJgie?entityName=County%207%20day%20growth",
        "%20rates&exportFormat=csv&c9SqlFilter=select%20*%20where",
        "%20County%20like%20",
        gsub(" " , "%20", county),
        "%20County%20AND%20State%20like%20",
        gsub(" " , "%20", state)
        )
    x <- GET(urlCountyInfectionStats)
    class(x)
    contents <- content(x, as="parsed")
    class(contents)
    nchar(contents) #1M+
    read.csv(text=contents)

} # countyInfectionStats
#----------------------------------------------------------------------------------------------------
apache.population <-  71511
king.population <- 2253000

tbl.apache <- countyInfectionStats("Arizona", "Apache")
tbl.king <- countyInfectionStats("Washington", "King")
king.deaths <- rev(subset(tbl.king, Type=="Deaths")$values)
apache.deaths <- rev(subset(tbl.apache, Type=="Deaths")$values)
fivenum(king.deaths)

plot(100000 * apache.deaths/apache.population, main="Cumulative county deaths per 100k", col="blue", ylab="Deaths", xlab="Day")
points(100000 * king.deaths/king.population, col="brown")

legend(23, 350, c("Apache AZ", "King WA"), c("blue", "brown"))
