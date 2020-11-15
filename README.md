# Tidying-Human-Activity-Recognition-Using-Smartphones-data-set

The goal is to prepare tidy data which has the mean of each variable by activity and subject from the train and test sets from the 
Human activity recognition using smartphones data set. Which is data collected 
from the accelerometers from the Samsung Galaxy S smartphone. 
A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Link to the data
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Process to transform data

1. Unzip the Dataset zip file
2. Merges subject_test, X_test and y_test in one table.
3. Merges subject_train, X_train and y_train in one table.
4. Merge the new tables from points 1 and 2 in one table.
5. Use features file to put the names to the variables.
6. Use the activity_labels file to put descriptive values to the activity variable
7. Extracts only the measurements on the mean and standard deviation for each measurement. 
8. From the data set in step 7, creates a second, independent tidy data set with the average of each variable for each activity and each subject. The output is "tidyMeanSummary"
9. Save output files "tidyMeanSummary.txt"

### The data set includes
1. "README.md"
2. "CodeBook.md" : description of variables
3. "run_analysis.R" : script to convert the raw data in the tidy output
4. "tidyMeanSummary.txt" : mean of each variable by activity and subject output