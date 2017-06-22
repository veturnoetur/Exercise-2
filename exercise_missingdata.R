# 0: Load the data in RStudio
## Rename *.xls file as titanic_original.csv

install.packages("readxl")
install.packages("tidyr")
library(readxl)
setwd("~/Desktop/Springboard_exercises")
df <- read_excel("titanic3.xls", na = "")
View(df) # Verify if NA values have been properly retained

write.csv(file = "titanic_original.csv", x = df) # Rename file and convert to *.csv as specified in instructions
titanic_org <- read.csv("titanic_original.csv", stringsAsFactors=FALSE) # Specify to not convert strings as factors
View(titanic_org)

# 1: Port of embarkment 
## Identify missing values in the "embarked" column and replace with "S"
## Missing values may be read into R as a blank or empty string

library(dplyr)
library(tidyr)
library(magrittr)

# titanic_org %>% mutate(embarked = ifelse(is.na(embarked),"S",embarked))
# sum(is.na(titanic_org$embarked))

titanic_org$embarked[is.na(titanic_org$embarked)] <- "S"
sum(is.na(titanic_org$embarked)) # Verify if NA values were effectively replaced

# 2: Age
## Populate the missing values in the "Age" column with the mean of the existing values

titanic_org$age[is.na(titanic_org$age)] <- mean(na.omit(titanic_org$age)) # na.omit to exclude any rows containing NA values
sum(is.na(titanic_org$age)) # Verify if NA values were effectively replaced

# 3: Lifeboat
## Replace NA values in "Boat" column with either a "None" or "NA" string value

titanic_org$boat[is.na(titanic_org$boat)] <- "None" 
sum(is.na(titanic_org$boat)) # Verify if NA values were effectively replaced

# 4: Cabin
## Create a new column "has_cabin_number", where 1 = cabin number and 0 = without cabin number (i.e. NA value)

sum(is.na(titanic_org$cabin))
titanic_org["has_cabin_number"] <- ifelse(is.na(titanic_org$cabin), 0, 1)
sum(is.na(titanic_org$has_cabin_number))

View(titanic_org)

# Write results into a *.csv file

write.csv(file = "titanic_clean.csv", x = titanic_org)







