#
#
#
#We read all the Training tables we will be using. 
subjectTrain <- read.table("./train/subject_train.txt")             
XTrain <- read.table("./train/X_Train.txt")
YTrain <- read.table("./train/Y_Train.txt")

#We read all the Test tables we will be using. 
subjectTest <- read.table("./test/subject_test.txt")             
XTest <- read.table("./test/X_Test.txt")
YTest <- read.table("./test/Y_Test.txt")

cols <- c(1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 214:215, 227:228, 240:241, 253:254, 266:271, 345:350, 424:429, 503:504, 516:517, 529:530, 542:543)

XTrain <- XTrain[cols] 
TrainMerg <- cbind(subjectTrain, XTrain, YTrain)

XTest <- XTest[cols]
TestMerg <- cbind(subjectTest, YTest, YTest)





