# TestingPackage

<!-- badges: start -->
<!-- badges: end -->

The goal of TestingPackage is to demonstrate how to develop a simple R package. 

## Installation

To install the latest version of the package:

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

(If code has been used from another package, clearly state this: e.g., The functions InfCriteria_v3 was authored by Anjali. Part of the code for InfCriteria_v3 function has been taken from mclust R package. Section of the borrowed code is clearly indicated and referenced in the InfCriteria_calculation.R file, the R file corresponding to InfCriteria_v3 function and referenced in help file. Rest of the code was a contribution by Anjali. 

The InfCriteria_plot is authored by Anjali and makes use of the graphics R package to generate a plot of information criteria values.) 






