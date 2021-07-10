#' University Licensing Income Data
#'
#' Data from the Association of University Technology Managers
#' of 50 universities on research spending along with outcomes
#' such licensing income
#' increments over eight hours.
#'
#' @docType data
#'
#' @usage data(univ_lic_2007)
#'
#' @format An object of class \code{"cross"}; see \code{\link[qtl]{read.cross}}.
#'
#' @keywords datasets
#'
#' @references Moore et al. (2013) Genetics 195:1077-1086
#' (\href{https://www.ncbi.nlm.nih.gov/pubmed/23979570}{PubMed})
#'
#' @source \href{https://phenome.jax.org/projects/Moore1b}{QTL Archive}
#'
#' @examples
#' data(grav)
#' times <- attr(grav, "time")
#' phe <- grav$pheno
#' \donttest{iplotCurves(phe, times)}
"grav"
