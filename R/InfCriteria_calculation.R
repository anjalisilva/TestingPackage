#' Calculates Information Criteria
#'
#' A function that calculates information criteria given log-likelihood,
#' number of clusters, dimension of dataset, and number of observations,
#' and the probability
#'
#' @param loglikelihood A negative value of class "numeric" indicating
#'    the log-likelihood
#' @param clusters A positive integer indicating the number of clusters
#' @param dimension A positive integer indicating the dimension of dataset
#' @param observations A positive integer indicating the number of observations
#' @param probability A vector indicating the probability of each cluster
#'
#' @return Returns an S3 object of class InfCriteria with results.
#' \itemize{
#'   \item BICresults - A value of class "numeric" indicating BIC value
#'   \item AICresults - A value of class "numeric" indicating AIC value
#'   \item ICLresults - A value of class "numeric" indicating ICL value
#' }
#'
#' @examples
#' InfCriteria_results <- InfCriteria_v3(loglikelihood = -5080,
#'                                       clusters = 2,
#'                                       dimension = 3,
#'                                       observations = 1000,
#'                                       probability = c(0.5, 0.5))
#' InfCriteria_results$BICresults
#'
#' @references
#'Akaike, H. (1973). Information theory and an extension of the maximum
#'likelihood principle. In \emph{Second International Symposium on Information
#'Theory}, New York, NY, USA, pp. 267–281. Springer Verlag. \href{https://link.springer.com/chapter/10.1007/978-1-4612-1694-0_15}{Link}
#'
#' @export
#' @import mclust
#' @import stats
InfCriteria_v3 <- function(loglikelihood, clusters, dimension,
  observations, probability) {

  # Using a multinomial distribution to generate cluster memberships
  z <- t(stats::rmultinom(100, size = 1, prob = probability))

  # Calculating the number of parameters
  k <- ((dimension + 1) * dimension) / 2 + dimension + (clusters - 1)

  # Calculating BIC
  BIC <- - 2 * loglikelihood + (k * log(observations))

  # Calculating AIC
  AIC <- - 2 * loglikelihood + (2 * k)

  # Calculating ICL
  mapz <- mclust::unmap(mclust::map(z[, 1:clusters]))
  forICL <- function(g) {sum(log(z[which(mapz[, g] == 1), g]))}
  ICL <- (BIC + sum(sapply(1:clusters, forICL)))

  Results <- list(BICresults = BIC,
                  AICresults = AIC,
                  ICLresults = ICL)
  class(Results) <- "InfCriteria"

  return(Results)
}




