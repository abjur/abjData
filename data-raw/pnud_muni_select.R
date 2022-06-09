## code to prepare `pnud_muni` dataset goes here

readr::write_rds(pnud_muni, "data-raw/pnud_muni.rds", compress = "xz")

# fizemos esse código para simplificar a base que vai no CRAN
# mas aqui temos a base completa, de qualquer forma.
pnud_muni <- readr::read_rds("data-raw/pnud_muni.rds")
pnud_muni <- pnud_muni |>
  dplyr::select(
    -dplyr::matches("[0-9]{2,}")
  )

usethis::use_data(pnud_muni, overwrite = TRUE, compress = "xz")
