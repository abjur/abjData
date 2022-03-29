## code to prepare `muni` dataset goes here

library(tidyverse)
library(sf)

da_sf <- geobr::read_municipality(year = "2019")

# latlon
aux_latlon <- da_sf %>%
  transmute(
    muni_id = as.character(code_muni),
    centroid = map(geom, sf::st_centroid),
    lon = map_dbl(centroid, dplyr::first),
    lat = map_dbl(centroid, dplyr::last)
  ) %>%
  as_tibble() %>%
  select(-geom, -centroid)

da_muni <- da_sf %>%
  as_tibble() %>%
  select(-geom)

da_muni_clean <- da_muni %>%
  transmute(
    muni_id = as.character(code_muni),
    muni_id_6 = str_sub(as.character(code_muni), 1, 6),
    muni_nm = name_muni,
    muni_nm_clean = abjutils::rm_accent(toupper(name_muni)),
    muni_nm_clean = str_remove_all(muni_nm_clean, "'"),
    uf_nm = name_state,
    uf_sigla = abbrev_state,
    uf_id = as.character(code_state),
    regiao_nm = name_region,
  )

# tse
aux_tse <- read_csv("data-raw/muni_tse_mapping.csv") %>%
  transmute(
    muni_id = as.character(id_munic_7),
    tse_id = as.character(id_TSE),
    rf_id = as.character(id_RF),
    bcb_id = as.character(id_BCB),
    existia_1991,
    existia_2000,
    existia_2010
  ) %>%
  mutate(across(where(is.double), as.integer))

# capital
aux_capital <- tibble::tribble(
  ~uf, ~capital,
  "AC", "1200401",
  "AL", "2704302",
  "AP", "1600303",
  "AM", "1302603",
  "BA", "2927408",
  "CE", "2304400",
  "DF", "5300108",
  "ES", "3205309",
  "GO", "5208707",
  "MA", "2111300",
  "MT", "5103403",
  "MS", "5002704",
  "MG", "3106200",
  "PA", "1501402",
  "PB", "2507507",
  "PE", "2611606",
  "PR", "4106902",
  "PI", "2211001",
  "RJ", "3304557",
  "RN", "2408102",
  "RS", "4314902",
  "RO", "1100205",
  "RR", "1400100",
  "SC", "4205407",
  "SP", "3550308",
  "SE", "2800308",
  "TO", "1721000"
)

muni <- da_muni_clean %>%
  left_join(tse_id, "muni_id") %>%
  left_join(aux_latlon, "muni_id"),
  mutate(capital = muni_id %in% aux_capital$capital)

# os faltantes sao as lagoas do RS
faltantes <- da_muni_clean %>%
  anti_join(tse_id, "muni_id")

usethis::use_data(muni, overwrite = TRUE)
