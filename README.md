Getting-and-Cleaning-Data-Project
========================================================

Summary
-------

This file explains what steps were taken to tidy a data as well as why I chose to do them. 

### Procedure ###

The first thing made was to download the files needed to work. This files can be found in the following direction: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The files used in this project were the following: 
* X_train.txt   
* y_train.txt
* subject_train.txt
* X_test.txt   
* y_test.txt
* subject_test.txt
* activity_labels.txt
* features.txt
 
Once I had all the files I needed I started to do the cleaning. I first started by selecting all the columns that were asked in the specification (mean and std for each measurment) with a regular expression. *Note: For test purposes I selected them manually from the features.txt file*
Then I procedeed to subset the dataframe obtained from the file *X_train.txt* with the values I got in the last step and combine it with the dataframes aquired from the *subject_training.txt* and *Y_train.txt*, resulting in a data frame like this:


Subject_ID | V1    |  V2   |  ...  |  Activity
---------- |  ---- |  ---- |  ---- |  --------
1          |  x.xx |  y.yy |  z.zz |  5
2          |  a.aa |  b.bb |  c.cc |  5
3          |  g.gg |  f.ff |  d.dd |  5


The exact same procedure was followed to merge the Test data set. 