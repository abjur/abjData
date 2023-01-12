#' Municipality info (legacy)
#'
#' A dataset containing the municipality codes.
#' The database is outdated, as it does not consider all municipalities.
#'
#' @format a data frame with 5657 rows and 35 variables:
#'
#' \describe{
#'   \item{description}{set of codes of the municipalities and their situation, containing information about border, Amazon, capital, longitude, latitude, among others}
#' }
#'
#' @source IBGE
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
#' \describe{
#'   \item{id}{for more information, check \code{\link{pnud_siglas}}}
#' }
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
#'
#' \describe{
#'   \item{sigla}{all acronyms available}
#'   \item{nome_curto}{short name of the variable}
#'   \item{nome_longo}{long name of the variable}
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
#' \describe{
#'   \item{ano}{for more information, check \code{\link{pnud_siglas}}}
#' }
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
#' \describe{
#'   \item{ano}{for more information, check \code{\link{pnud_siglas}}}
#' }
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
#'   \item{assunto_nome1}{first branch}
#'   \item{assunto_nome2}{second branch}
#'   \item{assunto_nome3}{third branch}
#'   \item{assunto_nome4}{fourth branch}
#'   \item{assunto_nome5}{fifth branch}
#'   \item{assunto_nome6}{sixth branch}
#'   \item{generico}{generic code}
#'   \item{codigo}{code related to the subject}
#'   \item{x1_grau}{number of cases in first instance}
#'   \item{x2_grau}{number of cases in second instance}
#'   \item{juizado_especial}{number of cases in the special court}
#'   \item{turma_recursal}{number of cases in the special class}
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
#'   \item{comarca}{municipality of the case}
#'   \item{valor}{value of cause}
#'   \item{tipo_litigio}{configuration of the parties to the dispute}
#'   \item{dec_val}{second instance decision}
#'   \item{dec_unanime}{unanimity}
#'   \item{dec_date}{decision date}
#'   \item{tempo}{case time in days}
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
#'   \item{data_edital}{auction date}
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

#' Litigation
#'
#' Litigation data from Brazil.
#'
#' @format a data frame with 1000 rows and 10 columns.
#'
#' \describe{
#'   \item{justica}{Type of justice}
#'   \item{ano}{Year}
#'   \item{tribunal_uf}{State acronym}
#'   \item{baixados}{Closed cases}
#'   \item{novos}{New cases}
#'   \item{pendentes}{Pending cases}
#'   \item{idhm}{State Human Development Index}
#'   \item{t_analf18m}{Illiteracy rate}
#'   \item{rdpc}{Per capita income}
#'   \item{pop}{population}
#' }
#'
#' @source \url{https://abjur.shinyapps.io/obsCIEE/}
#'
#' @examples
#'
#' summary(litigiosidade)
'litigiosidade'

#' datajud_mg
#'
#' Example data extracted from datajud
#'
#' @format a data frame with 2666 rows and 16 columns.
#'
#' \describe{
#'   \item{ano}{Year}
#'   \item{mes}{Month}
#'   \item{data_de_referencia}{Distribution date}
#'   \item{tribunal}{Tribunal acronym}
#'   \item{nome_orgao}{Court}
#'   \item{codigo_orgao}{Court subarea's code}
#'   \item{municipio}{Municipality}
#'   \item{uf}{State}
#'   \item{grau}{Lawsuit degree}
#'   \item{formato}{Format}
#'   \item{procedimento}{Procedure type}
#'   \item{recurso_originario}{Originary procedure}
#'   \item{processo}{Lawsuit number}
#'   \item{nivel_de_sigilo}{Disclosure level}
#'   \item{classe}{Class type name}
#'   \item{codigo_classe}{Class type code}
#' }
#'
#' @source \url{https://painel-estatistica.stg.cloud.cnj.jus.br/estatisticas.html}
#'
#' @examples
#'
#' summary(datajud_mg)
'datajud_mg'

#' da_cpopg
#'
#' Example data extracted from tjsp/cpopg
#'
#' @format a data frame with 377 rows and 13 columns.
#'
#' \describe{
#'   \item{id_processo}{Procces number}
#'   \item{status}{Status}
#'   \item{classe}{Class type name}
#'   \item{assunto}{Theme}
#'   \item{foro}{Forum}
#'   \item{juiz}{Judge's name}
#'   \item{vara}{Court}
#'   \item{distribuicao}{Distribution date}
#'   \item{controle}{Control code}
#'   \item{area}{Area}
#'   \item{valor_da_acao}{Lawsuit value}
#'   \item{digital}{Digital}
#'   \item{partes}{Parties}
#' }
#'
#'
#' @examples
#'
#' summary(da_cpopg)
'da_cpopg'
