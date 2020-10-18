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
#' InfCriteriaResults <- InfCriteriaV3(loglikelihood = -5080,
#'                                       clusters = 2,
#'                                       dimension = 3,
#'                                       observations = 1000,
#'                                       probability = c(0.5, 0.5))
#' InfCriteriaResults$BICresults
#'
#' @references
#'Akaike, H. (1973). Information theory and an extension of the maximum
#'likelihood principle. In \emph{Second International Symposium on Information
#'Theory}, New York, NY, USA, pp. 267–281. Springer Verlag. \href{https://link.springer.com/chapter/10.1007/978-1-4612-1694-0_15}{Link}
#'
#'Biernacki, C., G. Celeux, and G. Govaert (2000). Assessing a mixture model for
#'clustering with the integrated classification likelihood. \emph{IEEE Transactions on Pattern
#'Analysis and Machine Intelligence} 22. \href{https://hal.inria.fr/inria-00073163/document}{Link}
#'
#'Schwarz, G. (1978). Estimating the dimension of a model. \emph{The Annals of Statistics} 6, 461–464.
#'\href{https://projecteuclid.org/euclid.aos/1176344136}{Link}.
#'
#' @export
#' @import mclust
#' @import stats
InfCriteriaCalculation <- function(loglikelihood, clusters, dimension,
  observations, probability) {

  # Using a multinomial distribution to generate cluster memberships
  zValue <- t(stats::rmultinom(100, size = 1, prob = probability))

  # Calculating the number of parameters
  kParameters <- ((dimension + 1) * dimension) / 2 + dimension + (clusters - 1)

  # Calculating BIC
  BIC <- - 2 * loglikelihood + (kParameters * log(observations))

  # Calculating AIC
  AIC <- - 2 * loglikelihood + (2 * kParameters)

  # Calculating ICL
  mapz <- mclust::unmap(mclust::map(zValue[, 1:clusters]))
  forICL <- function(gClusters)
    {sum(log(zValue[which(mapz[, gClusters] == 1), gClusters]))}
  ICL <- (BIC + sum(sapply(1:clusters, forICL)))

  Results <- list(BICresults = BIC,
                  AICresults = AIC,
                  ICLresults = ICL)
  class(Results) <- "InfCriteriaCalculation"
  return(Results)
}
# [END]



