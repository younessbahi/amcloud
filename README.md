
# amcloud
<!-- badges: start -->
[![R-CMD-check](https://github.com/younessbahi/amcloud/workflows/R/badge.svg)](https://github.com/younessbahi/amcloud/actions)
[![R-CMD-check](https://github.com/younessbahi/amcloud/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/younessbahi/amcloud/actions/workflows/R-CMD-check.yaml)
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->


**amcloud** is a wrapper function of amCharts.js that helps creating elegant tag Wordle visualizations.
The package provides two main functions `amcloud()` and `amcloud2()` that produce word cloud visualizations.


## Installation

You can install the development version of **amcloud** from github with:

``` r
remotes::install_github('younessbahi/amcloud')
```
Or,
```
devtools::install_github('younessbahi/amcloud')
```

## Example

### This is a basic example which shows you how to visualize a text:

``` r
library(amcloud)
data("sample_text", package = "amcloud")

str(sample_text)
#chr "Ortho defense fly bug killer essentialoil s safe touse kid animaln airwick liquid airfreshener useless product "| __truncated__
```

```
amcloud(
    x            = sample_text,
    excludeWords = c("ask", "sit", "box", "ona"),
    minColor     = '#b0b8c040',
    maxColor     = '#faf9f8', 
    bgColor      = '#393939', 
    maxCount     = 400
)
```
![./amcloud/blob/main/figures/amcloud-01.png](https://github.com/younessbahi/amcloud/blob/main/figures/amcloud-01.png?raw=true)


### This is a basic example Using structured data:
```
weighted <-
  data.frame(
    tag    = c('Environment', 'Breaking News', 'Politics', 'Business', 'Lifestyle', 'World', 'Sports', 'Fashion', 'Education'),
    weight = c(32, 38, 20, 81, 37, 25, 30, 20, 43)
  )

amcloud::amcloud2(
  data       = weighted,
  rotation   = - 25,
  minColor   = '#f5f6f950',
  maxColor   = '#f0f1f1',
  fontFamily = 'Roboto Condensed',
  bgColor    = '#393939'
)
```

![./amcloud/blob/main/figures/amcloud-02.png](https://github.com/younessbahi/amcloud/blob/main/figures/amcloud-02.png?raw=true)