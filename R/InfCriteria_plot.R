#' Plot Information Criteria Values
#'
#' A function that plots information criteria values
#'
#' @param inf_values A list of negative values of class "InfCriteria" indicating
#'    the log-likelihood corresponding to BIC, AIC and ICL, respectively.
#'
#' @return Returns a plot of information criteria values
#'
#' @examples
#' InfCriteria_results <- InfCriteria_v3(loglikelihood = -5080,
#'                                       clusters = 2,
#'                                       dimension = 3,
#'                                       observations = 1000,
#'                                       probability = c(0.5, 0.5))
#' InfCriteria_plot(inf_values = InfCriteria_results)
#'
#' @export
#' @importFrom ggplot2 ggplot
InfCriteria_plot <- function(inf_values) {

  # saving data into a dataframe
  Data_toPlot <- data.frame(data = unlist(inf_values),
                            names = c("BIC", "AIC", "ICL"))

  # plotting the information criteria values
  plot_axis <- ggplot2::ggplot(Data_toPlot, aes(names, data)) +
               geom_point() + theme(panel.grid.major = element_blank(),
               panel.grid.minor = element_blank(),
               panel.background = element_blank(),
               axis.line = element_line(colour = "black"))

  return(plot_axis)
}



