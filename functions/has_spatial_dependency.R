has_spatial_dependency <- function(dependencies, important_packages){

  dependencies_packages <- str_split(paste(unlist(dependencies), collapse = " "), "([:whitespace:])+")[[1]]

  result = any(important_packages %in% dependencies_packages)

  return(result)
}
