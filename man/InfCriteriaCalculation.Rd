% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/InfCriteriaCalculation.R
\name{InfCriteriaCalculation}
\alias{InfCriteriaCalculation}
\title{Calculates Information Criteria Values}
\usage{
InfCriteriaCalculation(
  loglikelihood = -5000,
  nClusters = 2,
  dimensionality = 6,
  observations = 1000,
  probability = c(0.6, 0.4)
)
}
\arguments{
\item{loglikelihood}{A negative double indicating the log-likelihood.}

\item{nClusters}{A positive integer indicating the number of clusters.
Default value is 2.}

\item{dimensionality}{A positive integer indicating the dimensionality of dataset.}

\item{observations}{A positive integer indicating the number of observations.}

\item{probability}{A vector indicating the probability of each cluster. The
vector should sum to 1.}
}
\value{
Returns an S3 object of class InfCriteria with results.
\itemize{
\item BICresults - A value of class "numeric" indicating BIC value.
\item AICresults - A value of class "numeric" indicating AIC value.
\item ICLresults - A value of class "numeric" indicating ICL value.
}
}
\description{
A function that calculates information criteria values (BIC, ICL, AIC)
given log-likelihood, number of clusters, dimension of dataset, and
number of observations, and the probability.
}
\examples{
# Example 1:
# Using GeneCounts dataset available with package
dim(GeneCounts) # a n = 30 by d = 3 dataset

# Calculate information criteria value
InfCriteriaResults <- InfCriteriaCalculation(
                          loglikelihood = -5080,
                          nClusters = 2,
                          dimensionality = ncol(GeneCounts),
                          observations = nrow(GeneCounts),
                          probability = c(0.5, 0.5))
InfCriteriaResults$BICresults

# Example 2:
# Obtain an external sample RNAseq dataset
\dontrun{
library(MBCluster.Seq)
data("Count")
dim(Count)

# Calculate information criteria value
InfCriteriaResults <- InfCriteriaCalculation(
                          loglikelihood = -5080,
                          nClusters = 2,
                          dimensionality = ncol(Count),
                          observations = nrow(Count),
                          probability = c(0.5, 0.5))
InfCriteriaResults$BICresults
}

# Example 3:
# Another way to obtain external data from another
# package that is only used for the example:
# More info, see: https://r-pkgs.org/r-cmd-check.html
\dontrun{
if (requireNamespace("RTCGA.rnaseq", quietly = TRUE)) {
library(RTCGA.rnaseq)
dim(ACC.rnaseq) # 79 20532

# Calculate information criteria value
InfCriteriaResults <- InfCriteriaCalculation(
                          loglikelihood = -5080,
                          nClusters = 2,
                          dimensionality = nrow(ACC.rnaseq),
                          observations = ncol(ACC.rnaseq),
                          probability = c(0.5, 0.5))
InfCriteriaResults$BICresults
}

# Example 4:
# Access raw data made available with this package
inputCountsPath <- system.file("extdata", "GeneCountsData2.csv", package = "TestingPackage")
# Read data
GeneCounts2 <- read.csv(file = inputCountsPath, header = TRUE)
dim(GeneCounts2) # 30  4
# To see documentation for this dataset
?GeneCounts2

# Calculate information criteria value
InfCriteriaResults <- InfCriteriaCalculation(
                          loglikelihood = -5080,
                          nClusters = 2,
                          dimensionality = nrow(inputCounts),
                          observations = ncol(inputCounts),
                          probability = c(0.5, 0.5))
InfCriteriaResults$BICresults
}

}
\references{
Akaike, H. (1973). Information theory and an extension of the maximum
likelihood principle. In \emph{Second International Symposium on Information
Theory}, New York, NY, USA, pp. 267–281. Springer Verlag. \href{https://link.springer.com/chapter/10.1007/978-1-4612-1694-0_15}{Link}

Biernacki, C., G. Celeux, and G. Govaert (2000). Assessing a mixture model for
clustering with the integrated classification likelihood. \emph{IEEE Transactions on Pattern
Analysis and Machine Intelligence} 22. \href{https://hal.inria.fr/inria-00073163/document}{Link}

Schwarz, G. (1978). Estimating the dimension of a model. \emph{The Annals of Statistics} 6, 461–464.
\href{https://projecteuclid.org/euclid.aos/1176344136}{Link}.

Yaqing, S. (2012). MBCluster.Seq: Model-Based Clustering for RNA-seq
Data. R package version 1.0.
\href{https://CRAN.R-project.org/package=MBCluster.Seq}{Link}.

Kosinski, M. (2021). RTCGA.rnaseq: Rna-seq datasets from
The Cancer Genome Atlas Project. R package version
20151101.22.0. \href{https://bioconductor.org/packages/release/data/experiment/html/RTCGA.rnaseq.html}{Link}.
}
