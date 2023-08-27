#' Read data from a google sheet
#'
#' Reads data from a sheets in a google sheet
#'
#' @param sheet The sheetname to read
#' @param url URL to the google workbook you want to read
#' @param skip The number of lines to skip before reading data, default to 1
#'
#' @return An r object with the data
#'
#' @importFrom googlesheets4 read_sheet
#'
#' @export


read.all.sheets <- function(sheet, url, skip = 1){

  df <- read_sheet(url, sheet = sheets, skip = skip)

  return(df)

}


#' Read data from a google sheet
#'
#' Reads data from a sheets in a google sheet
#'
#' @param url URL to the google workbook you want to read
#'
#' @return An r object with the data
#'
#' @importFrom googlesheets4 gs4_deauth read_sheet
#' @importFrom plyr llply
#'
#' @export

get.data <- function(url, skip=1){

  gs4_deauth()

  sheets <- sheet_names(url)

  l_all <- llply(sheets, read.all.sheets, url, skip)

  names(l_all) <- sheets

  return(l_all)

}
