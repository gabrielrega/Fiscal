prefixo <- function() {
  d <- Sys.time()
  dt <- toString (d)
  nom <- gsub("-","",d)
  nom <- gsub(":","",nom)
  nom <- gsub(" ","_",nom)
  return(nom)
}

prefixo2 <- function() {
  d <- Sys.time()
  dt <- toString (d)
  nom <- substr(dt, start=1, stop=10)
  nom <- gsub("-","",nom)
  return(nom)
}
