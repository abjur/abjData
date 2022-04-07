set.seed(1)
consumo <- tjsp2inst::tjsp2inst |>
  dplyr::filter(info_area == "Cível") |>
  dplyr::filter(info_classe == "Apelação Cível") |>
  dplyr::filter(stringr::str_detect(
    info_assunto_full, "Contratos de Consumo - (Bancá|Fornecim|Telefonia|Planos de Saúde|Transporte Aéreo)"
  )) |>
  dplyr::mutate(assunto = dplyr::case_when(
    stringr::str_detect(info_assunto_full, "Bancários") ~ "Bancários",
    stringr::str_detect(info_assunto_full, "Telefonia") ~ "Telefonia",
    stringr::str_detect(info_assunto_full, "Transporte Aéreo") ~ "Transporte Aéreo",
    stringr::str_detect(info_assunto_full, "Planos de Saúde") ~ "Planos de Saúde",
    stringr::str_detect(info_assunto_full, "Fornecimento de Energia") ~ "Fornecimento de Energia",
    TRUE ~ NA_character_
  )) |>
  dplyr::mutate(assunto = factor(assunto)) |>
  dplyr::filter(!is.na(assunto), !is.na(info_valor)) |>
  dplyr::slice_sample(n = 1000) |>
  dplyr::select(
    id_processo, assunto,
    comarca = info_comarca,
    valor = info_valor,
    tipo_litigio = part_tipo_litigio,
    dec_val,
    dec_unanime,
    dec_date,
    tempo
  )

usethis::use_data(consumo, overwrite = TRUE)
