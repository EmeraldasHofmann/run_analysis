#library(tidyr)
library(dplyr)
library(plyr)

run_analysis <- function(){
  
  # check on "./data/" directory
  if(!file.exists("./data")){dir.create("./data")}
  
  #download dataset in temporary file and unzip DB
  fURLzip <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  temp <- tempfile()
  download.file(fURLzip, temp, method = "curl")
  unzip(temp, exdir = "./data/")

  #load label file: features.txt -> col names - Take only 2nd colummn
  features <-  tbl_df(read.table("./data/UCI\ HAR\ Dataset/features.txt", stringsAsFactors = FALSE))[,2]
  # load the activity label
  act <- tbl_df(read.table("./data/UCI\ HAR\ Dataset/activity_labels.txt", stringsAsFactors = FALSE))
  
  ### TEST   DATASET
  # load test dataset, test activities and test subject
  test_df <- tbl_df(read.table("./data/UCI\ HAR\ Dataset/test/X_test.txt"))
  test_act <- tbl_df(read.table("./data/UCI\ HAR\ Dataset/test/y_test.txt"))
  test_subj <- tbl_df(read.table("./data/UCI\ HAR\ Dataset/test/subject_test.txt"))
  
  # add descriptive variables names to test  dataset
  names(test_df) <- t(features) 
  # link the number of activity with its label activity: join function  keeps the data order!!
  test_act <- join(test_act, act) 
  # rename col names
  names(test_act) <- c("ACT_label", "activity") 
  names(test_subj) <- "subject"
  
  # reconstruct the TEST DATASET with labels
  test_df <- cbind(test_subj, test_act, test_df) 
  
  ### TRAIN   DATASET
  # load train dataset, train activities and train subject
  train_df <- tbl_df(read.table("./data/UCI\ HAR\ Dataset/train/X_train.txt"))
  train_act <- tbl_df(read.table("./data/UCI\ HAR\ Dataset/train/y_train.txt"))
  train_subj <- tbl_df(read.table("./data/UCI\ HAR\ Dataset/train/subject_train.txt"))
  
  # add descriptive variables names to test  dataset
  names(train_df) <- t(features) 
  # link the number of activity with its label activity:
  train_act <- join(train_act, act) 
  # rename col names
  names(train_act) <- c("ACT_label", "activity")
  names(train_subj) <- "subject"
  
  # reconstruct the TRAIN DATASET with labels
  train_df <- cbind(train_subj, train_act, train_df)
  
  ### 1. Merges the training and the test sets to create one data set:
  whole_dataset <-bind_rows(test_df, train_df) 
  
  ### 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
  subset_msd <- select(whole_dataset, subject, activity, contains("mean()"), contains("std()"))
  
  ### 5. From the data set in step 4, creates a second, independent tidy data set with the 
  ### average of each variable for each activity and each subject.
  mean_dataset <-  subset_msd %>% group_by(subject, activity) %>% summarize_all(mean) 
  # Rename column: add "MEAN-" to column name.
  names(mean_dataset)[3:length(mean_dataset)] <-  paste("MEAN-", names(mean_dataset)[3:length(mean_dataset)])
  
  View(mean_dataset)
  
  write.table(mean_dataset, file = "./data/tidy_dataset.txt", sep = " ", row.names = FALSE)
  
  
  
}