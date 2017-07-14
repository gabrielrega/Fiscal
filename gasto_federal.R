## Função Gasto Federal
## Retorno a tabela do gasto federal por função para um determinado ano
## Ano deve ser maior que 2012

gasto_federal <- function(ano)
{

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
  
  return (tab1)
  
}
