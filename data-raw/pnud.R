## code to prepare `pnud` dataset goes here

## TODO create reproducible code


aux_join <- pnud_muni |>
  select(ano, uf, municipio, muni_id = codmun7) |>
  mutate(across(.fns = as.character)) |>
  left_join(distinct(muni, uf_id, uf_sigla), c("uf" = "uf_id")) |>
  select(-uf)

# adding municipality code in pnud_min
pnud_min <- pnud_min |>
  mutate(ano = as.character(ano)) |>
  inner_join(aux_join, c("uf" = "uf_sigla", "muni" = "municipio", "ano")) |>
  relocate(muni_id, .before = muni) |>
  rename(muni_nm = muni, uf_sigla = uf, regiao_nm = regiao)

# usethis::use_data(pnud_siglas, overwrite = TRUE)
# usethis::use_data(pnud_uf, overwrite = TRUE)
# usethis::use_data(pnud_muni, overwrite = TRUE)
usethis::use_data(pnud_min, overwrite = TRUE)

# fix issue's bea --------------------------------------------------------------------------------------------------------------------------

# pegar pnud_muni que vem do arquivo rds.
pnud_siglas <- pnud_siglas |>
  dplyr::mutate(
    sigla = dplyr::case_when(
      sigla == "idhm_ e" ~ "idhm_e",
      TRUE ~ sigla
    )
  ) |>
  dplyr::filter(sigla %in% names(pnud_muni))

usethis::use_data(pnud_siglas, overwrite = TRUE)
