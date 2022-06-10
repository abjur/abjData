library(tidyverse)

# Importing

caminho_pasta <- "~/Downloads/Assuntos_Tribunais/"
aquivos_assuntos_lista <- fs::dir_ls(path = caminho_pasta, glob = "*.xlsx")

aquivos_assuntos_lista # View

lista_das_planilhas <- purrr::map(aquivos_assuntos_lista, readxl::read_excel, col_types = "text")

# Importing all files .xlsx

lista_das_planilhas # view

lista_das_planilhas[[1]] %>% View

# adding column with names and arranging column names
assuntos_sujos <- bind_rows(lista_das_planilhas, .id = "file")

# creating columns for court and year
assuntos_limpos <- assuntos_sujos  %>%
  dplyr::rename_with(janitor::make_clean_names, replace = c("º" = "")) %>%
  mutate(file = basename(file)) %>%
  separate(file, c("tipo", "tribunal", "ano"), sep = "_") %>%
  select(-c(tipo, assunto_casos_novos_instancia, assunto_nome7)) %>%
  mutate(
    across(c(ano, x1_grau:total), parse_number, na = c("", "NA", "-")),
    across(c(x1_grau:total), replace_na, 0),
    across(c(assunto_nome1:assunto_nome6), replace_na, "-")
  )

# adding the generic and specific column

cria_generico_i <- function(assuntos_limpos, i) {
  nome_coluna <- paste0("generico", i)
  lab <- paste0("assunto_nome", i+1)
  assuntos_limpos %>%
    group_by(tribunal, ano, across(all_of(paste0("assunto_nome", 1:i)))) %>%
    mutate({{nome_coluna}} := .data[[lab]] == "-" & any(.data[[lab]] != "-")) %>%
    ungroup()
}

assuntos <- purrr::reduce(1:5, cria_generico_i, .init = assuntos_limpos) %>%
  mutate(generico = generico1|generico2|generico3|generico4|generico5) %>%
  select(-c(generico1:generico5)) %>%
  mutate(generico = case_when(
    generico ~ "Sim",
    TRUE ~ "Não"
  )) %>%
  relocate(generico, .after = assunto_nome6)

# to export
writexl::write_xlsx(assuntos, "~/Documents/abjData/assuntos.xlsx")

# adding base to package
usethis::use_data(assuntos, overwrite = TRUE)


