# Set working directory ----

setwd("~/Documents/Projetos/NLP")

# Load packages ----

library(tidyverse)
library(NLP)
library(tm)
library(wordcloud2)

# Import data ----
textos <- VCorpus(DirSource("PDF/Revista Brasileira de Economia/1947/1"), 
                  readerControl = list(reader = readPDF, languague = "por"))

inspect(textos)

# Clean data ----
textos <- textos %>%
  tm_map(removeWords, stopwords("portuguese")) %>%
  tm_map(removeWords, stopwords("english")) %>%
  tm_map(stripWhitespace) %>%
  tm_map(removePunctuation) %>%
  tm_map(removeNumbers) %>%
  tm_map(content_transformer(tolower))

rep <- TermDocumentMatrix(textos) %>%
  as.matrix()

rep <- sort(rowSums(rep), decreasing = TRUE)

rep <- data.frame(words = names(rep),
                  freq = rep)

wordcloud2(rep)
