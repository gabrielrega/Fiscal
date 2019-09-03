library(tidyverse)

cambio_bcb <- function(codigo = 115) {
  hoje = format(Sys.Date(), "%d/%m/%Y")
  file = paste0("https://ptax.bcb.gov.br/ptax_internet/consultaBoletim.do?method=gerarCSVFechamentoMoedaNoPeriodo&ChkMoeda=", codigo, "&DATAINI=03/01/2015&DATAFIM=",hoje)
  read.table(file, header = FALSE, sep = ";", dec = ",") %>% as_tibble() %>% 
    mutate(data = dmy(V1)) %>% 
    mutate(valor = if (codigo==61) {V6} else V8) %>% 
    mutate(moeda = V4) %>% 
    select(data, moeda, valor)
}
