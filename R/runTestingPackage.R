#' Launch the shiny app for package TestingPackage
#'
#' A function that launches the shiny app for this package.
#' The code has been placed in \code{./inst/shiny-scripts}.
#'
#' @return No return value but open up a shiny page.
#'
#' @examples
#' \dontrun{
#' runTestingPackage()
#' }
#'
#' @export
#' @importFrom shiny runApp

runTestingPackage <- function() {
  appDir <- system.file("shiny-scripts",
    package = "TestingPackage")
  shiny::runApp(appDir, display.mode = "normal")
  return()
}
