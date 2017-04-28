# ATA Membership.R
# Clean-up scraped data
# Created by Aja Manu on 28/4/17

# clear working environment
rm(list = ls())

# Set working directory
setwd("C:/Users/amanu/Documents/R/ATA")

# Load library
library(tidyverse) # for tidy data
library(stringr) # for working with text

#### Load Data------------------------------------------------------------------
business_names <- read.csv("Business Names.csv")
sub_loc <- read.csv("Subject_Location.csv")

#### Clean Data-----------------------------------------------------------------
# remove irrelevent columns
business_names <- business_names[!grepl("!Pending Accreditation", business_names$business_name),]
business_names <- business_names[!grepl("?Accredited", business_names)]
business_names <- business_names[!grepl("Premium Accreditation", business_names)]

# Change to data.frame
business_names <- as.data.frame(business_names)

# Remove blank rows
sub_loc <- sub_loc[!apply(sub_loc == "", 1, all),]

#### Combine--------------------------------------------------------------------
data <- cbind(business_names, sub_loc)

# change column names
names(data) <- c("business_name", "subjects", "location")

# Get state
data$state <- word(as.character(data$location),-1)

table(data$state)
