#
#
#
#
activityList <- read.table("activity_labels.txt")

#We read all the Training tables we will be using. 
subjectTrain <- read.table("./train/subject_train.txt")             
XTrain <- read.table("./train/X_Train.txt")
YTrain <- read.table("./train/Y_Train.txt")

#We read all the Test tables we will be using. 
subjectTest <- read.table("./test/subject_test.txt")             
XTest <- read.table("./test/X_Test.txt")
YTest <- read.table("./test/Y_Test.txt")

#We define the columns we will use based on the specification. Check the cookbook for more details.
cols <- c(1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 214:215, 227:228, 240:241, 253:254, 266:271, 345:350, 424:429, 503:504, 516:517, 529:530, 542:543)

#Subset of the Train data set with the columns from cols and merged with the subject and Y_train data sets.
XTrain <- XTrain[cols] 
TrainMerg <- cbind(subjectTrain, XTrain, YTrain)
#colnames(TrainMerg)[ncol(TrainMerg)] <- "Type"
colnames(TrainMerg)[ncol(TrainMerg)] <- "Activity"
colnames(TrainMerg)[1] <- "Subject_ID"

#Subset of the Test data set with the columns from cols and merged with the subject and Y_test data sets.
XTest <- XTest[cols]
TestMerg <- cbind(subjectTest, XTest, YTest)
#colnames(TestMerg)[ncol(TestMerg)] <- "Type"
colnames(TestMerg)[ncol(TestMerg)] <- "Activity"
colnames(TestMerg)[1] <- "Subject_ID"

#Merged of the 2 data sets. 
MergedData <- rbind(TrainMerg, TestMerg) 

#Replace the number in activity with the activity label and sorts by subject_ID
MergedData <- merge(MergedData, activityList, by.x="Activity", by.y="V1")
MergedData <- MergedData[order(MergedData$Subject_ID),]
MergedData <- MergedData[,2:ncol(MergedData)]  #We delete the Activity (numbers) column

##colnoms <- c("Total_Body_Acc_Mean_X", "Total_Body_Acc_Mean_Y", "Total_Body_Acc_Mean_Z", 
##             "Total_Body_Acc_StdDev_X", "Total_Body_Acc_StdDev_Y", "Total_Body_Acc_StdDev_Z",
##             "Total_Grav_Acc_Mean_X", "Total_Grav_Acc_Mean_Y", "Total_Grav_Acc_Mean_Z")
##colnums <- c(1, 69)

##colnames(MergedData)[colnums] <- colnoms

#Melt the data set so we can summarise
molten <- melt(MergedData, id=c("Subject_Id", "V2.y"))

#Summarise
TidySet <- dcast(molten, Subject_ID+V2.y ~ variable, mean)





