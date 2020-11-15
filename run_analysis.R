## In this script the input is the Human Activity Recognition Using Smartphones
## and the output is the table tidymeanSummary


## Load packages
library(dplyr)
## Download and unzip raw data in directory "raw_data", if directory does not exist 
## it creates the directory.

#if (!file.exists("./raw_data")){
#    dir.create("./raw_data")
#}
#fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(fileurl,"./raw_data/HAR_dataset.zip")
#unzip("./raw_data/HAR_dataset.zip",exdir="./raw_data")
unzip("HAR_dataset.zip")


## Read raw data sets

#activityLabels<-read.table("./raw_data/UCI HAR Dataset/activity_labels.txt")
#features<-read.table("./raw_data/UCI HAR Dataset/features.txt")
#XTrain<-read.table("./raw_data/UCI HAR Dataset/train/X_train.txt")
#YTrain<-read.table("./raw_data/UCI HAR Dataset/train/Y_train.txt")
#subjectTrain<-read.table("./raw_data/UCI HAR Dataset/train/subject_train.txt")
#XTest<-read.table("./raw_data/UCI HAR Dataset/test/X_test.txt")
#YTest<-read.table("./raw_data/UCI HAR Dataset/test/y_test.txt")
#subjectTest<-read.table("./raw_data/UCI HAR Dataset/test/subject_test.txt")

activityLabels<-read.table("./UCI HAR Dataset/activity_labels.txt")
features<-read.table("./UCI HAR Dataset/features.txt")
XTrain<-read.table("./UCI HAR Dataset/train/X_train.txt")
YTrain<-read.table("./UCI HAR Dataset/train/Y_train.txt")
subjectTrain<-read.table("./UCI HAR Dataset/train/subject_train.txt")
XTest<-read.table("./UCI HAR Dataset/test/X_test.txt")
YTest<-read.table("./UCI HAR Dataset/test/y_test.txt")
subjectTest<-read.table("./UCI HAR Dataset/test/subject_test.txt")


## Merge train and test data sets

## Merge train data set
train<-cbind(XTrain,YTrain,subjectTrain)
## Merge test data set
test<-cbind(XTest,YTest,subjectTest)
## Merge train and test data set
dataSet<-rbind(train,test)


## Put correct labels to the variable
features<-features$V2
features[562:563]<-c("Y_Activity","subject")
colnames(dataSet)<-features

## Select the mean and standard deviation measures of the variables, 
## also activity and subject
dataSet<-select(dataSet,contains("mean()"),contains("std()"),Y_Activity,subject)

## Put labels to the activity values
for(i in 1:6){
    dataSet$Y_Activity<-gsub(activityLabels[i,"V1"],activityLabels[i,"V2"],dataSet$Y_Activity)
}

## Group by activity and subject and compute mean of each variable
meanSummary<-dataSet %>% group_by(Y_Activity,subject) %>%
summarize_all(mean)

## Second output
tidymeanSummary<-meanSummary

## Save the 2 outputs in the directory tidy_data as a .txt
#if (!file.exists("./tidy_data")){
#    dir.create("./tidy_data")
#}
#write.table(tidymeanSummary,"./tidy_data/tidyMeanSummary.txt",row.names = F)
write.table(tidymeanSummary,"./tidyMeanSummary.txt",row.names = F)






