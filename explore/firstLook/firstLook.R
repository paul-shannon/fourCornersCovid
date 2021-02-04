# navajo county, 111k estimated population 2020
# zip codes:
zipCodes <- c("85902", "85901", "85912", "85923", "85928", "85929", "85934", "85933", "85935", "85937", "85939",
              "85942", "86025", "86029", "86032", "86034", "86033", "86039", "86043", "86510")
library(httr)

url <- "https://knowi.com/api/data/ipE4xJhLBkn8H8jisFisAdHKvepFR5I4bGzRySZ2aaXlJgie?entityName=States%20Testing%20Historical&exportFormat=csv"
url.count <- "https://knowi.com/api/data/ipE4xJhLBkn8H8jisFisAdHKvepFR5I4bGzRySZ2aaXlJgie?entityName=County%20Testing%20Historical&exportFormat=csv"

stateName <- "Arizona"
countyName <- "Apache"

    url <-
      paste0(
        "https://knowi.com/api/data/ipE4xJhLBkn8H8jisFisAdHKvep",
        "FR5I4bGzRySZ2aaXlJgie?entityName=County%207%20day%20growth",
        "%20rates&exportFormat=csv&c9SqlFilter=select%20*%20where",
        "%20County%20like%20",
        gsub(" " , "%20", countyName),
        "%20County%20AND%20State%20like%20",
        gsub(" " , "%20", stateName))

url3 <- sprintf("https://knowi.com/api/data/ipE4xJhLBkn8H8jisFisAdHKvep",
                "FR5I4bGzRySZ2aaXlJgie?entityName=County%207%20day%20growth",
        "%20rates&exportFormat=csv&c9SqlFilter=select%20*%20where",
        "%20County%20like%20",
        gsub(" " , "%20", countyName),
        "%20County%20AND%20State%20like%20",
        gsub(" " , "%20", stateName))

url.base <- "https://knowi.com/api/data/ipE4xJhLBkn8H8jisFisAdHKvepFR5I4bGzRySZ2aaXlJgie"
entity <- sprintf("entityName=%s", "States%20Testing%20Historical")
format <- "exportFormat=csv"
filter <- paste0("c9SqlFilter=select%20*%20where%20State%20like%20", "Arizona")
filter <- paste0("c9SqlFilter=select%20*%20where%20State%20like%20", "Arizona", "%20AND%20County%20like%20Apache")
url <- sprintf("%s?%s&%s&%s", url.base, entity, format, filter)



x <- GET(url)
class(x)
contents <- content(x, as="parsed")
class(contents)
nchar(contents) #1M+
tbl <- read.csv(text=contents)
dim(tbl)
head(tbl)
tail(tbl)
tbl.az <- subset(tbl, State=="Arizona")
dim(tbl.az)
