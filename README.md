
<!-- README.md is generated from README.Rmd. Please edit that file -->

# TestingPackage

An Example R Package For BCB410H: Applied Bioinformatics.

<!-- badges: start -->
<!-- https://www.codefactor.io/repository/github/anjalisilva/testingpackage/issues -->

[![CodeFactor](https://www.codefactor.io/repository/github/anjalisilva/testingpackage/badge)](https://www.codefactor.io/repository/github/anjalisilva/testingpackage)
[![GitHub
issues](https://img.shields.io/github/issues/anjalisilva/TestingPackage)](https://github.com/anjalisilva/TestingPackage/issues)
[![License](https://img.shields.io/badge/license-MIT-green)](./LICENSE)
![GitHub language
count](https://img.shields.io/github/languages/count/anjalisilva/TestingPackage)
![GitHub commit activity
(branch)](https://img.shields.io/github/commit-activity/y/anjalisilva/TestingPackage/master)

<!-- https://shields.io/category/license -->
<!-- badges: end -->

## Description

A paragraph that describes the purpose of your R package. Explain how
your package add to or improve a current work flow in bioinformatics or
computational biology (i.e., how is it unique?, what issue does it
address?). Finally, include the R version (not RStudio version) and
platform (Mac, Windows, Linux (Debian, Fedora/Redhat, Ubuntu)), used to
develop the package. There should be no `Shiny` implementation at this
point. You may obtain this information by running
`utils::sessionInfo()`. E.g., <br> <br> <br> `TestingPackage` is an R
package to demonstrate components of a simple R package. This includes
the main components: DESCRIPTION, NAMESPACE, man subdirectory and R
subdirectory. Additionally, LICENSE, README and subdirectories
vignettes, tests, data and inst are also explored. The package is
targeted for BCB410H (Applied Bioinformatics) students, who are to
define a useful tool for the analysis of biological data in the format
of a public R package housed on GitHub. The scope of the R package is to
add to or improve a current work flow in bioinformatics or computational
biology. The tool should contain functions to perform analysis of
biological data and to produce a compelling graphical output, ideally to
support for exploratory analysis. The `TestingPackage` package was
developed using `R version 4.1.1 (2021-08-10)`,
`Platform: x86_64-apple-darwin17.0 (64-bit)` and
`Running under: macOS Big Sur 11.2`.

## Installation

Provide the following text and commands, customized to your R package.
E.g., <br> <br> <br> To install the latest version of the package:

``` r
require("devtools")
devtools::install_github("anjalisilva/TestingPackage", build_vignettes = TRUE)
library("TestingPackage")
```

To run the Shiny app:

``` r
runTestingPackage()
```

## Overview

Provide the following commands, customized to your R package. Then
provide an overview to briefly describe the main components of the
package. Include one image illustrating the overview of the package,
that shows the inputs and outputs. Ensure the image is deposited in the
correct location, as discussed in class. Point the user to vignettes for
a tutorial of your package. E.g., <br> <br> <br>

``` r
ls("package:TestingPackage")
data(package = "TestingPackage") 
browseVignettes("TestingPackage")
```

`TestingPackage` contains 4 functions to demonstrate components of a
simple R package. The *InfCriteriaCalculation* function calculates the
information criteria values. Specifically, Bayesian information
criterion (BIC), Akaike information criterion (AIC) and Integrated
Complete Likelihood (ICL) are calculated. The *InfCriteriaPlot*
generates a plot of information criteria values. *NormFactors* is a
function that calculates normalization factors via Trimmed Mean of
M-values (TMM). The *runTestingPackage* is the function that launches
the shiny app for this package. The package also contains two RNA
sequencing datasets, called GeneCounts and GeneCounts2. Refer to package
vignettes for more details. An overview of the package is illustrated
below.

![](./inst/extdata/SILVA_A_A1.png)

## Contributions

Provide a paragraph clearly indicating the name of the author of the
package, contributions from the author and contributions from other
packages/sources for each function. Remember your individual
contributions to the package are important. E.g., <br> <br> <br> The
author of the package is Anjali Silva. The *InfCriteriaCalculation*
function makes use of map function from `mclust` R package to generate
information criteria values. The Integrated Complete Likelihood (ICL)
values are calculated using a function written by the author. The
`stats` R package is used for generating multinomially distributed
random number vectors. Part of the code for *InfCriteriaCalculation*
function has been taken from `<NamePackage>` R package. (Section of the
borrowed code should be clearly indicated and referenced in the
InfCriteriaCalculation R script). The *InfCriteriaPlot* function makes
use of the `graphics` R package. *NormFactors* function uses Trimmed
Mean of M-values (TMM) as implemented in `edgeR` R package.

## References

Provide full references for all sources used, including for the packages
mentioned under ‘Contributions’, in one format. E.g., <br> <br>

- Akaike, H. (1973). Information theory and an extension of the maximum
  likelihood principle. In *Second International Symposium on
  Information Theory*, New York, USA, 267–281. Springer Verlag.
  <https://link.springer.com/chapter/10.1007/978-1-4612-1694-0_15>.

- Biernacki, C., G. Celeux, and G. Govaert (2000). Assessing a mixture
  model for clustering with the integrated classification likelihood.
  *IEEE Transactions on Pattern Analysis and Machine Intelligence* 22.
  <https://hal.inria.fr/inria-00073163/document>

- BioRender. (2020). Image created by Silva, A. Retrieved October 30,
  2020, from <https://app.biorender.com/>

- McCarthy, D. J., Chen Y. and Smyth, G. K. (2012). Differential
  expression analysis of multifactor RNA-Seq experiments with respect to
  biological variation. *Nucleic Acids Research* 40. 4288-4297.
  <https://pubmed.ncbi.nlm.nih.gov/22287627/>

- R Core Team (2022). R: A language and environment for statistical
  computing. R Foundation for Statistical Computing, Vienna, Austria.
  <https://www.R-project.org/>

- Schwarz, G. (1978). Estimating the dimension of a model. *The Annals
  of Statistics* 6, 461–464.
  <https://projecteuclid.org/euclid.aos/1176344136>.

- Scrucca, L., Fop, M., Murphy, T. B. and Raftery, A. E. (2016) mclust
  5: clustering, classification and density estimation using Gaussian
  finite mixture models. *The R Journal* 8(1), 289-317.
  <https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5096736/>

- Wickham, H. and Bryan, J. (2019). *R Packages* (2nd edition). Newton,
  Massachusetts: O’Reilly Media. <https://r-pkgs.org/>

## Acknowledgements

Provide the following text, customized to your R package. E.g., <br>
<br> <br> This package was developed as part of an assessment for
2019-2022 BCB410H: Applied Bioinformatics course at the University of
Toronto, Toronto, CANADA. `TestingPackage` welcomes issues, enhancement
requests, and other contributions. To submit an issue, use the [GitHub
issues](https://github.com/anjalisilva/TestingPackage/issues). Many
thanks to those who provided feedback to improve this package.

## Alumni Packages

Packages developed by BCB410 alumni. Many thanks to those who provided
permission to share their packages! <br>

### 2022

- [EVEP](https://github.com/SZFukunaga/EVEP)

- [AbunRNA](https://github.com/zhangchengyue/AbunRNA)

- [DeregGenes](https://github.com/wezhubb/DeregGenes)

### 2021

- [scRGNet](https://github.com/ff98li/scRGNet)

- [DEVisComp](https://github.com/Lori-tan/DEVisComp)

- [covid19Canada](https://github.com/RicoZong/covid19Canada)

- [IntegrationScore](https://github.com/eliaswilliams/IntegrationScore)

- [MyoManager](https://github.com/karenkuang37/MyoManager)

- [snpCYP](https://github.com/a-albuquerque/snpCYP)

- [VisualSARSDiff](https://github.com/aryanahmad/VisualSARSDiff)

- [clustREval](https://github.com/cindyfang70/clustREval)

- [ClustPhy](https://github.com/rainali475/ClustPhy)

### 2020

- [gscVisualizer](https://github.com/Deemolotus/gscVisualizer)

- [microCompet](https://github.com/MolyWang/microCompet)

- [uniprotProteinView](https://github.com/zzaassaa2/uniprotProteinView)

- [MethylExpress](https://github.com/diannamcallister/MethylExpress)

- [dynUGENE;](https://github.com/tianyu-lu/dynUGENE)
  [manuscript](https://www.biorxiv.org/content/10.1101/2021.01.07.425782v1)

- [pdb3D](https://github.com/kevin949373048/pdb3D)

- [STRExpansionAnalyzer](https://github.com/michaelzwong/STRExpansionAnalyzer)

- [CellTyPETool](https://github.com/meconsens/CellTyPETool)

- [ChIPanalyzer](https://github.com/RyDe4/ChIPanalyzer)

## Package Structure

The package structure is illustrated below:

![](./inst/extdata/SILVA_A_A2.png) <br> <br> The package tree structure
is provided below.

``` r
- TestingPackage
  |- TestingPackage.Rproj
  |- DESCRIPTION
  |- NAMESPACE
  |- LICENSE
  |- README
  |- data
    |- GeneCounts.rda
    |- GeneCounts2.rda
  |- inst
    CITATION
    |- extdata
      |- SILVA_A_A1.png
      |- GeneCountsData2.csv
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
