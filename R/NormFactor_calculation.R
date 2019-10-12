#' Calculate Norm Factors
#'
#' A function that calculate normalization factors via TMM given a dataset
#'
#' @param dataset A matrix with n observations along rows and d dimensions.
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




