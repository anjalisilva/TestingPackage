context("InfCriteria calculation")
library(TestingPackage)

test_that("model fitting with three clusters", {

  loglikelihood = -1001.01
  nClusters = 3
  dimensionality = 6
  observations = 1000
  probability = c(0.1, 0.5, 0.4)

  InformationCriteria <- InfCriteriaCalculation(
    loglikelihood = loglikelihood,
    nClusters = nClusters,
    dimensionality = dimensionality,
    observations = observations,
    probability = probability)

  expect_type(InformationCriteria, "list")
  expect_s3_class(InformationCriteria, "InfCriteriaCalculation")
  expect_length(InformationCriteria, 3)
  expect_identical(trunc(InformationCriteria$BICresults), 2202)
  expect_identical(trunc(InformationCriteria$AICresults), 2060)
  expect_identical(trunc(InformationCriteria$ICLresults), 2202)
})


test_that("model fitting with two clusters", {

  loglikelihood = -2001.01
  nClusters = 2
  dimensionality = 6
  observations = 1000
  probability = c(0.4, 0.6)

  InformationCriteria <- InfCriteriaCalculation(
    loglikelihood = loglikelihood,
    nClusters = nClusters,
    dimensionality = dimensionality,
    observations = observations,
    probability = probability)


  expect_type(InformationCriteria, "list")
  expect_s3_class(InformationCriteria, "InfCriteriaCalculation")
  expect_length(InformationCriteria, 3)
  expect_identical(trunc(InformationCriteria$BICresults), 4195)
  expect_identical(trunc(InformationCriteria$AICresults), 4058)
  expect_identical(trunc(InformationCriteria$ICLresults), 4195)
})

# [END]
