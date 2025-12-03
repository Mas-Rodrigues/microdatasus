# Packages
library(tidyverse)
library(microdatasus)
library(janitor)

### MICRODATASUS ###
# Fetch and read microdata files from DataSUS
# Description: fetch_datasus downloads microdata (DBC) files from DataSUS and reads them.
# Source: https://github.com/rfsaldanha/microdatasus

# Data Raw
data_sus <- microdatasus::fetch_datasus(
    year_start = 2025,
    year_end = 2025,
    uf = "SP",
    timeout = 600, # timeout in seconds
    information_system = "SINAN-DENGUE"
  ) |>
  microdatasus::process_sinan_dengue()

# Filter (City of São José do Rio Preto)
dengue <- data_sus |>
  dplyr::filter(ID_MUNICIP == 354980)

# Save Data
readr::write_csv2(dengue, "dengue_sjrp_2025.csv")
