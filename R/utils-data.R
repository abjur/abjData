#' cadmun
#'
#' Um conjunto de dados que contem os codigos de cadastro municipal.
#' A base esta desatualizada, pois nao considera todos os municipios.
#'
#' @format um data frame com 5657 e 35 variaveis:
#'
#' \describe{conjunto de codigos dos municipios e sua situacao, contendo
#' informacoes sobre fronteira, amazonia, capital, longitude, latitude, entre outros}
#'
#' @source cadmun
'cadmun'

#' muni
#'
#' Um conjunto de dados que contem dados uteis para fazer join
#' com bases de municipios, como codigos dos municipios, codigo tse,
#' sigla/nome/codigo das UFs e regiao.
#'
#' @format um data frame com 5572 linhas e 16 colunas:
#'
#' \describe{
#'   \item{muni_id}{codigo IBGE (7 digitos).}
#'   \item{muni_id_6}{codigo IBGE (6 digitos).}
#'   \item{muni_nm}{nome do municipio (original IBGE).}
#'   \item{muni_nm_clean}{nome do municipio limpo (sem acentos, caixa alta).}
#'   \item{uf_nm}{nome da UF original.}
#'   \item{uf_sigla}{sigla da UF.}
#'   \item{uf_id}{codigo IBGE da UF.}
#'   \item{regiao_nm}{nome da regiao.}
#'   \item{tse_id}{codigo TSE do municipio.}
#'   \item{rf_id}{codigo Receita Federal do municipio.}
#'   \item{bcb_id}{codigo do Banco Central do Brasil do municipio.}
#'   \item{existia_1991}{1 se municipio existia em 1991, 0 caso contrario.}
#'   \item{existia_2000}{1 se municipio existia em 2000, 0 caso contrario.}
#'   \item{existia_2010}{1 se municipio existia em 2010, 0 caso contrario.}
#'   \item{lon}{longitude baseada no centroide do shapefile.}
#'   \item{lat}{latitude baseada no centroide do shapefile.}
#' }
#'
#' @source base do pacote geobr enriquecida com dados do TSE e centroides
'muni'


#' pnud_muni
#'
#' Um conjunto de dados que contém informações sobre PNUD de municipios e UFs.
#'
#' @format um data frame com 16695 linhas e 238 variaveis.
#' Considerada a unidade observacional ano-municipio.
#'
#' \describe{mais informacoes consulte a pnud_siglas}
#'
#' @source \url{https://www.br.undp.org/content/brazil/pt/home/idh0/atlas-do-desenvolvimento-humano/atlas-dos-municipios.html}
'pnud_muni'

#' pnud_siglas
#'
#' Um conjuto de dados que serve como glossario das siglas disponiveis.
#'
#' @format um data frame com 237 e 4 variaveis:
#' \describe{
#'   \item{sigla}{todas as siglas disponiveis}
#'   \item{nome curto}{nome curto da sigla}
#'   \item{nome longo}{nome longo da sigla}
#'   \item{definicao}{definicao da sigla}
#' }
#'
#' @source pnud_siglas
'pnud_siglas'

#' pnud_uf
#'
#' Um conjunto de dados que contem informacoes sobre PNUD de Unidades Federativas.
#' Considerada a unidade observacional ano-uf.
#'
#' @format um data frame com 81 linhas e 235 variaveis.
#'
#' \describe{mais informações consulte a pnud_siglas}
#'
#' @source \url{https://www.br.undp.org/content/brazil/pt/home/idh0/rankings/idhm-uf-2010.html}
'pnud_uf'


#' pnud_min
#'
#' Um conjunto de dados que contém informações sobre PNUD de municípios por anos.
#'
#' @format um data frame com 16686 linhas e 14 variaveis.
#'
#' \describe{mais informações consulte a pnud_siglas}
#'
#' @source @source \url{https://www.br.undp.org/content/brazil/pt/home/idh0/atlas-do-desenvolvimento-humano/atlas-dos-municipios.html}
'pnud_min'
