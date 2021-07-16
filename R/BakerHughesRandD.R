#' Baker Hughes Corporation data on R&D
#'
#' Data on hydraulic fracturing R&D projects.
#'
#'
#' @docType data
#'
#' @usage data(BakerHughesRandD)
#'
#'
#' @references Thore, “Technology Commercialization,” Springer, 2002, pp. 424.
#'
#'
#' @examples
#' library(MultiplierDEA)
#'
#' resBH<-DeaMultiplierModel(BakerHughesRandD$XBH,
#'                           BakerHughesRandD$YBH,
#'                           rts = "vrs",
#'                           orientation="input")
"BakerHughesRandD"
