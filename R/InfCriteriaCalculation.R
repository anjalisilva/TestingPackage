#' Calculates Information Criteria
#'
#' A function that calculates information criteria given log-likelihood,
#' number of clusters, dimension of dataset, and number of observations,
#' and the probability.
#'
#' @param loglikelihood A negative double indicating the log-likelihood.
#' @param nClusters A positive integer indicating the number of clusters.
#'    Default value is 2.
#' @param dimensionality A positive integer indicating the dimensionality of dataset.
#' @param observations A positive integer indicating the number of observations.
#' @param probability A vector indicating the probability of each cluster. The
#'    vector should sum to 1.
#'
#' @return Returns an S3 object of class InfCriteria with results.
#' \itemize{
#'   \item BICresults - A value of class "numeric" indicating BIC value.
#'   \item AICresults - A value of class "numeric" indicating AIC value.
#'   \item ICLresults - A value of class "numeric" indicating ICL value.
#' }
#'
#' @examples
#' # Example 1:
#' # Using GeneCounts dataset available with package
#' dim(GeneCounts)
#'
#' # Calculate information criteria value
#' InfCriteriaResults <- InfCriteriaCalculation(
#'                           loglikelihood = -5080,
#'                           nClusters = 2,
#'                           dimensionality = ncol(GeneCounts),
#'                           observations = nrow(GeneCounts),
#'                           probability = c(0.5, 0.5))
#' InfCriteriaResults$BICresults
#'
#' # Example 2:
#' # Obtain an external sample RNAseq dataset
#' \dontrun{
#' library(MBCluster.Seq)
#' data("Count")
#' dim(Count)
#'
#' # Calculate information criteria value
#' InfCriteriaResults <- InfCriteriaCalculation(
#'                           loglikelihood = -5080,
#'                           nClusters = 2,
#'                           dimensionality = ncol(Count),
#'                           observations = nrow(Count),
#'                           probability = c(0.5, 0.5))
#' InfCriteriaResults$BICresults
#'}
#'
#' # Example 3:
#' # Another way to obtain external data from another
#' # package that is only used for the example:
#' # More info, see: https://r-pkgs.org/r-cmd-check.html
#' \dontrun{
#' if (requireNamespace("RTCGA.rnaseq", quietly = TRUE)) {
#' library(RTCGA.rnaseq)
#' dim(ACC.rnaseq) # 79 20532
#'
#' # Calculate information criteria value
#' InfCriteriaResults <- InfCriteriaCalculation(
#'                           loglikelihood = -5080,
#'                           nClusters = 2,
#'                           dimensionality = nrow(ACC.rnaseq),
#'                           observations = ncol(ACC.rnaseq),
#'                           probability = c(0.5, 0.5))
#' InfCriteriaResults$BICresults
#'}
#'
#' # Example 4:
#' # Access raw data made available with this package
#' inputCountsPath <- system.file("extdata", "GeneCountsData2.csv", package = "TestingPackage")
#' # Read data
#' GeneCounts2 <- read.csv(file = inputCountsPath, header = TRUE)
#' dim(GeneCounts2) # 30  4
#' # To see documentation for this dataset
#' ?GeneCounts2
#'
#' # Calculate information criteria value
#' InfCriteriaResults <- InfCriteriaCalculation(
#'                           loglikelihood = -5080,
#'                           nClusters = 2,
#'                           dimensionality = nrow(inputCounts),
#'                           observations = ncol(inputCounts),
#'                           probability = c(0.5, 0.5))
#' InfCriteriaResults$BICresults
#' }
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
#'Yaqing, S. (2012). MBCluster.Seq: Model-Based Clustering for RNA-seq
#'Data. R package version 1.0.
#'\href{https://CRAN.R-project.org/package=MBCluster.Seq}{Link}.
#'
#'Kosinski, M. (2021). RTCGA.rnaseq: Rna-seq datasets from
#'The Cancer Genome Atlas Project. R package version
#'20151101.22.0. \href{https://bioconductor.org/packages/release/data/experiment/html/RTCGA.rnaseq.html}{Link}.
#'
#' @export
#' @import mclust
#' @import stats
InfCriteriaCalculation <- function(loglikelihood,
                                   nClusters = 2,
                                   dimensionality,
                                   observations,
                                   probability) {

  # Performing checks of user input
  if (typeof(loglikelihood) != "double" & class(loglikelihood) != "numeric") {
    stop("Loglikelihood should be a negative value of class numeric indicating
         the log-likelihood.")
  }

  if(loglikelihood > 0) {
    stop("Loglikelihood should be a negative value.")
  }

  if(is.numeric(nClusters) == FALSE) {
    stop("nClusters should be a positive integer indicating the number of clusters.")
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


  if(is.numeric(dimensionality) == FALSE) {
    stop("dimensionality should be a positive integer indicating the positive integer
         indicating the dimensionality of dataset.")
  }

  if(is.numeric(observations) == FALSE) {
    stop("observations positive integer indicating the number of observations.")
  }

  if(is.numeric(probability) == FALSE) {
    stop("probability should be a numeric vector indicating the probability of each cluster.")
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

# You can have more than function in a given script file

#' Calculate Normalization Factors
#'
#' A function that calculate normalization factors via trimmed mean of
#' M-values (TMM) given an RNA sequencing dataset containing raw counts.
#'
#' @param dataset A matrix of integers, with n observations along rows
#'   and d dimensions for columns. Typically, d < n.
#'
#' @return Returns an object, normFactors, with normalization factors.
#'
#' @examples
#' dim(GeneCounts)
#' normGeneCounts <- NormFactors(dataset = as.matrix(GeneCounts))
#'
#' @references
#' Robinson, M. D., McCarthy, D. J. and Smyth, G. K. (2010). edgeR: a
#' Bioconductor package for differential expression analysis of digital gene
#' expression data. \emph{Bioinformatics}, 26, 139-140.
#' \href{https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2796818/}{Link}
#'
#' McCarthy, D. J., Chen, Y. and Smyth, G. K. (2012). Differential expression
#' analysis of multifactor RNA-Seq experiments with respect to biological
#' variation. \emph{Nucleic Acids Research}, 40, 4288-4297.
#' \href{https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3378882/}{Link}
#'
#' @export
#' @importFrom edgeR calcNormFactors
NormFactors <- function(dataset) {

  # Performing checks of user input
  if (typeof(dataset) != "double" & typeof(dataset) != "integer") {
    stop("Argument dataset type needs to be integer.")
  }

  if (any((dataset %% 1 == 0) == FALSE)) {
    stop("Argument dataset should be a matrix of counts.")
  }

  if (is.matrix(dataset) != TRUE) {
    stop("Argument dataset needs to be a matrix.")
  }

  if (any(colSums(dataset) <= 0)) {
    stop("Column sums of dataset cannot be less than or equal to 0.
      Double check the dataset.")
  }

  # Uses the edgeR package to obtain normalization factors
  normFactors <- log(as.vector(edgeR::calcNormFactors(as.matrix(dataset),
    method = "TMM")))

  class(normFactors) <- "NormFactors"
  return(normFactors)
}


# [END]
