setwd("~/Documents/Projetos/NLP")

anos <- c(1948:2021)
numero <- c(1:4)

for (i in anos) {
  for (j in numero) {
      
      caminho <- paste("PDF", i, j, sep = "/")
      dir.create(path = caminho, recursive = TRUE)
      
  }
}

