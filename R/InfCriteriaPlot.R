#' Scatter Plot Of Information Criteria Values
#'
#' A function that plots information criteria values as a scatter plot.
#' Here, information criterion AIC, BIC and ICL are provided along x-axis
#' and information criterion value along the y-axis.
#'
#' @param infValues A list of positive (double or integer) values
#'    of class "InfCriteria" indicating information criteria values
#'    corresponding to BIC, AIC and ICL, respectively.
#'
#' @param plotTitle A character vector specifying a custom name
#'    for the plot to be created. Default is "Plot of information
#'     criteria values".
#'
#' @return Returns a scatter plot showing information criteria values
#'    versus the criterion.
#'
#' @examples
#' InfCriteriaResults <- TestingPackage::InfCriteriaCalculation(
#'                                              loglikelihood = -5080,
#'                                              nClusters = 2,
#'                                              dimensionality = 3,
#'                                              observations = 1000,
#'                                              probability = c(0.5, 0.5))
#' InfCriteriaPlot(infValues = InfCriteriaResults)
#'
#' @export
#' @importFrom ggplot2 ggplot
InfCriteriaPlot <- function(infValues = list(10229.08, 10180, 10229.08),
                            plotTitle = NA) {

  # Performing checks of user input
  if (!is.numeric(unlist(infValues))) {
    stop("infValues argument should be provided a list of
         numeric values corresponding to BIC, AIC and ICL,
         respectively.")
  }

  data <- NULL

  # saving data into a dataframe
  DataToPlot <- data.frame(data = unlist(infValues),
                            names = c("BIC", "AIC", "ICL"))

  # check if user provided title present, if not assign
  if(is.na(plotTitle)) {
    plotTitle <- "Plot of information criteria values"
  }

  # plotting the information criteria values
  plotAxis <- ggplot2::ggplot(data = DataToPlot,
                             ggplot2::aes(x = names, y = data)) +
                             ggplot2::geom_point() +
                             ggplot2::labs(title = plotTitle,
                             x = "Criterion", y = "Value") +
                             ggplot2::theme(panel.grid.major =  ggplot2::element_blank(),
                             panel.grid.minor =  ggplot2::element_blank(),
                             panel.background =  ggplot2::element_blank(),
                             axis.line =  ggplot2::element_line(colour = "black"))

  return(plotAxis)
}

# [END]

