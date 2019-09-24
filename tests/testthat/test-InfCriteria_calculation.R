test_that("model fitting", {
  library(TestingPackage)

  set.seed(1234)

  loglikelihood = -1001.01
  clusters = 3
  dimension = 6
  observations = 1000
  probability = c(0.1, 0.5, 0.4)

  Information_criteria <- InfCriteria_v3(loglikelihood = loglikelihood,
                               clusters = clusters,
                               dimension = dimension,
                               observations = observations,
                               probability = probability)

  expect_that(Information_criteria, is_a("InfCriteria"))
  expect_that(trunc(Information_criteria$BICresults), equals(2202))
  expect_that(trunc(Information_criteria$AICresults), equals(2060))
  expect_that(trunc(Information_criteria$ICLresults), equals(2202))
})




