# Step1. Merges the training and the test sets to create one data set.
  
  setwd ("/Users/apple/Desktop/Coursera/”)
  fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"        
  download.file(fileurl, destfile="/Users/apple/Desktop/Coursera/X_test.txt",  method="curl")
       
  trainData <- read.table("/Users/apple/Desktop/Coursera/X_train.txt", fill=TRUE, sep = "")
  dim(trainData) # 7352  561
  head(trainData)

  trainLabel <- read.table("/Users/apple/Desktop/Coursera/y_train.txt")
  dim(trainLabel) # 7352 1
  table(trainLabel)
       
  trainSubject <- read.table("/Users/apple/Desktop/Coursera/subject_train.txt")
  dim(trainSubject) # 7352 1
  table(trainSubject)

  testData <- read.table("/Users/apple/Desktop/Coursera/X_test.txt")
  dim(testData) # 2947  561
  head(testData)
       
  testLabel <- read.table("/Users/apple/Desktop/Coursera/y_test.txt") 
  dim(testLabel) # 2947 1
  table(testLabel)
       
  testSubject <- read.table("/Users/apple/Desktop/Coursera/subject_test.txt")
  dim(testSubject) #2947    1
  table(testSubject)
       
  mergeData <- rbind(trainData, testData)
  dim(mergeData) # 10299   561
  mergeLabel <- rbind(trainLabel, testLabel)
  dim(mergeLabel) # 10299 1
  mergeSubject <- rbind(trainSubject, testSubject)
  dim(mergeSubject) # 10299 1
  
  # Step2. Extracts only the measurements on the mean and standard deviation for 
  # each measurement.
  
  features <- read.table("/Users/apple/Desktop/Coursera/features.txt")
  dim(features)  # 561 2
	meanStd <- grep("mean\\(\\)|std\\(\\)", features[, 2])
	length(meanStd) # 66
	mergeData <- mergeData[, meanStd]
	dim(mergeData) # 10299 66

	names(mergeData) <- gsub("\\(\\)", "", features[meanStd, 2])   # remove "()"
	names(mergeData) <- gsub("mean", "Mean", names(mergeData)) # 	capitalize M
	names(mergeData) <- gsub("std", "Std", names(mergeData)) # 	capitalize S
	names(mergeData) <- gsub("-", "", names(mergeData)) # remove 	"-" in 	column names

  # Step3. Uses descriptive activity names to name the activities in the data set.

  activity <-read.table("/Users/apple/Desktop/Coursera/activity_labels.txt")
  activitycol2 <- tolower(gsub("_", "", activity[, 2]))  
  substractivityrow2col2pos8 <- toupper(substr(activity[2, 2], 8, 8))
  substractivityrow3col2pos8 <- toupper(substr(activity[3, 2], 8, 8))
  activityLabel <- activity[mergeLabel[, 1], 2]
  mergeLabel[, 1] <- activityLabel
  names(mergeLabel) <- "activity"

  # Step4. Appropriately labels the data set with descriptive activity names.

  names(mergeSubject) <- "subject"
	tidyData <- cbind(mergeSubject, mergeLabel, mergeData)
	dim(tidyData) #10299 68
	write.table(tidyData, "1tidyDataset.txt") # write out the 1st Dataset

 # Step5.From the data set in step 4, creates a second, independent tidy data set 
 # with the average of each variable for each activity and each subject.

  subjectLen <- length(table(mergeSubject)) # 30
  activityLen <- dim(activity)[1] # 6
  colLen <- dim(tidyData)[2] # 68
  result <- matrix(NA, nrow=subjectLen*activityLen, ncol=colLen)
  result <- as.data.frame(result)
  colnames(result) <- colnames(tidyData)
         
   row <- 1
         
         for(i in 1:subjectLen) {
         for(x in 1:activityLen) {
         result[row, 1] <- sort(unique(mergeSubject)[, 1])[i]
         result[row, 2] <- activity[x, 2]
         val1 <- i == tidyData$subject
         val2 <- activity[x, 2] == tidyData$activity
         result[row, 3:colLen] <- colMeans(tidyData[val1&val2, 3:colLen])
         row <- row + 1
         }
         }
  
  head(result)

  write.table(result, "2tidyDatasetmeans.txt") # write out the 2nd Dataset

  # my2data <- read.table("/Users/apple/Desktop/Coursera/2tidyDatasetmeans.txt")
  # my2data[1:10, 1:6]
       