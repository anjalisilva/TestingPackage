# TestingPackage

<!-- badges: start -->
<!-- badges: end -->

## Description
The goal of TestingPackage is to demonstrate how to develop a simple R package. Insert a paragraph that describes the purpose of the package. Be sure to explain how your package add to or improve a current work flow in bioinformatics or computational biology (i.e., how is it unique?, what issue does it address?).


## Installation

To install the latest version of the package:

``` r
require("devtools")
install_github("anjalisilva/TestingPackage")
library("TestingPackage")
```

To run the shinyApp:
``` r
runTestingPackage()
```

## Overview

``` r
browseVignettes("TestingPackage")
```

This package contains 4 functions to illustrate how a simple R package functions. The InfCriteria_v3 function makes use of functions from mclust R package to generate ICL values. The stats R package is used for generating multinomially distributed random number vectors. The InfCriteria_plot makes use of the graphics R package to generate a plot of information criteria values. InfCriteria_plot use of the graphics R package to generate a plot of information criteria values. NormFactors is a function that calculate normalization factors via TMM given a dataset using edgeR R package. runTestingPackage is the function that launches the shiny app for this package.

Refer to package vignettes for more details. 

``` r
TestingPackage 
    |- LICENSE
    |- README
    |- data
        |- GeneCounts.rda
    |- inst
        |- extdata
            |- SILVA A A1.png
        |- shiny-scripts 
            |- app.R
        CITATION
    |- man
        |- GeneCounts.Rd
        |- InfCriteria_plot.Rd
        |- InfCriteria_v3.Rd
        |- NormFactors.Rd
        |- runTestingPackage.Rd
    |- R
        |- data.R
        |- InfCriteria_calculation.R
        |- InfCriteria_plot.R
        |- NormFactor_calculation.R
        |- runTestingPackage.R
    |- vignettes
        |- TestingPackageVignette.Rmd
    |- tests
        |- testthat.R 
        |- testthat
            |- test-InfCriteria_calculation.R
    |- DESCRIPTION
    |- NAMESPACE
    |- TestingPackage.Rproj
```

An overview of the package is illustrated below. 

![](./inst/extdata/SILVA_A_A1.png)


## Contributions

The author of the package is Anjali Silva. The functions available within this 
package include:

``` r
library("TestingPackage")
lsf.str("package:TestingPackage")
```

- InfCriteria_v3
- InfCriteria_plot

The functions InfCriteria_v3 and InfCriteria_plot were authored by Anjali. (If code has been used from another package, clearly state this: e.g., The functions InfCriteria_v3 was authored by Anjali. Part of the code for InfCriteria_v3 function has been taken from mclust R package. Section of the borrowed code is clearly indicated and referenced in the InfCriteria_calculation.R file, the R file corresponding to InfCriteria_v3 function and referenced in help file. Rest of the code was a contribution by Anjali. 

The InfCriteria_plot was authored by Anjali.) 






