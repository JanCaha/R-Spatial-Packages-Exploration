get_words_in_package_description <- function(package_name, packages_tibble, specific_words){

  description <- packages_tibble %>%
    filter(package == package_name) %>%
    pull(description)

  dictionary <- text_to_corpus(description) %>%
    simplify_corpus()

  words <- stemCompletion(specific_words, dictionary, type = "prevalent")

  found_words <- tibble(`Stem Word` = names(words), `Prevalent Word` = words) %>%
    filter(`Prevalent Word` != "")

  return(found_words)
}

stems_from_description <- function(description){
  stems <- description %>%
    removeNumbers() %>%
    removePunctuation() %>%
    removeWords(stopwords("english")) %>%
    tolower() %>%
    stemDocument()

  stems <- str_split(stems, pattern = fixed(" "))[[1]] %>%
    as.list()
}
