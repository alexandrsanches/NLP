setwd("~/Documents/Projetos/NLP")

anos <- c(1948:2021)
versao <- c(1:75)
numero <- c(1:4)

for (i in anos) {
  for (j in versao) {
    for (z in numero) {
      
      caminho <- paste("PDF", i, j, z, sep = "/")
      dir.create(path = caminho, recursive = TRUE)
      
    }
  }
}

