library(magrittr)
library(tidyverse)

# Importando

caminho_pasta <- "~/Downloads/Assuntos_Tribunais/"
aquivos_assuntos_lista <- fs::dir_ls(path = caminho_pasta, glob = "*.xlsx")

aquivos_assuntos_lista # Visualização

lista_das_planilhas <- purrr::map(aquivos_assuntos_lista, readxl::read_excel, col_types = "text")

# importando todos os arquivos .xlsx

lista_das_planilhas # visualização

# adicionando coluna com os nomes e arrumando nomes de colunas
assuntos_sujos <- bind_rows(lista_das_planilhas, .id = "file") %>%
  dplyr::rename_all(gsub, pattern = "º", replacement = "") %>%
  janitor::clean_names()

# criando colunas para tribunal e ano
assuntos <- assuntos %>%
  mutate(file = basename(file)) %>%
  separate(file, c("tipo", "tribunal", "ano")) %>%
  select(-c(tipo, assunto_casos_novos_instancia))

# para exportar
writexl::write_xlsx(assuntos, "~/Documents/abjData/assuntos.xlsx")

# acrescentanto base ao pacote
usethis::use_data(assuntos, overwrite = TRUE)


