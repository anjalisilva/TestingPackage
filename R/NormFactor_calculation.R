#' Calculate Norm Factors
#'
#' A function that calculate normalization factors via TMM
#'
#' @param dataset A negative value of class "numeric" indicating
#'    the log-likelihood
#'
#' @return Returns an object, norm_factors, with normalization factors.
#'
#' @examples
#'   dim(GeneCounts)
#'   norm_factors <- log(as.vector(edgeR::calcNormFactors(as.matrix(GeneCounts), method = "TMM")))
#'
#' @export
#' @importFrom edgeR calcNormFactors
NormFactors <- function(dataset) {

  norm_factors <- log(as.vector(edgeR::calcNormFactors(as.matrix(dataset), method = "TMM")))

  class(norm_factors) <- "NormFactors"

  return(norm_factors)
}




