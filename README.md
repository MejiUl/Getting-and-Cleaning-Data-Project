Getting-and-Cleaning-Data-Project
========================================================

Summary
-------

This file explains what steps were taken to tidy a data as well as why I chose to do them. 

### Procedure ###

The first thing made was to download the files needed to work. This files can be found in [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The files used in this project were the following: 
* X_train.txt   
* y_train.txt
* subject_train.txt
* X_test.txt   
* y_test.txt
* subject_test.txt
* activity_labels.txt
* features.txt
 
### Getting and Subsetting the Data ###

Once I had all the files I needed I started to do the cleaning. I first started by selecting all the columns that were asked in the specification (mean and std for each measurment) with a regular expression. This was achieved by this code: 
```{r}
cols <- grep("mean\\(\\)|std\\(\\)", featuresList$V2)
```
where featuresList$V2 is the vector of names of the features.
*Note: For test purposes I selected them manually from the features.txt file*

Then I procedeed to subset the dataframe obtained from the file *X_train.txt* with the values I got in the last step and combine it with the dataframes aquired from the *subject_training.txt* and *Y_train.txt*, we then rename the columns added to avoid future problems as the names repeat itself giving two column names with V1 values, the resulting data frame is shown below:


Subject_ID | V1    |  V2   |  ...  |  Activity
---------- |  ---- |  ---- |  ---- |  --------
1          |  x.xx |  y.yy |  z.zz |  5
2          |  a.aa |  b.bb |  c.cc |  5
3          |  g.gg |  f.ff |  d.dd |  5


The exact same procedure was followed to merge the Test data set. 

### Merging the data ###

Once we got the Training and the Test data frames, we procedeed to merge them. For this I used the *rbind* command. The code that was used was the following: 

```{r}
MergedData <- rbind(TrainMerg, TestMerg) 
```

Once we binded these dataframes, we then rename the numers in the activity column with the values in the *activity_labels.txt*. This was done using the *merge* command, performing a left join on the activity list names. The code in R used is: 

```{r}
MergedData <- merge(MergedData, activityList, by.x="Activity", by.y="V1")
```

As the merging process adds one column (the activity number) in the MergedData dataset, whe have to subset so we can summarise without having troubles. We also sort it by Subject_ID.

### Labeling the data ###

To properly label the variables in the data frame we created a character vector with descriptive names for each of the features in the dataframe. We then set it to the names in the dataframe. 

### Melt and Summarizing the data ###

For this one last step, we melt the data as teached in the Week 3 video "Reshaping Data" with the melt command. We melt it by "Subject_ID" and "Activity". Once we molten the data, we casted it to a dataframe with the *dcast* command summarizing with the mean. These steps were done as followed: 

```{r}
molten <- melt(MergedData, id=c("Subject_ID", "Activity"))
TidySet <- dcast(molten, Subject_ID + Activity ~ variable, mean)
```

### How to Run the Srcipt ###

To run the *run_analysis.R* script, you must have installed the *reshape2* package. Once you downloaded the script, you must load it into RStudio by using the source command and calling the function that does everything explained on this text. This is done by running the following code: 

```{r}
source("run_analysis.R")
run()  #This is the name of the function
```