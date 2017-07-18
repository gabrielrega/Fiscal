## Função Gasto Federal
## Retorno a tabela do gasto federal por função para um determinado ano
## Ano deve ser maior que 2012

gasto_federal <- function(ano=2017, completo = TRUE)
{
  try(if (ano<2013) stop("Não é possível buscar dados de 2012 ou anteriores"))
  url = paste0("http://www.portaldatransparencia.gov.br/PortalFuncoes.asp?Exercicio=",ano)
  
  page = readLines(url)
  
  grep("Total",page)
  pattern = '<td class=\"colunaValor\">([^<]*)</td>'
  datalines = grep(pattern,page[290:length(page)],value=TRUE)
  getexpr = function(s,g)substring(s,g,g+attr(g,'match.length')-1)
  gg = gregexpr(pattern,datalines)
  matches = mapply(getexpr,datalines,gg)
  result = gsub(pattern,'\\1',matches)
  names(result) = NULL
  
  v1 = gsub(".","",result, fixed = TRUE)
  v1 = as.numeric(gsub(",",".", v1, fixed = TRUE))
  
  grep("Funç", page)
  pattern2 = '<td class=\"firstChild\"><a href=\"/PortalFuncoes_Detalhe.asp?([^<]*)</a></td>'
  datalines = grep(pattern2,page[1:length(page)],value=TRUE)
  getexpr = function(s,g)substring(s,g,g+attr(g,'match.length')-1)
  gg = gregexpr(pattern2,datalines)
  matches = mapply(getexpr,datalines,gg)
  result = gsub(pattern,'\\1',matches)
  names(result) = NULL
  
  t1 = substr(result,94,nchar(result))
  t1 = substr(t1, 1, nchar(t1)-10+1)
  
  url = paste0("http://www.portaldatransparencia.gov.br/PortalFuncoes.asp?Exercicio=",ano,"&Pagina=2")
  
  page = readLines(url)
  grep("Total",page)
  
  pattern = '<td class=\"colunaValor\">([^<]*)</td>'
  datalines = grep(pattern,page[290:length(page)],value=TRUE)
  getexpr = function(s,g)substring(s,g,g+attr(g,'match.length')-1)
  gg = gregexpr(pattern,datalines)
  matches = mapply(getexpr,datalines,gg)
  result = gsub(pattern,'\\1',matches)
  names(result) = NULL
  
  v2 = gsub(".","",result, fixed = TRUE)
  v2 = as.numeric(gsub(",",".", v2, fixed = TRUE))
  
  grep("Funç", page)
  pattern2 = '<td class=\"firstChild\"><a href=\"/PortalFuncoes_Detalhe.asp?([^<]*)</a></td>'
  datalines = grep(pattern2,page[1:length(page)],value=TRUE)
  getexpr = function(s,g)substring(s,g,g+attr(g,'match.length')-1)
  gg = gregexpr(pattern2,datalines)
  matches = mapply(getexpr,datalines,gg)
  result = gsub(pattern,'\\1',matches)
  names(result) = NULL
  
  t2 = substr(result,94,nchar(result))
  t2 = substr(t2, 1, nchar(t2)-10+1)
  
  tab1 = data.frame(cbind(append(t1,t2), append(v1,v2)))
  colnames(tab1) = c("Funcao","Valor")
  tab1[,2] = as.numeric(paste(tab1[,2]))
  
  if (completo) return (tab1)
  
  url = paste0("http://www.portaltransparencia.gov.br/PortalFuncoes_Detalhe.asp?Exercicio=",ano,"&codFuncao=28")
  
  page = readLines(url)
  grep("Refin",page)
  
  pattern = '<td class=\"colunaValor\">([^<]*)</td>'
  datalines = grep(pattern,page[290:length(page)],value=TRUE)
  getexpr = function(s,g)substring(s,g,g+attr(g,'match.length')-1)
  gg = gregexpr(pattern,datalines)
  matches = mapply(getexpr,datalines,gg)
  result = gsub(pattern,'\\1',matches)
  names(result) = NULL
  
  v3 = gsub(".","",result, fixed = TRUE)
  v3 = as.numeric(gsub(",",".", v3, fixed = TRUE))
  
  grep("Finalidade", page)
  pattern2 = '[0-9][0-9][0-9] - ([^<]*)<'
  datalines = grep(pattern2,page[1:length(page)],value=TRUE)
  getexpr = function(s,g)substring(s,g,g+attr(g,'match.length')-1)
  gg = gregexpr(pattern2,datalines)
  matches = mapply(getexpr,datalines,gg)
  result = gsub(pattern,'\\1',matches)
  names(result) = NULL
  
  t3 = substr(result,7,nchar(result)-1)
  
  tab2 = data.frame(cbind(t3,v3))
  colnames(tab2) = c("SubFuncao","Valor")
  tab2[,2] = as.numeric(paste(tab2[,2]))
  
  x = grep("Refin", tab2$SubFuncao)
  y = 0
  for (i in x) {
    y=y+tab2[i,2]
  }
  y
  
  tab3 = tab1
  x = grep("Encarg", tab3$Funcao)
  tab3[x,2] = tab3[x,2] - y
  
  return (tab3)
}
