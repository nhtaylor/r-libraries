########################################
## Reproducible code for reinstalling new libraries
## Make transferring R to new computers
## Or cleaning out and having a fresh install easiser
########################################

## setting the directory
# install.packages("rstudioapi")
# stopifnot(require(rstudioapi))
library(rstudioapi)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

## saving all packages currently installed
installed <- as.data.frame(installed.packages())
write.csv(installed, 'installed_previously.csv')

## installing new packages
library(readr)
install <- read_csv("installed_previously.csv")
# View(install)
# View(install[, 1]) # all package names
load.lib <- install[, 1]

install.lib <- load.lib[!load.lib %in% installed.packages()]
for(lib in install.lib) 
  install.packages(lib, dependencies = TRUE)
sapply(load.lib, require, character = TRUE)
