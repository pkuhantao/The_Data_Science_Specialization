## CodeBook

### Code book

Variables:
* ftNM: names of features/experimental measurement
* fts_test: data for all features in test set
* sbjs_test: subjects in test set
* act_test: activity ids in test set
* data_test: all merged data in test set
* fts_train: data for all features in train set
* sbjs_train: subjects in train set
* act_train: activity ids in train set
* data_train: all merged data in train set
* data_total: merge test and train set together, and extract only the mean and std for each measurement
* atNM: activity (id, name) pairs
* extCols: temporary value, which includes the column index to extract from the full data set
* mtdata: molten data from the data_total, with the (subject, activity) as the id and all other measurements as the variables
* aveData: reshaped data frame, which is the tidy data set with the average of each variable for each activity and each subject

Units: 
* For subject, it is an integer with no unit
* For activity, it is a string with no unit
* For all other measurements, they are all normalized dimensioless value within [-1,1] 

### Study design
Here are the steps of what "run_analysis.R" does:
1. Read the data from both test and train set and merge them together
2. Name all features and the activities
3. Extract only the measurements on the mean and standard deviation for each measurement
4. Creates a second, independent tidy data set with the average of each variable for each activity and each subject

