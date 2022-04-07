set.seed(1)

leiloes <- obsFase3::da_leilao_tidy |>
  dplyr::filter(!is.na(id_leiloeiro)) |>
  dplyr::slice_sample(n = 1000) |>
  dplyr::select(-Lote) |>
  dplyr::select(
    id_processo, descricao,
    id_leiloeiro,
    tipo_remuneracao,
    modalidade,
    tipo,
    data_edital,
    vendeu,
    valor_avaliacao_inicial,
    valor_total_arrematado
  )

usethis::use_data(leiloes, overwrite = TRUE)
