
# installed packages
inst_pkg <- installed.packages()[ , 'Package']
# CRAN --------------------------------------------------------------------
message('Installing CRAN packages...')
cran_pkg <- c('ade4', 'agricolae',
              'devtools', 'bit64', 'boot', 'Cairo', 'cairoDevice', 
              'car', 'coefplot', 'broom', 
              'caret','censReg', 'clisymbols', 'cowplot',
              'cluster', 'crayon', 'coin', 'contrast', 'covr', 'DHARMa',
              'DAAG', 'data.table', 'DEoptim', 'deSolve', 'desplot', 'devEMF',
              'drc', 'drm', 'extrafont', 'fitdistrplus', 'flexsurv', 
              'fortunes', 'gamlss', 'gamlss.add', 'gamlss.cens', 'gcbd',
              'ggalt', 
              'gamlss.dist', 'gamm4', 'ggExtra', 'ggmap', 'ggfortify',
              'ggplot2', 'gridExtra', 'gridSVG',
              'GUTS', 'Hmisc', 'httr', 'indicspecies', 'leaflet', 
              'jpeg', 'knitr', 'knitcitations', 'labdsv', 'leaps', 'lme4',
              'lmerTest', 'lmtest', 'lsmeans', 'lubridate', 
              'maptools', 'markdown', 'MASS', 'MARSS', 'mclust', 'memuse', 
              'metafor', 'merTools',
              'mgcv', 'microbenchmark', 'multcomp', 'MuMIn',
              'mvabund', 'mvtnorm', 'NADA', 'nlme', 'nlstools', 'nCDunnett',
              'odbc', 'openxlsx', 'parallel',
              'pbapply',
              'pbkrtest', 'permute', 'plotly', 'plotrix', 'png', 'profr',
              'quantreg', 'randomForest', 'raster', 'rcdk', 'R2admb',
              'Rcpp', 'RCurl', 'readxl', 'relaimpo', 'reshape2',
              'rgdal', 'rgeos', 'rgl', 'rgrass7', 'rjags', 
              'rJava', 'rmarkdown', 'roxygen2', 'RPostgreSQL', 'rpostgis',
              'rpubchem', 'rstan', 'rstanarm', 'rvest', 'sandwich', 'setwidth',
              'shinydashboard',
              'scales', 'simecol', 'rodeo', 'sf', 'sp', 'spatial', 
              'spatstat', 'spsurvey', 'stargazer',
              'SSN', 'stringr', 'stringdist', 
              'survival', 'svglite', 'tidyr', 
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
  'gaborcsardi/gitty', 'gaborcsardi/prettycode', 'rstats-db/odbc')
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

# ROracle ---------------------------------------------------------------------
install.packages('ROracle', 
                 configure.args ='--with-oci-lib=/usr/lib/oracle/12.2/client64/lib --with-oci-inc=/usr/include/oracle/12.2/client64')

# Update existing ------------------------------------------------------------
message('Updating packages...')
update.packages(repos = 'https://cloud.r-project.org/',
  ask = FALSE,
  lib.loc =  '~/R/library'
  )


# Install xkcd fonts ----------------------------------------------------------
message('Installing XKCD fonts')

library('extrafont')
download.file("http://simonsoftware.se/other/xkcd.ttf",
  dest = "xkcd.ttf", mode = "wb")
system("mkdir -p ~/.fonts")
system("cp xkcd.ttf ~/.fonts")
font_import(pattern = "[X/x]kcd", prompt = FALSE)
file.remove("xkcd.ttf")
