#### Preamble ####
# Purpose: Prepare and clean the survey data downloaded from [...UPDATE ME!!!!!]
# Author: Rohan Alexander and Sam Caetano [CHANGE THIS TO YOUR NAME!!!!]
# Data: 22 October 2020
# Contact: rohan.alexander@utoronto.ca [PROBABLY CHANGE THIS ALSO!!!!]
# License: MIT
# Pre-requisites: 
# - Need to have downloaded the data from X and save the folder that you're 
# interested in to inputs/data 
# - Don't forget to gitignore it!


#### Workspace setup ####
library(haven)
library(tidyverse)
#setwd("C:/Users/Sammi-Jo/Desktop/PS3")
# Read in the raw data (You might need to change this if you use a different dataset)
raw_data <- read_dta("ns20200625.dta")
# Add the labels
raw_data <- labelled::to_factor(raw_data)
# Just keep some variables
reduced_data <- 
  raw_data %>% 
  select(vote_intention,
         vote_2020,
         gender,
         census_region,
         age,
         race_ethnicity,
         economy_better,
         primary_party,
         employment)


#### What else???? ####
# Maybe make some age-groups?
# Maybe check the values?
# Is vote a binary? If not, what are you going to do?

reduced_data<-
  reduced_data %>%
  filter(vote_2020 != "I would not vote")%>%
  #filter(vote_2020 != "I am not sure/don't know")%>%
  mutate(vote_trump = 
           ifelse(vote_2020=="Donald Trump", 1, 0))%>%
  mutate(vote_biden = 
           ifelse(vote_2020=="Joe Biden", 1, 0))%>%
  mutate(vote_not_sure =
           ifelse(vote_2020=="Someone else", 1,0))
 

# Saving the survey/sample data as a csv file in my
# working directory
write_csv(reduced_data, "survey_data.csv")

