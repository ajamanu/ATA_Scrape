# ATA Scrape.R
# Scrape of the ATA Website to get membership data
# Created by Aja Manu on 27/4/17

# clear working environment
rm(list = ls())

# Set working directory
setwd("C:/Users/amanu/Documents/R/ATA")

# Load library
library(tidyverse) # for working with tidy data
library(rvest) # for scraping webpages

# Get data
base_url <- ""
