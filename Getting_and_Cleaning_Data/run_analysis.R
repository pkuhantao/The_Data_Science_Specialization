## get the name for features
ftNM <- read.table("./UCI HAR Dataset/features.txt")

## read data from the test set
fts_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
colnames(fts_test) <- ftNM[,2] ## name the features
sbjs_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
colnames(sbjs_test) <- "subject"
act_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
colnames(act_test) <- "activity"
data_test <- cbind(sbjs_test, act_test, fts_test)

## read data from the training set
fts_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
colnames(fts_train) <- ftNM[,2]
sbjs_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
colnames(sbjs_train) <- "subject"
act_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
colnames(act_train) <- "activity"
data_train <- cbind(sbjs_train, act_train, fts_train)

## merge test and train together
data_total <- rbind(data_test, data_train)

## use descriptive activity names to name the activities in the data set
atNM <- read.table("./UCI HAR Dataset/activity_labels.txt")
data_total$activity <- atNM[data_total$activity, 2]

## Extracts only the measurements on the mean and standard ...
## deviation for each measurement
extCols <- grep("subject|activity|mean\\(\\)|std\\(\\)", colnames(data_total))
data_total <- data_total[,extCols]

## create the tidy data set with the average of each variable for each activity
## and each subject. 
library(reshape2)
mtdata <- melt(data_total, id=c("subject", "activity"), measure.vars=colnames(data_total)[3:ncol(data_total)])
aveData <- dcast(mtdata, subject+activity ~ variable, mean)

## save the tidy data into file
write.table(aveData, file = "tidy_data.txt", sep = ",", row.names=F, col.names=T)



