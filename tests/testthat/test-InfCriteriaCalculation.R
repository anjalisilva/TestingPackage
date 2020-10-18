context("InfCriteria calculation")
library(TestingPackage)

test_that("model fitting with three clusters", {

  loglikelihood = -1001.01
  clusters = 3
  dimension = 6
  observations = 1000
  probability = c(0.1, 0.5, 0.4)

  InformationCriteria <- InfCriteriaCalculation(
                               loglikelihood = loglikelihood,
                               clusters = clusters,
                               dimension = dimension,
                               observations = observations,
                               probability = probability)

  expect_that(InformationCriteria, is_a("InfCriteriaCalculation"))
  expect_that(trunc(InformationCriteria$BICresults), equals(2202))
  expect_that(trunc(InformationCriteria$AICresults), equals(2060))
  expect_that(trunc(InformationCriteria$ICLresults), equals(2202))
})


test_that("model fitting with two clusters", {

  loglikelihood = -2001.01
  clusters = 2
  dimension = 6
  observations = 1000
  probability = c(0.4, 0.6)

  InformationCriteria <- InfCriteriaCalculation(
    loglikelihood = loglikelihood,
    clusters = clusters,
    dimension = dimension,
    observations = observations,
    probability = probability)

  expect_that(InformationCriteria, is_a("InfCriteriaCalculation"))
  expect_that(trunc(InformationCriteria$BICresults), equals(4195))
  expect_that(trunc(InformationCriteria$AICresults), equals(4058))
  expect_that(trunc(InformationCriteria$ICLresults), equals(4195))
})


