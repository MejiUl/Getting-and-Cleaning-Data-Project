#Made by MejiUlises 21/06/2014
#
#
#Check if the file exists and unzips it
if (!file.exists("CleanDataProject.zip")){
  temp <- "CleanDataProject.zip"
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",temp)
}
if(!file.exists("UCI HAR Dataset")){
  unzip("CleanDataProject.zip")
}

#Loading the libraries needed.
library(reshape2)

#Read the activity and features files 
activityList <- read.table("./UCI HAR Dataset/activity_labels.txt")
featuresList <- read.table("./UCI HAR Dataset/features.txt")

#We read all the Training tables we will be using. 
subjectTrain <- read.table("./UCI HAR Dataset/./train/subject_train.txt")             
XTrain <- read.table("./UCI HAR Dataset/./train/X_Train.txt")
YTrain <- read.table("./UCI HAR Dataset/./train/Y_Train.txt")

#We read all the Test tables we will be using. 
subjectTest <- read.table("./UCI HAR Dataset/./test/subject_test.txt")             
XTest <- read.table("./UCI HAR Dataset/./test/X_Test.txt")
YTest <- read.table("./UCI HAR Dataset/./test/Y_Test.txt")

#We define the columns we will use based on the specification. Check the cookbook for more details.
#cols <- c(1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 214:215, 227:228, 240:241, 253:254, 266:271, 345:350, 424:429, 503:504, 516:517, 529:530, 542:543)
cols <- grep("mean\\(\\)|std\\(\\)", featuresList$V2)

#Subset of the Train data set with the columns from cols and merged with the subject and Y_train data sets.
XTrain <- XTrain[cols] 
TrainMerg <- cbind(subjectTrain, XTrain, YTrain)
colnames(TrainMerg)[ncol(TrainMerg)] <- "Activity"
colnames(TrainMerg)[1] <- "Subject_ID"

#Subset of the Test data set with the columns from cols and merged with the subject and Y_test data sets.
XTest <- XTest[cols]
TestMerg <- cbind(subjectTest, XTest, YTest)
colnames(TestMerg)[ncol(TestMerg)] <- "Activity"
colnames(TestMerg)[1] <- "Subject_ID"

#Merged of the 2 data sets. 
MergedData <- rbind(TrainMerg, TestMerg) 

#Replace the number in activity with the activity label and sorts by subject_ID
MergedData <- merge(MergedData, activityList, by.x="Activity", by.y="V1")
MergedData <- MergedData[order(MergedData$Subject_ID),]
MergedData <- MergedData[,2:ncol(MergedData)]  #We delete the Activity (numbers) column

#We label the features. This names were taken form the features.txt file
colnoms <- c("Subject_ID",
             "TotalBodyAccel_Mean_X", "TotalBodyAccel_Mean_Y", "TotalBodyAccel_Mean_Z", 
             "TotalBodyAccel_StdDev_X", "TotalBodyAccel_StdDev_Y", "TotalBodyAccel_StdDev_Z",
             
             "TotalGravAccel_Mean_X", "TotalGravAccel_Mean_Y", "TotalGravAccel_Mean_Z",
             "TotalGravAccel_StdDev_X", "TotalGravAccel_StdDev_Y", "TotalGravAccel_StdDev_Z",
             
             "TotalBodyAccelJerk_Mean_X", "TotalBodyAccelJerk_Mean_Y", "TotalBodyAccelJerk_Mean_Z", 
             "TotalBodyAccelJerk_StdDev_X", "TotalBodyAccelJerk_StdDev_Y", "TotalBodyAccelJerk_StdDev_Z",
            
             "TotalBodyGyro_Mean_X", "TotalBodyGyro_Mean_Y", "TotalBodyGyro_Mean_Z", 
             "TotalBodyGyro_StdDev_X", "TotalBodyGyro_StdDev_Y", "TotalBodyGyro_StdDev_Z",
            
             "TotalBodyGyroJerk_Mean_X", "TotalBodyGyroJerk_Mean_Y", "TotalBodyGyroJerk_Mean_Z", 
             "TotalBodyGyroJerk_StdDev_X", "TotalBodyGyroJerk_StdDev_Y", "TotalBodyGyroJerk_StdDev_Z",
             
             "TotalBodyAccelMag_Mean", "TotalBodyAccelMag_StdDev",
             
             "TotalGravityAccelMag_Mean", "TotalGravityAccelMag_StdDev",
             
             "TotalGravityAccelMagJerk_Mean", "TotalGravityAccelMagJerk_StdDev",
             
             "TotalBodyGyroMag_Mean", "TotalBodyGyroMag_StdDev",
             
             "TotalBodyGyroJerkMag_Mean", "TotalBodyGyroJerkMag_StdDev",
             
             "FreqBodyAccel_Mean_X", "FreqBodyAccel_Mean_Y", "FreqBodyAccel_Mean_Z",
             "FreqBodyAccel_StdDev_X", "FreqBoddyAccel_StdDev_Y", "FreqBodyAccel_StdDev_Z",
             
             "FreqBodyAccelJerk_Mean_X", "FreqBodyAccelJerk_Mean_Y", "FreqBodyAccelJerk_Mean_Z",
             "FreqBodyAccelJerk_StdDev_X", "FreqBoddyAccelJerk_StdDev_Y", "FreqBodyAccelJerk_StdDev_Z",
             
             "FreqBodyGyro_Mean_X", "FreqBodyGyro_Mean_Y", "FreqBodyGyro_Mean_Z",
             "FreqBodyGyro_StdDev_X", "FreqBoddyGyro_StdDev_Y", "FreqBodyGyro_StdDev_Z",
             
             "FreqBodyAccelMag_Mean", "FreqBodyAccelMag_StdDev",
             
             "FreqBodyAccelMagJerk_Mean", "FreqGravityAccelJerk_StdDev",
             
             "FreqBodyGyroMag_Mean", "FreqBodyGyroMag_StdDev",
             
             "TotalBodyGyroJerkMag_Mean", "TotalBodyGyroJerkMag_StdDev",
             "Activity")

#Assign the names to the dataframe
colnames(MergedData) <- colnoms

#Melt the data set so we can summarise
molten <- melt(MergedData, id=c("Subject_ID", "Activity"))

#Summarise by Subject_ID and Activity
TidySet <- dcast(molten, Subject_ID + Activity ~ variable, mean)

#We write it in a txt file
write.table(TidySet, file="TidyDataSet.txt", sep=" ", row.names=FALSE)




