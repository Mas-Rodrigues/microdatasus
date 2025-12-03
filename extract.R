# Packages
library(tidyverse)
library(microdatasus)

### MICRODATASUS ###
# Fetch and read microdata files from DataSUS
# Description: fetch_datasus downloads microdata (DBC) files from DataSUS and reads them.
# Source: https://github.com/rfsaldanha/microdatasus

# Data Raw
data_sus <- 
  microdatasus::fetch_datasus(
    year_start = 2025,
    year_end = 2025,
    uf = "SP",
    timeout = 600, # timeout in seconds
    information_system = "SINAN-DENGUE"
  ) |>
  microdatasus::process_sinan_dengue()|> 
  janitor::clean_names()

# Filter (City of São José do Rio Preto)
dengue <- data_sus |>
  dplyr::filter(id_municip == 354980) |>
  janitor::clean_names()

