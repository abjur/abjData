## code to prepare `pnud_muni` dataset goes here

readr::write_rds(pnud_muni, "data-raw/pnud_muni.rds", compress = "xz")

# we made this code to simplify the base that goes in the CRAN
# but here we have the complete base anyway.
pnud_muni <- readr::read_rds("data-raw/pnud_muni.rds")
pnud_muni <- pnud_muni |>
  dplyr::rename(analf = t_analf18m) |>
  dplyr::select(
    -dplyr::matches("[0-9]{2,}")
  ) |>
  dplyr::rename(t_analf18m = analf)

usethis::use_data(pnud_muni, overwrite = TRUE, compress = "xz")
