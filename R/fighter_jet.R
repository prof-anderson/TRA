#' US Fighter Jet Data
#'
#'
#' Data used for technology forecasting of US fighter jet aircrafts.
#' Consists of aircraft from 1944 to 1982.
#'
#' @docType data
#'
#' @usage data(fighter_jet)
#'
#' @format An object of class \code{"cross"}; see \code{\link[qtl]{read.cross}}.
#'
#' @keywords datasets
#'
#' @references Inman, Anderson, and Harmon, “Predicting U.S. Jet Fighter Aircraft Introductions from 1944 to 1982: A Dogfight Between Regression and TFDEA,” Technological Forecasting and Social Change, (2007), pp. 306-18.
#'
#' (\href{http://dx.doi.org/10.1016/j.techfore.2006.05.013}{Elsevier})
#'
#'
#' @examples
#' fj_data <- dplyr::select(fighter_jet,
#'                          Name,
#'                          FirstFlight,
#'                          MeanFlightHoursBetweenFailure,
#'                          Payload,
#'                          MaximumMachNumber,
#'                          RangeOfBVRMissiles)
#'
#' colnames(fj_data)<- c("Name",
#'                       "FirstFlight",
#'                       "MTBF (Y1)",
#'                       "Payload (Y2)",
#'                       "Mach (Y3)",
#'                       "BVRM (Y4)")
#' head(fj_data)
"fj_data"
