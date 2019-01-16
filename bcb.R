library(jsonlite)
library(tidyverse)

bcb <- function(x = 24363){
  read_json(paste0("http://api.bcb.gov.br/dados/serie/bcdata.sgs.", x, "/dados?formato=json"),
                    simplifyVector = TRUE) %>%
          as.tibble() %>% 
          mutate(valor = as.numeric(valor)) %>% 
          mutate(data = as.Date(data,"%d/%m/%Y")) 
  }

bcb_ts <- function(x = 24363){
   valor <- read.csv2(paste0("http://api.bcb.gov.br/dados/serie/bcdata.sgs.",
                   x,
                   "/dados?formato=csv"))
    valor2 = valor$valor
    ano = as.numeric(substr(valor$data[1], 7, 10))
    mes = as.numeric(substr(valor$data[1], 4, 5))
    return(ts(valor2, start = c(ano,mes), frequency = 12))
}
