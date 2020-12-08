library(readxl)
library(writexl)
library(magrittr)
library(dplyr)
library(tidyverse)


# Importando

caminho_pasta <- "~/Downloads/Assuntos_Tribunais/"
aquivos_assuntos_lista <- fs::dir_ls(path = caminho_pasta, glob = "*.xlsx")

aquivos_assuntos_lista # Visualização

lista_das_planilhas <- purrr::map(aquivos_assuntos_lista, read_excel, col_types = "text")

# importando todos os arquivos .xlsx

lista_das_planilhas # visualização

assuntos <- bind_rows(lista_das_planilhas, .id = "file") %>%
  rename_all(~c("local",
                "assunto_generico",
                 "assunto_1",
                 "assunto_2",
                 "assunto_3",
                 "assunto_4",
                 "assunto_5",
                 "assunto_6",
                 "codigos",
                 "assunto_cod_inst",
                 "1_grau",
                 "2_grau",
                 "juizado_especial",
                 "turma_recursal",
                 "total")) # adicionando coluna com os nomes


write_xlsx(df_assuntos, "~/Documents/abjData/assuntos.xlsx")

usethis::use_data(assuntos, overwrite = TRUE)
