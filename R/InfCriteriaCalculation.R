#' Calculates Information Criteria
#'
#' A function that calculates information criteria given log-likelihood,
#' number of clusters, dimension of dataset, and number of observations,
#' and the probability
#'
#' @param loglikelihood A negative value of class "numeric" indicating
#'    the log-likelihood
#' @param nClusters A positive integer indicating the number of clusters
#' @param dimensionality A positive integer indicating the dimensionality of dataset
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
#' # Using GeneCounts dataset available with package
#' dim(GeneCounts)
#'
#' # Calculate information criteria value
#' InfCriteriaResults <- InfCriteriaCalculation(loglikelihood = -5080,
#'                                              nClusters = 2,
#'                                              dimensionality = ncol(GeneCounts),
#'                                              observations = nrow(GeneCounts),
#'                                              probability = c(0.5, 0.5))
#' InfCriteriaResults$BICresults
#'
#' \dontrun{
#' # Obtain an external sample RNAseq dataset
#' library(MBCluster.Seq)
#' data("Count")
#' dim(Count)
#'
#' # Calculate information criteria value
#' InfCriteriaResults <- InfCriteriaCalculation(loglikelihood = -5080,
#'                                              nClusters = 2,
#'                                              dimensionality = ncol(Count),
#'                                              observations = nrow(Count),
#'                                              probability = c(0.5, 0.5))
#' InfCriteriaResults$BICresults
#'}
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
InfCriteriaCalculation <- function(loglikelihood,
                                   nClusters,
                                   dimensionality,
                                   observations,
                                   probability) {
  
  # Performing checks of user input
  if (typeof(loglikelihood) != "double" & class(loglikelihood) != "numeric") {
    stop("Loglikelihood type needs to double")
  }
  
  if(loglikelihood > 0) {
    stop("Loglikelihood should be a negative value.")
  }
  
  if(nClusters <= 0) {
    stop("nClusters should be a positive integer indicating the number of clusters.")
  }
  
  # An alternative to correct user input
  if(nClusters < 0) {
    warning("nClusters should be a positive integer indicating the number of clusters.
            Input value corrected to be positive.", call. = FALSE)
    nClusters <- abs(nClusters) # correct the input for user
  }
  
  if(sum(probability) != 1) {
    stop("Input values for probability should sum to 1.")
  }
  
  

  # Start analysis
  # Using a multinomial distribution to generate cluster memberships
  # Provide a message to user about the number of clusters
  message("Generating data for ", nClusters, " clusters.")
  zValue <- t(stats::rmultinom(100, size = 1, prob = probability))
  
  # Calculating the number of parameters
  kParameters <- ((dimensionality + 1) * dimensionality) / 2 +
    dimensionality + (nClusters - 1)
  
  # Calculating BIC
  BIC <- - 2 * loglikelihood + (kParameters * log(observations))
  
  # Calculating AIC
  AIC <- - 2 * loglikelihood + (2 * kParameters)
  
  # Calculating ICL
  mapz <- mclust::unmap(mclust::map(zValue[, 1:nClusters]))
  forICL <- function(gClusters)
  {sum(log(zValue[which(mapz[, gClusters] == 1), gClusters]))}
  ICL <- (BIC + sum(sapply(1:nClusters, forICL)))
  
  Results <- list(BICresults = BIC,
                  AICresults = AIC,
                  ICLresults = ICL)
  
  class(Results) <- "InfCriteriaCalculation"
  return(Results)
}

# [END]
