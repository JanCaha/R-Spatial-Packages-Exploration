contain_domain_word <- function(description, specific_words){

  text <- description %>%
    text_to_corpus() %>%
    simplify_corpus()

  text <- str_split(text[[1]][["content"]], "([:whitespace:])+")[[1]]

  return(any(specific_words %in% text))
}
