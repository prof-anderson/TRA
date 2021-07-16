#' Malmquist Productivity Index Data
#'
#' 2D data for demonstrating Malmquist Producitivity Index analysis
#'
#'
#' @docType data
#'
#' @usage data(malm_graphical)
#'
#'
#'
#' @examples
#' malm_graphical
#'
#' library(deaR)
#' #Process data into the format required by deaR
#' malm_gr_data_pro <-
#'   read_malmquist(malm_graphical,
#'                  percol = 1,   # Use Col1 for period (year)
#'                  dmus = 2,     # Col2 has DMU identifier
#'                  inputs = 3,   # Col3 has the input
#'                  outputs = 4,  # Col4 has the output
#'                  arrangement = "vertical")
#'
#' result_gr <- malmquist_index(malm_gr_data_pro,
#'                              orientation = "oo",
#'                              rts = "crs",
#'                              type1 = "cont",
#'                              type2 = "fgnz")
#'
#' mi_gr <- result_gr$mi
#'
#' res_mi_gr <- t(rbind(result_gr$mi, result_gr$ec,
#'                      result_gr$tc ))
#' colnames(res_mi_gr) <- c("MPI", "PEch",  "TC")
#' res_mi_gr
"malm_graphical"
