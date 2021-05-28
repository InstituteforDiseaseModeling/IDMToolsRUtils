# IDMToolsRUtils package

## Quick Start

### Install:
#### Install *devtools*
```
install.packages("devtools")
```
#### Install the package:
Option 1) - From github:
```
devtools::install_github("InstituteforDiseaseModeling/IDMToolsRUtils")
```
Option 2) - From a tar or zip file (make sure you spacify the location where your file is located)
```
install.packages('Path_to_downloads\\IDMToolsRUtils_0.1.0.tar.gz')
```


### Other prerequisites:
For C++ libraries:
```
install.packages('Rcpp')
library(Rcpp)
```

### Known issues:
- during 'devtools' install, *stringi* may fail, if that is the case, download the zip file and install it manually.
