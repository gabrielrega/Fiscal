library(jsonlite)
library(tidyverse)

bcb <- function(x = 24363){
  read_json(paste0("http://api.bcb.gov.br/dados/serie/bcdata.sgs.", x, "/dados?formato=json"),
                    simplifyVector = TRUE) %>%
          as.tibble() %>% 
          mutate(valor = as.numeric(valor)) %>% 
          mutate(data = as.Date(data,"%d/%m/%Y")) 
  }
