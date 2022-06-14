#' Municipality info (legacy)
#'
#' A dataset containing the municipality codes.
#' The database is outdated, as it does not consider all municipalities.
#'
#' @format a data frame with 5657 rows e 35 variables:
#'
#' \describe{set of codes of the municipalities and their situation, containing
#' information about border, Amazon, capital, longitude, latitude, among others}
#'
#' @source cadmun
#'
#' @examples
#'
#' summary(cadmun)
'cadmun'

#' Municipality info
#'
#' A dataset containing useful data for joining
#' with city datasets, such as city codes,
#' acronyms of the federative units and regions.
#'
#' @format a data frame with 5572 rows and 17 columns:
#'
#' \describe{
#'   \item{muni_id}{IBGE code (7 digits)}
#'   \item{muni_id_6}{IBGE code (6 digits)}
#'   \item{muni_nm}{Municipality name (original IBGE)}
#'   \item{muni_nm_clean}{Clean municipality name (without accents, upper case)}
#'   \item{uf_nm}{Name of the original federative unit}
#'   \item{uf_sigla}{Federative unit initials}
#'   \item{uf_id}{code of IBGE federative unit}
#'   \item{regiao_nm}{region name}
#'   \item{tse_id}{municipality TSE code}
#'   \item{rf_id}{Brazilian Federal Revenue code of the municipality}
#'   \item{bcb_id}{Central Bank of Brazil code of the municipality}
#'   \item{existia_1991}{1 if municipality existed in 1991, 0 otherwise}
#'   \item{existia_2000}{1 if municipality existed in 2000, 0 otherwise}
#'   \item{existia_2010}{1 if municipality existed in 2010, 0 otherwise}
#'   \item{lon}{longitude based on shapefile centroid}
#'   \item{lat}{latitude based on shapefile centroid}
#'   \item{capital}{TRUE if federative unit is a capital, FALSE otherwise}
#' }
#'
#' @source Municipalities dataset enriched with external data.
#'
#' @examples
#'
#' summary(muni)
'muni'


#' UNDP data by Municipality
#'
#' A dataset that contains information about UNDP for municipalities and federative units.
#'
#' @format a data frame with 16695 rows and 124 columns.
#'
#' Considered the year municipality observational unit.
#'
#' \describe{for more information, check \code{\link{pnud_siglas}}}
#'
#' @source \url{https://www.br.undp.org/content/brazil/pt/home/idh0/atlas-do-desenvolvimento-humano/atlas-dos-municipios.html}
#'
#' summary(pnud_muni)
'pnud_muni'

#' UNDP Acronyms
#'
#' A dataset that serves as a glossary of available variables.
#'
#' @format a data frame with 236 rows e 4 columns:
#' \describe{
#'   \item{sigla}{all acronyms available}
#'   \item{nome curto}{short name of the variable}
#'   \item{nome longo}{long name of the variable}
#'   \item{definicao}{definition of acronym}
#' }
#'
#' @source \url{https://www.br.undp.org/content/brazil/pt/home/idh0/atlas-do-desenvolvimento-humano/atlas-dos-municipios.html}
#'
#' @examples
#'
#' summary(pnud_siglas)
'pnud_siglas'

#' UNDP data by Federative Units
#'
#' A dataset that contains information about UNDP of Federative Units.
#'
#' @format a data frame with 81 rows e 235 columns.
#'
#' \describe{for more information check \code{\link{pnud_siglas}}}
#'
#' @source \url{https://www.br.undp.org/content/brazil/pt/home/idh0/rankings/idhm-uf-2010.html}
#'
#' @examples
#'
#' summary(pnud_uf)
'pnud_uf'


#' UNDP minimal dataset
#'
#' A dataset that contains UNDP information for municipalities by years.
#'
#' @format a data frame with 16686 rows and 15 columns.
#'
#' \describe{for more information check \code{\link{pnud_siglas}}}
#'
#' @source \url{https://www.br.undp.org/content/brazil/pt/home/idh0/atlas-do-desenvolvimento-humano/atlas-dos-municipios.html}
#'
#' @examples
#'
#' summary(pnud_min)
'pnud_min'

#' Case types
#'
#' A dataset contains information about case types in Brazil.
#'
#' @format a data frame with 37022 lines and 15 variables.
#'
#' \describe{
#'   \item{tribunal}{indicates which court is concerned}
#'   \item{ano}{subject year}
#'   \item{assunto_generico}{generic subject}
#'   \item{assunto_nome1}{first branch}
#'   \item{assunto_nome2}{second branch}
#'   \item{assunto_nome3}{third branch}
#'   \item{assunto_nome4}{fourth branch}
#'   \item{assunto_nome5}{fifth branch}
#'   \item{assunto_nome6}{sixth branch}
#'   \item{assunto_nome7}{seventh branch}
#'   \item{codigos}{code related to the subject}
#'   \item{assun_cod_inst}{instance codes}
#'   \item{x1_grau}{number of cases in first instance}
#'   \item{x2_grau}{number of cases in second instance}
#'   \item{juizado_especial}{number of cases in the special court}
#'   \item{turma_especial}{number of cases in the special class}
#'   \item{total}{total cases}
#' }
#'
#' @source \url{https://www.cnj.jus.br/}
#'
#' @examples
#'
#' summary(assuntos)
'assuntos'

#' Consumer cases
#'
#' Retrospective basis to use in book examples.
#'
#' @format a data frame with 1000 rows and 9 columns.
#'
#' \describe{
#'   \item{id_processo}{case identifier number (appeal)}
#'   \item{assunto}{type of the case}
#'   \item{valor}{value of cause}
#'   \item{tipo_litigio}{configuration of the parties to the dispute}
#'   \item{dec_val}{second instance decision}
#'   \item{dec_unanime}{unanimity}
#'   \item{dec_date}{decision date}
#'   \item{tempo}{case time, in days}
#' }
#'
#' @source \url{https://abj.org.br/}
#'
#' @examples
#'
#' summary(consumo)
'consumo'

#' Auctions
#'
#' Auctions sample dataset used in our book.
#'
#' @format a data frame with 1000 rows and 10 columns.
#'
#' \describe{
#'   \item{id_processo}{case identifier number}
#'   \item{descricao}{item description}
#'   \item{id_leiloeiro}{Auctioneer ID}
#'   \item{tipo_remuneracao}{Auctioneer compensation type}
#'   \item{modalidade}{auction mode}
#'   \item{tipo}{auction type}
#'   \item{vendeu}{was the item sold?}
#'   \item{valor_avaliacao_inicial}{appraised value}
#'   \item{valor_total_arrematado}{auctioned value}
#' }
#'
#' @source \url{https://obs.abj.org.br/}
#'
#' @examples
#'
#' summary(leiloes)
'leiloes'
