
# installed packages
inst_pkg <- installed.packages()[,"Package"]
# CRAN --------------------------------------------------------------------
message('Installing CRAN packages...')
cran_pkg <- c("devtools", "bit64", "boot", 'Cairo', 'cairoDevice', 'car',
              'caret','censReg', 'cluster', 'coin', 'contrast', 'covr', 
              'DAAG', 'data.table', 'DEOptim', 'deSolve', 
              'drc', 'drm', 'fitdistrplus', 'flexsurv', 
              'fortunes', 'gamlls', 'gamlss.add', 'gamlss.cens',
              'gamlss.dist', 'gamm4', 'ggExtra', 'ggmap', 
              'ggplot2', 'glmmADMB', 'gridExtra', 'gridSVG',
              'GUTS', 'Hmisc', 'httr', 'indicspecies', 'int64',
              'jpeg', 'knitr', 'labdsv', 'leaps', 'lme4',
              'lmerTest', 'lmtest', 'lsmeans', 'lubridate', 
              'maptools', 'markdown', 'MASS', 'MARSS', 'mclust',
              'mgcv', 'microbenchmark', 'multcomp', 'MuMIn',
              'mvabund', 'mvtnorm', 'NADA', 'nlme', 'nlstools', 'parallel',
              'pkbrtest', 'permute', 'plotrix', 'png', 'profr',
              'quantreg', 'randomForest', 'raster', 'rcdk', 
              'Rcpp', 'RCurl', 'readxl', 'relaimpo', 'reshape2',
              'rgdal', 'rgeos', 'rgl', 'rgrass7', 'rjags', 
              'rJava', 'rmarkdown', 'roxygen2', 'RPostgreSQL',
              'rpubchem', 'rstan', 'rvest', 'sandwich', 
              'scales', 'simecol', 'rodeo', 'sp', 'spatial', 
              'spatstat', 'SSN', 'stringr', 'stringdist', 'svglite',
              'taxize', 'testthat', 'tikzDivice', 'timeSeries',
              'tm', 'tseries', 'vegan', 'VGAM', 'vioplot', 'webchem',
              'xml2', 'xkcd', 'xtable', 'zoo')

cran_pkg <- cran_pkg[!(cran_pkg %in% inst_pkg)]
if (length(cran_pkg) > 0) {
       install.packages(cran_pkg, 
                  lib = '~/R/library',
                 dependencies = TRUE, 
                 repos = 'https://cloud.r-project.org/')
}



# github ------------------------------------------------------------------
message('Installing github packages...')
# installed packages
inst_pkg <- installed.packages()[,"Package"]

git_pkg <- c('EDiLD/esmisc')
git_pkg <- git_pkg[!(git_pkg %in% inst_pkg)]
if (length(git_pkg) > 0 & 'devtools' %in% inst_pkg) {
       lapply(git_pkg, function(y) install_github(repo = y) )
}


  

# BioConductor ------------------------------------------------------------
message('Installing BioConductor packages...')
bioc_pkg <- c('ChemmineR', 'ChemmineOB')
bioc_pkg <- bioc_pkg[!(bioc_pkg %in% inst_pkg)]

if (length(bioc_pkg) > 0) {
       source("https://bioconductor.org/biocLite.R")
       biocLite(bioc_plg)
}
# Update existing ------------------------------------------------------------
update.packages(repos = 'https://cloud.r-project.org/',
  ask = FALSE
  )