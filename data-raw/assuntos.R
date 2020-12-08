library(tidyverse)

# Importando

caminho_pasta <- "~/Downloads/Assuntos_Tribunais/"
aquivos_assuntos_lista <- fs::dir_ls(path = caminho_pasta, glob = "*.xlsx")

aquivos_assuntos_lista # Visualização

lista_das_planilhas <- purrr::map(aquivos_assuntos_lista, readxl::read_excel, col_types = "text")

# importando todos os arquivos .xlsx

lista_das_planilhas # visualização

lista_das_planilhas[[1]] %>% View

# adicionando coluna com os nomes e arrumando nomes de colunas
assuntos_sujos <- bind_rows(lista_das_planilhas, .id = "file")

# criando colunas para tribunal e ano
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

# adicionando a coluna generico e especifico

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

# para exportar
writexl::write_xlsx(assuntos, "~/Documents/abjData/assuntos.xlsx")

# acrescentanto base ao pacote
usethis::use_data(assuntos, overwrite = TRUE)


