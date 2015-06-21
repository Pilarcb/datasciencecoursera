<<<<<<< HEAD
README: Getting and Cleaning Data Course Project

This file describes how run_analysis.R script works.

First, unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and copy all the files from the UCI HAR Dataset-1 folder (downloaded by default) within of Coursera folder (this is my working directory).

The run_analysis.R script and all files from the UCI HAR Dataset-1 folder, are in the working directory.

Second, use source("run_analysis.R") command in RStudio. 

Third, there are two output files generated in the current working directory:

- 1tidydataset.txt (8.3 Mb): it contains a data frame called ´tidyData´ with 10299*68 dimension.

- 2tidydatasetmeans.txt (225 Kb): it contains a data frame called ´result´ with 180*68 dimension.

Finally, use my2data <- read.table("2tidydatasetmeans.txt") command in RStudio to read this .txt file. This second tidy data set has a 180*68 dimension.There are 6 activities in total and 30 subjects in total, thus there are 180 rows with all combinations for each of the 66 features (as the second tidy data set needs to have the average of each variable for each activity and each subject).
=======
# datasciencecoursera
>>>>>>> 77b63f47ac621e7e0f5fe0a853130af6c3f7e0b3
