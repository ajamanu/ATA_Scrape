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

# Get data for the first page
first_url <- "https://ata.edu.au/find-a-tutor/"

guess_encoding(first_url)


site <- read_html(first_url, encoding = "ISO-8859-1")

site %>% html_nodes("#list > table")
site[[2]]
site <- readLines(first_url)

data <- html_nodes(site,xpath = '//*[@id="list"]/table/tbody') %>%
      html_table()

# Get data
base_url <- "https://ata.edu.au/find-a-tutor/?page_num="

