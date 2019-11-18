# list of necessary packages for the project
list.of.packages <- c( "tidyverse",
                       "magrittr",
                       "lubridate",
                       "here",
                       "httr",
                       "rvest",
                       "knitr",
                       "kableExtra",
                       "jsonlite",
                       "tm",
                       "rlang",
                       "tidytext",
                       "DT",
                       "glue")

# check if the packages are present
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]

# instalation of missing packages
if (length(new.packages)) install.packages(new.packages)

# load packagaes
lapply(list.of.packages, function(x){library(x, character.only = TRUE)})

# remove data
remove(list.of.packages, new.packages)

# check if remotes is installed
if (!"remotes" %in% installed.packages()) {
  installed.packages("remotes")
}

# list of packages that are not on CRAN and their sources
packages_out_cran <- data.frame(
  package = c("crandb", "cranlogs"),
  source = c("metacran/crandb", "metacran/cranlogs")
)

# function that checks existence of package and installs it from GitHub if necessary
check_existance_install_github <- function(x){
  if (!require(x[1], character.only = TRUE)) {
    remotes::install_github(x[2])
    library(x[1], character.only = TRUE)
  } else {
    library(x[1], character.only = TRUE)
  }
}

# funtion to iterate through df of packages outside of CRAN
apply(packages_out_cran, 1, check_existance_install_github)
rm(packages_out_cran)
