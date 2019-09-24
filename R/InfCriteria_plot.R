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
#' @import graphics
InfCriteria_plot <- function(inf_values) {

  # plotting the information criteria values
  plot_example <- graphics::plot(unlist(inf_values), type = "p",
    ylab = "Inf. Criteria Value", xlab = "Inf. Criterion",
    xaxt = "n")
  plot_axis <- plot_example + axis(1, at = 1:3, labels = c("BIC", "AIC", "ICL"))
  return(plot_axis)
}



