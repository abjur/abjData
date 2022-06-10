#' cadmun
#'
#' A dataset that contains the municipal cadastre codes.
#' The database is outdated, as it does not consider all municipalities.
#'
#' @format a data frame with 5657 lines e 35 variables:
#'
#' \describe{set of codes of the municipalities and their situation, containing
#' information about border, amazonia, capital, longitude, latitude, among others}
#'
#' @source cadmun
#'
#' @examples
#'
#' summary(cadmun)
'cadmun'

#' muni
#'
#' A dataset that contains data useful for joining
#' with city bases, such as city codes, tse code,
#' acronym/name/code of the UFs and region.
#'
#' @format a data frame with 5572 lines e 16 varibles:
#'
#' \describe{
#'   \item{muni_id}{code IBGE (7 digits).}
#'   \item{muni_id_6}{code (6 digits).}
#'   \item{muni_nm}{municipality name (original IBGE).}
#'   \item{muni_nm_clean}{clean municipality name (without accents, upper case).}
#'   \item{uf_nm}{name of the original UF.}
#'   \item{uf_sigla}{initials UF.}
#'   \item{uf_id}{code of IBGE UF.}
#'   \item{regiao_nm}{region name.}
#'   \item{tse_id}{municipality TSE code.}
#'   \item{rf_id}{Receita Federal code of the municipality.}
#'   \item{bcb_id}{code of the Central Bank of Brazil of the municipality.}
#'   \item{existia_1991}{1 if municipality existed in 1991, 0 otherwise.}
#'   \item{existia_2000}{1 if municipality existed in 2000, 0 otherwise.}
#'   \item{existia_2010}{1 if municipality existed in 2010, 0 otherwise.}
#'   \item{lon}{longitude based on shapefile centroid.}
#'   \item{lat}{latitude based on shapefile centroid.}
#'   \item{capital}{TRUE if UF capital, FALSE otherwise.}
#' }
#'
#' @source geobr package base enriched with TSE and centroids data
#'
#' @examples
#'
#' summary(muni)
'muni'


#' pnud_muni
#'
#' A dataset that contains information about UNDP for municipalities and UFs.
#'
#' @format a data frame with 16695 lines e 238 variables.
#'
#' Considered the year-municipal observational unit.
#'
#' \describe{more information see the pnud_siglas.}
#'
#' @source \url{https://www.br.undp.org/content/brazil/pt/home/idh0/atlas-do-desenvolvimento-humano/atlas-dos-municipios.html}
#'
#' summary(pnud_muni)
'pnud_muni'

#' pnud_siglas
#'
#' A dataset that serves as a glossary of available acronyms.
#'
#' @format a data frame with 237 lines e 4 variables:
#' \describe{
#'   \item{sigla}{all acronyms available. }
#'   \item{nome curto}{short name of the acronym.}
#'   \item{nome longo}{long name of the acronym.}
#'   \item{definicao}{definition of acronym.}
#' }
#'
#' @source pnud_siglas
#'
#' @examples
#'
#' summary(pnud_siglas)
'pnud_siglas'

#' pnud_uf
#'
#' A dataset that contains information about PNUD of Federative Units.
#' Considered the observational unit year-uf.
#'
#' @format a data frame with 81 lines e 235 variables.
#'
#' \describe{more information see the pnud_siglas.}
#'
#' @source \url{https://www.br.undp.org/content/brazil/pt/home/idh0/rankings/idhm-uf-2010.html}
#'
#' @examples
#'
#' summary(pnud_uf)
'pnud_uf'


#' pnud_min
#'
#' A dataset that contains PNUD information for municipalities by years.
#'
#' @format a data frame woth 16686 lines e 14 variables.
#'
#' \describe{more information see the pnud_siglas.}
#'
#' @source \url{https://www.br.undp.org/content/brazil/pt/home/idh0/atlas-do-desenvolvimento-humano/atlas-dos-municipios.html}
#'
#' @examples
#'
#' summary(pnud_siglas)
'pnud_min'

#' assuntos
#'
#' A dataset that contains information about hidden ciphers.
#'
#' @format a data frame with 37022 lines e 16 variables.
#'
#' \describe{
#'   \item{tribunal}{indicates which court is concerned.}
#'   \item{ano}{subject year.}
#'   \item{assunto_generico}{generic subject.}
#'   \item{assunto_nome1}{1st branch.}
#'   \item{assunto_nome2}{2st branch.}
#'   \item{assunto_nome3}{3st branch.}
#'   \item{assunto_nome4}{4st branch.}
#'   \item{assunto_nome5}{5st branch.}
#'   \item{assunto_nome6}{6st branch.}
#'   \item{assunto_nome7}{7st branch.}
#'   \item{codigos}{code related to the subject.}
#'   \item{assun_cod_inst}{instance codes.}
#'   \item{x1_grau}{number of cases in 1st degree.}
#'   \item{x2_grau}{number of cases in 2nd degree.}
#'   \item{juizado_especial}{number of cases in the special court.}
#'   \item{turma_especial}{number of cases in the special class.}
#'   \item{total}{total cases.}
#' }
#'
#' @source \url{https://www.cnj.jus.br/}
#'
#' @examples
#'
#' summary(assuntos)
'assuntos'

#' consumo
#'
#' Retrospective basis to use in book examples.
#'
#' @format a data frame with 37022 lines e 16 variables.
#'
#' \describe{
#'   \item{id_processo}{process identifier number (appeal).}
#'   \item{assunto}{subject of the process.}
#'   \item{valor}{value of cause.}
#'   \item{tipo_litigio}{configuration of the parties to the dispute.}
#'   \item{dec_val}{second degree decision.}
#'   \item{dec_unanime}{unanimity.}
#'   \item{dec_date}{decision date.}
#'   \item{tempo}{resource time, in days.}
#' }
#'
#' @source \url{https://abj.org.br/}
#'
#' @examples
#'
#' summary(consumo)
'consumo'

#' Leiloes
#'
#' Base on auctions
#'
#' @format a data frame with 37022 lines e 16 variables.
#'
#' \describe{
#'   \item{id_processo}{process identifier number (appeal).}
#'   \item{descricao}{item description.}
#'   \item{id_leiloeiro}{Auctioneer ID.}
#'   \item{tipo_remuneracao}{Auctioneer compensation type.}
#'   \item{modalidade}{auction mode.}
#'   \item{tipo}{auction type.}
#'   \item{vendeu}{was the item sold?}
#'   \item{valor_avaliacao_inicial}{appraised value.}
#'   \item{valor_total_arrematado}{auctioned value.}
#' }
#'
#' @source \url{https://obs.abj.org.br/}
#'
#' @examples
#'
#' summary(leiloes)
'leiloes'
