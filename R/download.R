get_cities_map <- function() {
  u <- 'http://geoservicos.ibge.gov.br/geoserver/wms?service=WFS&version=1.0.0&request=GetFeature&typeName=CCAR:BC250_Municipio_A&outputFormat=JSON'
  tmp <- tempfile(fileext = '.json')
  r <- httr::GET(u, httr::progress(), httr::write_disk(tmp))
  j <- jsonlite::fromJSON(tmp)
}

#' Gets fortified map from IBGE
#'
#' @param path path of the zip file. If NULL, downloads data from the internet.
#' @param type atomic character. Current options are "state" or "city".
#'
#' @seealso \url{ftp://geoftp.ibge.gov.br/cartas_e_mapas/bases_cartograficas_continuas/bc250/versao2015/Shapefile/}
#' @export
get_states_map <- function(path = NULL, type = 'state') {
  if (length(type) != 1 || !type %in% c('state', 'city')) {
    stop('type must be "city" or "state".')
  } else {
    arq_type <- ifelse(type == 'state', 'LIM_Unidade_Federacao_A',
                       'LIM_Municipio_A')
  }
  if (is.null(path)) {
    u <- 'ftp://geoftp.ibge.gov.br/cartas_e_mapas/bases_cartograficas_continuas/bc250/versao2015/Shapefile/Limites_v2015_20160809.zip'
    path <- tempfile(fileext = '.zip')
    r <- suppressWarnings(httr::GET(u, httr::progress(),
                                    httr::write_disk(path)))
  } else if (!file.exists(path)) {
    stop('File does not exist')
  }
  arqs <- unzip(path, list = TRUE) %>%
    dplyr::filter(stringr::str_detect(Name, arq_type)) %>%
    with(Name)
  temp_dir <- tempdir()
  unzip(path, files = arqs, exdir = temp_dir)
  a <- temp_dir %>%
    dir(recursive = TRUE, pattern = '\\.shp$', full.names = TRUE) %>%
    sf::st_read(quiet = TRUE)
  d <- tidy_sf(a)
  unlink(sprintf('%s/Limite_v2015_2016-08-03', temp_dir), recursive = TRUE)
  d
}

#' Get cities lat and lon
#'
#' Get cities lat and lon.
#'
#' @export
get_cities_latlon <- function() {
  u <- 'https://community.qlik.com/servlet/JiveServlet/downloadBody/5183-102-1-6182/MunicipiosBrasil.xls'
  tmp <- tempfile(fileext = '.xls')
  r <- httr::GET(u, httr::progress(), httr::write_disk(tmp, overwrite = TRUE))
  tmp %>%
    readxl::read_excel() %>%
    tibble::as_tibble() %>%
    janitor::clean_names() %>%
    dplyr::select(id, mun_uf, mun = municipio, uf,
                  lat = latitude, lon = longitude)
}

tidy_sf <- function(sf) {
  sf %>%
    tibble::as_tibble() %>%
    janitor::clean_names() %>%
    dplyr::group_by_(.dots = names(.)[names(.) != 'geometry']) %>%
    dplyr::mutate(geom = purrr::map2(geometry, id_objeto, ~{
      l <- lapply(seq_along(.x), function(ii) {
        tb <- tibble::as_tibble(.x[[ii]][[1]])
        if (nrow(tb) == 1) tb <- tibble::as_tibble(.x[[ii]])
        dplyr::mutate(tb, id = paste(.y[1], ii, sep = '.'))
      })
      dplyr::bind_rows(l)
    })) %>%
    dplyr::ungroup() %>%
    tidyr::unnest(geom) %>%
    janitor::clean_names()
}

#' plots a map from tidy map data
#'
#' plots a map from tidy map data.
#'
#' @param sf tidyed simple features object
#'
#' @import ggplot2
#' @export
ggplot_sf <- function(sf) {
  sf %>%
    ggplot(aes(x = v1, y = v2)) +
    geom_polygon(aes(group = id),
                 colour = 'black',
                 size = .3, fill = 'transparent') +
    coord_equal() +
    theme_minimal()
}

#' Get cities info
#'
#' Get cities info.
#'
#' @export
get_cities_def <- function() {
  u <- 'ftp://geoftp.ibge.gov.br/organizacao_do_territorio/estrutura_territorial/divisao_territorial/2015/dtb_2015.zip'
  nm_arq <- 'dtb_2015/RELATORIO_DTB_BRASIL_MUNICIPIO.xls'
  tmp <- tempfile(fileext = '.zip')
  wd <- httr::write_disk(tmp, overwrite = TRUE)
  r <- httr::GET(u, httr::progress(), wd)
  temp_dir <- tempdir()
  suppressWarnings(unzip(tmp, files = nm_arq, exdir = temp_dir))
  arq <- sprintf('%s/%s', temp_dir, nm_arq)
  d <- readxl::read_excel(arq) %>%
    as.data.frame() %>%
    setNames(iconv(names(.), from = 'latin1', to = 'UTF-8')) %>%
    setNames(abjutils::rm_accent(names(.))) %>%
    janitor::clean_names() %>%
    tibble::as_tibble() %>%
    dplyr::mutate_at(dplyr::vars(dplyr::starts_with('nome_')),
                     dplyr::funs(iconv(., from = 'latin1', to = 'UTF-8')))
  unlink(temp_dir, recursive = TRUE)
  file.remove(tmp)
  d
}
