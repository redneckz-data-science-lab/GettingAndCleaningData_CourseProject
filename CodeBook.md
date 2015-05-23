# Getting and Cleaning Data > Course Project > Code Book

## Original Data

A full description is available at the [site](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) where the data was obtained.

## Project Data

The data for the project is located [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Project Data Transformations

run_analysis.R main script doing the following:
0. Downloads and unzips [project data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) to temp directory.
1. Merges the training and the test sets from [project data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable/feature/measurement names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
6. Writes resulting data set from step 5 to uci_har_tidy_dataset.txt file.

## Resulting Data Description

Resulting tidy is located in uci_har_tidy_dataset.txt.

Variables:

1. Subject ID: integer: The identifier of the subject of measurements (person identifier).
2. Activity Name: character: The activity name can be one of the following:
    1. WALKING
    2. WALKING_UPSTAIRS
    3. WALKING_DOWNSTAIRS
    4. SITTING
    5. STANDING
    6. LAYING
3. tBodyAcc-mean()-X: double: see features_info.txt for description.
4. tBodyAcc-mean()-Y: double: see features_info.txt for description.
5. tBodyAcc-mean()-Z: double: see features_info.txt for description.
6. tBodyAcc-std()-X: double: see features_info.txt for description.
7. tBodyAcc-std()-Y: double: see features_info.txt for description.
8. tBodyAcc-std()-Z: double: see features_info.txt for description.
9. tGravityAcc-mean()-X: double: see features_info.txt for description.
10. tGravityAcc-mean()-Y: double: see features_info.txt for description.
11. tGravityAcc-mean()-Z: double: see features_info.txt for description.
12. tGravityAcc-std()-X: double: see features_info.txt for description.
13. tGravityAcc-std()-Y: double: see features_info.txt for description.
14. tGravityAcc-std()-Z: double: see features_info.txt for description.
15. tBodyAccJerk-mean()-X: double: see features_info.txt for description.
16. tBodyAccJerk-mean()-Y: double: see features_info.txt for description.
17. tBodyAccJerk-mean()-Z: double: see features_info.txt for description.
18. tBodyAccJerk-std()-X: double: see features_info.txt for description.
19. tBodyAccJerk-std()-Y: double: see features_info.txt for description.
20. tBodyAccJerk-std()-Z: double: see features_info.txt for description.
21. tBodyGyro-mean()-X: double: see features_info.txt for description.
22. tBodyGyro-mean()-Y: double: see features_info.txt for description.
23. tBodyGyro-mean()-Z: double: see features_info.txt for description.
24. tBodyGyro-std()-X: double: see features_info.txt for description.
25. tBodyGyro-std()-Y: double: see features_info.txt for description.
26. tBodyGyro-std()-Z: double: see features_info.txt for description.
27. tBodyGyroJerk-mean()-X: double: see features_info.txt for description.
28. tBodyGyroJerk-mean()-Y: double: see features_info.txt for description.
29. tBodyGyroJerk-mean()-Z: double: see features_info.txt for description.
30. tBodyGyroJerk-std()-X: double: see features_info.txt for description.
31. tBodyGyroJerk-std()-Y: double: see features_info.txt for description.
32. tBodyGyroJerk-std()-Z: double: see features_info.txt for description.
33. fBodyAcc-mean()-X: double: see features_info.txt for description.
34. fBodyAcc-mean()-Y: double: see features_info.txt for description.
35. fBodyAcc-mean()-Z: double: see features_info.txt for description.
36. fBodyAcc-std()-X: double: see features_info.txt for description.
37. fBodyAcc-std()-Y: double: see features_info.txt for description.
38. fBodyAcc-std()-Z: double: see features_info.txt for description.
39. fBodyAccJerk-mean()-X: double: see features_info.txt for description.
40. fBodyAccJerk-mean()-Y: double: see features_info.txt for description.
41. fBodyAccJerk-mean()-Z: double: see features_info.txt for description.
42. fBodyAccJerk-std()-X: double: see features_info.txt for description.
43. fBodyAccJerk-std()-Y: double: see features_info.txt for description.
44. fBodyAccJerk-std()-Z: double: see features_info.txt for description.
45. fBodyGyro-mean()-X: double: see features_info.txt for description.
46. fBodyGyro-mean()-Y: double: see features_info.txt for description.
47. fBodyGyro-mean()-Z: double: see features_info.txt for description.
48. fBodyGyro-std()-X: double: see features_info.txt for description.
49. fBodyGyro-std()-Y: double: see features_info.txt for description.
50. fBodyGyro-std()-Z: double: see features_info.txt for description.
