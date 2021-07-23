#' US Fighter Jet Data
#'
#'
#' Data used for technology forecasting of US fighter jet aircraft.
#' Consists of aircraft from 1944 to 1982.  The dataset includes 19 aircraft
#' with the name, year of introduction, and 17 characteristics.
#' Data was originally collected by Dr. Joseph Martino and used in his
#' publications such as The Technology Forecasting Handbook.
#'
#' @docType data
#'
#' @usage data(fighter_jet)
#'
#' @format A dataframe object.
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
"fighter_jet"
