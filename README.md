# TestingPackage

<!-- badges: start -->
<!-- badges: end -->

The goal of TestingPackage is to demonstrate how to develop a simple R package. 

## Installation

You can install the latest version of TestingPackage using

``` r
require("devtools")
install_github("anjalisilva/TestingPackage")
library("TestingPackage")
```

## Overview

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

The functions InfCriteria_v3 and InfCriteria_plot were authored by Anjali. The InfCriteria_v3 function makes use of functions from mclust R package to generate ICL values. The stats R package is used for generating multinomially distributed random number vectors.

The InfCriteria_plot makes use of the graphics R package to generate a plot of information criteria values. 


