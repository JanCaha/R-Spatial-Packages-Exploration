text_to_corpus <- function(x){
  return(VCorpus(VectorSource(x)))
}

simplify_corpus <- function(x){
  simplified_corpus <- x %>%
    tm_map(stripWhitespace) %>%
    tm_map(content_transformer(tolower)) %>%
    tm_map(removePunctuation) %>%
    tm_map(removeNumbers) %>%
    tm_map(removeWords, stopwords("english"))

  return(simplified_corpus)
}
