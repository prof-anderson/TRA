#' University Licensing Income Data
#'
#' Data from the Association of University Technology Managers
#' of 50 universities on research spending along with outcomes
#' such as licensing income and startups formed.
#'
#' @docType data
#'
#' @usage data(univ_lic_2007)
#'
#' @format Dataframe
#'
#' @keywords datasets
#'
#' @references Anderson, Daim, and Lavoie, “Measuring the Efficiency of University Technology Transfer,” Technovation, (2007), pp. 306-18.
#'
#' (\href{https://www.sciencedirect.com/science/article/abs/pii/S0166497206001076}{Elsevier})
#'
#'
#' @examples
#' colnames(univ_lic_2007) <- c("University",
#'                              "LicInc",
#'                              "LicOpt",
#'                              "Startup",
#'                              "PatFile",
#'                              "PatIss",
#'                              "Spend")
#' head(univ_lic_2007[,1:4])
"univ_lic_2007"
