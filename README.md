README
================

## Getting and Cleaning Data Course Project

This is a repository for the course project of the online course Getting
and Cleaning Data from Coursera. independent tidy data set with the
average of each variable for each activity and each subject.

The R code *run\_analysis.R* return a independent tidy data set with the
average of each variable for each activity and each subject from the
*Human Activity Recognition Using Smartphones Dataset Vers.1.0*
(original data set).

Each variables in this new dataset has a descriptive variable names.
(see [CodeBook.md](CodeBook.md)). You can run R code *run\_analysis.R* or source it. It
will generate a text file named “tidy\_dataset.txt”. This is the
required data set\!
### Use run_analysis.R
download the `run_analysis.R` in your work directory.  
open R (or RStudio):
`> source("./run_analysis.R")
 > run_analysis()`
 --> output:  `./data/tidy_dataset.txt`
 
### How run\_analysis.R works
The *Run\_analysis.R*, after check on the existence of *“./data”*
directory, download the data
from:

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

and stored them in temporary zip-file and the extract it into the
“./data” directory under your R working directory.

Each datasets (train and test) was reconstructed by applying descriptive
variable names and adding the subjects and activities columns. After
this, the datasets were combined into a single dataset, containing the 6
activities performed by the 30 subjects under examination.

A subset was then created extracting only measurements on the mean and
standart deviation. From that data script creates new table grouped by
subject ID and activity name and mean value for each measurement. The
script store this table in *“./data/tidy\_dataset.txt”*.

### Required R Packages
The script loads follows library: 

  * **PLYR** : The plyr package is a set of clean and consistent tools that implement the split-apply-combine
pattern in R. This is an extremely common pattern in data analysis : `install.package("plyr")`
  

  * **DPLYR** : dplyr provides a flexible grammar of data manipulation. It’s the next iteration of plyr, focused on tools for working with data frames (hence the d in the name): `install.package("plyr")`

### References
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and
Jorge L. Reyes-Ortiz. **_Human Activity Recognition on Smartphones using a
Multiclass Hardware-Friendly Support Vector Machine_**. International
Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz,
Spain. Dec 2012

### License
This dataset is distributed AS-IS and no responsibility implied or
explicit can be addressed to the authors or their institutions for its
use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita.
November 2012.



## Peer-graded Assignment: Getting and Cleaning Data Course Project

The purpose of this project is to demonstrate your ability to collect,
work with, and clean a data set. The goal is to prepare tidy data that
can be used for later analysis. You will be graded by your peers on a
series of yes/no questions related to the project. You will be required
to submit: 1) a tidy data set as described below, 2) a link to a Github
repository with your script for performing the analysis, and 3) a code
book that describes the variables, the data, and any transformations or
work that you performed to clean up the data called CodeBook.md. You
should also include a README.md in the repo with your scripts. This repo
explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is
wearable computing - see for example [this
article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/).
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the
most advanced algorithms to attract new users. The data linked to from
the course website represent data collected from the accelerometers from
the Samsung Galaxy S smartphone. A full description is available at the
site where the data was
obtained:

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

Here are the data for the
project:

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

You should create one R script called run\_analysis.R that does the
following.

1.  Merges the training and the test sets to create one data set.
2.  Extracts only the measurements on the mean and standard deviation
    for each measurement.
3.  Uses descriptive activity names to name the activities in the data
    set
4.  Appropriately labels the data set with descriptive variable names.
5.  From the data set in step 4, creates a second, independent tidy data
    set with the average of each variable for each activity and each
    subject.
