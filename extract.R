# Packages
library(tidyverse)
library(microdatasus)
library(janitor)

### MICRODATASUS ###
# Fetch and read microdata files from DataSUS
# Description: fetch_datasus downloads microdata (DBC) files from DataSUS and reads them.
# Source: https://github.com/rfsaldanha/microdatasus


# Definir o intervalo de anos e o município
anos <- 2010:2025 #Intervalo dos anos
municipio_sjrp <- 354980 # Codigo municipal do IBGE

for (ano in anos) {

  message(paste("Processando e baixando o ano:", ano))

  tryCatch({

    data_sus_raw <- microdatasus::fetch_datasus(
      year_start = ano,
      year_end = ano,
      uf = "SP",
      timeout = 600,
      information_system = "SINAN-DENGUE"
    )

    #Processamento e limpeza dos dados
    data_sus_processed <- data_sus_raw |>
      microdatasus::process_sinan_dengue() |>
      janitor::clean_names()

    # Filtrar (Município de Residência)
    dengue_filtrado <- data_sus_processed |>
      dplyr::filter(id_municip == municipio_sjrp)

    # Salvar o arquivo com o nome do ano
    nome_arquivo <- paste0("dengue_", ano, ".csv")
    readr::write_csv2(dengue_filtrado, nome_arquivo)

    message(paste("Arquivo", nome_arquivo, "salvo."))

  }, error = function(e) {
    # Captura e exibe o erro, mas permite que o loop continue para o próximo ano
    warning(paste("Falha ao processar o ano", ano, ":", conditionMessage(e)))
  })
}

message("Processamento finalizado.")
