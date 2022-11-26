#' Plot Information Criteria Values
#'
#' A function that plots information criteria values
#'
#' @param infValues A list of positive (double or integer) values
#'    of class "InfCriteria" indicating corresponding to BIC,
#'    AIC and ICL, respectively.
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
InfCriteriaPlot <- function(infValues) {

  data <- NULL

  # saving data into a dataframe
  DataToPlot <- data.frame(data = unlist(infValues),
                            names = c("BIC", "AIC", "ICL"))

  # plotting the information criteria values
  plotAxis <- ggplot2::ggplot(data = DataToPlot,
                             ggplot2::aes(x = names, y = data)) +
                             ggplot2::geom_point() +
                             ggplot2::labs(title = "Plot of information criteria values",
                             x = "Criterion", y = "Value") +
                             ggplot2::theme(panel.grid.major =  ggplot2::element_blank(),
                             panel.grid.minor =  ggplot2::element_blank(),
                             panel.background =  ggplot2::element_blank(),
                             axis.line =  ggplot2::element_line(colour = "black"))

  return(plotAxis)
}

# [END]

