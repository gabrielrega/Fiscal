library(rsdmx)

ocde <- function(x = "RUS", y = "L"){
  
  url <- paste0("http://stats.oecd.org/restsdmx/sdmx.ashx/GetData/QNA/",
                x,
                ".B1_GE.",
                y,
                "NBQRSA.Q/all?startTime=2011-Q1")
  tmp <- tempfile(fileext = ".xml")
  download.file(url, tmp)
  
  
  readSDMX(tmp, isURL = FALSE) %>% 
    as_tibble() %>% 
    select(LOCATION, obsTime, obsValue) %>% 
    return()
  
}
