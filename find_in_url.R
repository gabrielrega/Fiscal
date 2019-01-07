find_in_url <- function(pattern, url){
  
  page <- readLines(url, n = -2L)
  datalines <- grep(pattern, page[1:length(page)], value = TRUE)
  getexpr <- function(s, g) substring(s, g, g + attr(g, 'match.length') - 1)
  gg <- gregexpr(pattern, datalines)
  matches <- mapply(getexpr, datalines, gg)
  return(matches)
  
}
