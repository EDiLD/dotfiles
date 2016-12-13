
# installed packages
inst_pkg <- installed.packages()[ , 'Package']
# CRAN --------------------------------------------------------------------
message('Installing CRAN packages...')
cran_pkg <- c('ade4', 'devtools', 'bit64', 'boot', 'Cairo', 'cairoDevice', 
              'car',
              'caret','censReg', 'clisymbols', 'cowplot',
              'cluster', 'crayon', 'coin', 'contrast', 'covr', 
              'DAAG', 'data.table', 'DEoptim', 'deSolve', 
              'drc', 'drm', 'extrafont', 'fitdistrplus', 'flexsurv', 
              'fortunes', 'gamlss', 'gamlss.add', 'gamlss.cens', 'gcbd',
              'gamlss.dist', 'gamm4', 'ggExtra', 'ggmap', 'ggfortify',
              'ggplot2', 'gridExtra', 'gridSVG',
              'GUTS', 'Hmisc', 'httr', 'indicspecies',
              'jpeg', 'knitr', 'knitcitations', 'labdsv', 'leaps', 'lme4',
              'lmerTest', 'lmtest', 'lsmeans', 'lubridate', 
              'maptools', 'markdown', 'MASS', 'MARSS', 'mclust', 'memuse', 
              'metafor',
              'mgcv', 'microbenchmark', 'multcomp', 'MuMIn',
              'mvabund', 'mvtnorm', 'NADA', 'nlme', 'nlstools', 'parallel',
              'pbapply',
              'pbkrtest', 'permute', 'plotrix', 'png', 'profr',
              'quantreg', 'randomForest', 'raster', 'rcdk', 'R2admb',
              'Rcpp', 'RCurl', 'readxl', 'relaimpo', 'reshape2',
              'rgdal', 'rgeos', 'rgl', 'rgrass7', 'rjags', 
              'rJava', 'rmarkdown', 'roxygen2', 'RPostgreSQL', 'rpostgis',
              'rpubchem', 'rstan', 'rvest', 'sandwich', 'setwidth',
              'scales', 'simecol', 'rodeo', 'sf', 'sp', 'spatial', 
              'spatstat', 'spsurvey', 'stargazer',
              'SSN', 'stringr', 'stringdist', 
              'survival', 'svglite',
              'taxize', 'testthat', 'tikzDevice', 'timeSeries',
              'tm', 'tseries', 'vegan', 'VGAM', 'vioplot', 'webchem',
              'xml2', 'xkcd', 'xslx', 'xtable', 'zoo')

cran_pkg <- cran_pkg[!(cran_pkg %in% inst_pkg)]
if (length(cran_pkg) > 0) {
       install.packages(cran_pkg, 
                 lib = '~/R/library',
                 dependencies = TRUE, 
                 repos = 'https://cloud.r-project.org/')
}

if  (!'glmmADMB' %in% inst_pkg) {
  install.packages('glmmADMB', 
    repos=c('http://glmmadmb.r-forge.r-project.org/repos',
            getOption('repos')),
    type='source',
    lib = '~/R/library')
}



# github ------------------------------------------------------------------
message('Installing github packages...')
library(devtools)
# installed packages
inst_pkg <- installed.packages()[,'Package']

git_pkg <- c('EDiLD/esmisc', 'gaborcsardi/prompt', 'gaborcsardi/parr',
  'gaborcsardi/gitty', 'gaborcsardi/prettycode')
git_pkg <- git_pkg[!(git_pkg %in% inst_pkg)]
if (length(git_pkg) > 0 & 'devtools' %in% inst_pkg) {
       lapply(git_pkg, function(y) install_github(repo = y, lib.loc =  '~/R/library'))
}


# BioConductor ------------------------------------------------------------
message('Installing BioConductor packages...')
bioc_pkg <- c('ChemmineR', 'ChemmineOB')
bioc_pkg <- bioc_pkg[!(bioc_pkg %in% inst_pkg)]

if (length(bioc_pkg) > 0) {
       source('https://bioconductor.org/biocLite.R')
       biocLite(bioc_pkg)
}


# Update existing ------------------------------------------------------------
update.packages(repos = 'https://cloud.r-project.org/',
  ask = FALSE,
  lib.loc =  '~/R/library'
  )
