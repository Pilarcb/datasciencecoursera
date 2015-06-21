CODEBOOK: GETTING AND CLEANING DATA COURSE PROJECT

This file describes the variables, the data, and any transformations or work that I have performed to clean up the data.

This is the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

This is the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

My working directory is: “Users/apple/Desktop/Coursera/"

The run_analysis.R script performs the following steps to get a tidy data set.

A. Read ´X_train.txt´, ´y_train.txt´ and ´subject_train.txt´ from the
“Users/apple/Desktop/Coursera/" folder and store them in the following variables respectively: 

- ´trainData´   (dim:7352  561)
- ´trainLabel´   (dim:7352  1)
- ´trainSubject´  (dim:7352  1)   

B. Read ´X_test.txt´, y_test.txt´ and ´subject_test.txt´ from the “Users/apple/Desktop/Coursera/" folder and store them in the following variables respectively: 

- ´testData´    (dim:2947  561)
- ´testLabel´   (dim:2947  1)
- ´testSubject´ (dim:2947  1)

C. Combine these variables:

- ´trainData´ to ´testData´ to generate a data frame called ´mergeData´(dim: 10299 561) 
- ´trainLabel´ to ´testLabel´ to generate a data frame called ´mergeLabel´(dim:10299 1)
- ´trainSubject´ to ´testSubject´ to generate a data frame called ´mergeSubject´ (dim: 10299 1)

D. Read the ´features.txt´ file from the “Users/apple/Desktop/Coursera/" folder and store the data in a variable called ´features´ (dim: 561 2) 
- I only extract the measurements on the mean and standard deviation and store the data in a variable called ´meanStd´. This is a 66 indices list. 
- I get a subset of ´mergeData´ with this variable ´meanStd´(66 corresponding columns). Now, this subset´mergeData´ has 10299* 66 dimension.

E. Clean the column names of the subset ´mergeData´. I remove the "()" and "-" symbols in the names and  I also change the first letter of "mean" and "std" as a capital letter "M" and "S" respectively. 

F. Read the activity_labels.txt file from the “/Users/apple/Desktop/Coursera/” folder and store the data in a variable called ´activity´. 

G. Clean the activity names in the second column of ´activity´. I call this variable 
´activitycol2´. I first make all names to lower cases. If the name has an underscore between letters, I remove the underscore and capitalize the letter immediately after the underscore (position number 8). Thus, I create two variables:
  ´substractivityrow2col2pos8´: I get ´U´ in the row 2 and col 2. This is the activity                   name "walkingUpstairs"
  ´substractivityrow3col2pos8´: I get ´D´ in the row 3 and col 2. This is the activity                   name "walkingDownstairs"

H. Transform the values of ´mergeLabel´ according to the ´activity´ data frame.

I. Combine ´mergeSubject´, ´mergeLabel´ and ´mergeData´ by column to get a new tidy data frame, called ´tidyData´ (dim: 10299 68). Properly name the first two columns, ´subject´ and ´activity´. The ´subject´ column contains integers with values from 1 to 30; the ´activity´column contains 6 different activity names; the last 66 columns contain measurements with values from -1 to 1. 

J. Write the ´tidyData´ out to "1tidyDataset.txt" file (8.3 Mb) in the working directory.  

K. Create a second independent tidy data set, with the average of each measurement for each activity and each subject. There are 6 activities in total and 30 subjects in total, thus there are 180 combinations of the two. Then, for each combination, I calculate the mean of each measurement for each activity and each subject. Therefore, after initializing the ´result´ data frame I get a 180*68 data frame.

L. Write the ´result´ out to "2tidyDatasetmeans.txt" file (225 Kb) in the working directory.

M. Read "2tidyDatasetmeans.txt" file in the working directory.
