
<!-- README.md is generated from README.Rmd. Please edit that file -->
TestingPackage
==============

<!-- badges: start -->
<!-- badges: end -->
Description
-----------

A paragraph that describes the purpose of the package. Explain how your package add to or improve a current work flow in bioinformatics or computational biology (i.e., how is it unique?, what issue does it address?).

E.g., `TestingPackage` is an R package to demonstrate components of a simple R package. This includes the main components: DESCRIPTION, NAMESPACE, man subdirectory and R subdirectory. Additionally, licence, README and subdirectories vignettes, tests, data and inst are also explored. The package is targeted for BCB410H students exploring development of an R package in bioinformatics.

Installation
------------

To install the latest version of the package:

``` r
require("devtools")
devtools::install_github("anjalisilva/TestingPackage", build_vignettes = TRUE)
library("TestingPackage")
```

To run the shinyApp:

``` r
runTestingPackage()
```

Overview
--------

``` r
ls("package:TestingPackage")
data(package = "TestingPackage") # optional
```

After these commands, provide an overview that briefly describes the main components of the package. Point the user to vignettes for more details. Include an image illustrating the overview of the package.

E.g., `TestingPackage` contains 4 functions to demonstrate components of a simple R package. The *InfCriteriaCalculation* function calculates the information criteria values. Specifically, Bayesian information criterion (BIC), Akaike information criterion (AIC) and Integrated Complete Likelihood (ICL) are calculated. The *InfCriteriaPlot* generates a plot of information criteria values. *NormFactors* is a function that calculates normalization factors via Trimmed Mean of M-values (TMM). The *runTestingPackage* is the function that launches the shiny app for this package. The package also contains RNA sequencing dataset GeneCounts. Refer to package vignettes for more details.

``` r
browseVignettes("TestingPackage")
```

The package tree structure is provided below (optional).

``` r
- TestingPackage
  |- TestingPackage.Rproj
  |- DESCRIPTION
  |- NAMESPACE
  |- LICENSE
  |- README
  |- data
    |- GeneCounts.rda
  |- inst
    CITATION
    |- extdata
      |- SILVA A A1.png
    |- shiny-scripts 
        |- app.R
  |- man
    |- GeneCounts.Rd
    |- InfCriteriaCalculation.Rd
    |- NormFactors.Rd
    |- InfCriteriaPlot.Rd
  |- R
    |- data.R
    |- InfCriteriaCalculation.R
    |- InfCriteriaPlot.R
    |- NormFactorCalculation.R
  |- vignettes
    |- TestingPackageVignette.Rmd
  |- tests
    |- testthat.R
    |- testthat
    |- test-InfCriteriaCalculation.R
```

An overview of the package is illustrated below.

![](./inst/extdata/SILVA_A_A1.png)

Contributions
-------------

Provide a note clearly indicating contributions from you and contributions from other packages/sources for each function. Remember your individual contributions to the package are important.

E.g., The author of the package is Anjali Silva. The *InfCriteriaCalculation* function makes use of map function from `mclust` R package to generate ICL values. The `stats` R package is used for generating multinomially distributed random number vectors. (If applies: Part of the code for *InfCriteriaCalculation* function has been taken from `<NamePackage>` R package. Section of the borrowed code is clearly indicated and referenced in the InfCriteriaCalculation help file). The *InfCriteriaPlot* makes use of the `graphics` R package. *NormFactors* uses Trimmed Mean of M-values (TMM) as implemented in `edgeR` R package.

References
----------

Provide full references for all sources used in one specific format. E.g.,

Akaike, H. (1973). Information theory and an extension of the maximum likelihood principle. In *Second International Symposium on Information Theory*, New York, NY, USA, pp. 267–281. Springer Verlag. <https://link.springer.com/chapter/10.1007/978-1-4612-1694-0_15>.

Biernacki, C., G. Celeux, and G. Govaert (2000). Assessing a mixture model for clustering with the integrated classification likelihood. *IEEE Transactions on Pattern Analysis and Machine Intelligence* 22. <https://hal.inria.fr/inria-00073163/document>

Schwarz, G. (1978). Estimating the dimension of a model. *The Annals of Statistics* 6, 461–464. <https://projecteuclid.org/euclid.aos/1176344136>.

Acknowledgements
----------------

This package was developed as part of an assessment for 2019-2020 BCB410H: Applied Bioinformatics, University of Toronto, Toronto, CANADA.
