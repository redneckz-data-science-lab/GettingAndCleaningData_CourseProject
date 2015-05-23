# Remove all variables
rm(list = ls())

# Load submodules
source("load_libraries.R")
source("uci_har_read.R")

# Install/update and load required libraries
LoadLibraries("data.table", "dplyr", "reshape2")

(function() {
    
    # 1. Merges the training and the test sets to create one data set.
    # 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
    # 3. Uses descriptive activity names to name the activities in the data set
    # 4. Appropriately labels the data set with descriptive variable names. 
    dataset <- HAR$ReadDataset("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")
    # 5. From the data set in step 4, creates a second,
    # independent tidy data set with the average of each variable for each activity
    # and each subject.
    melted.dataset <- melt(dataset, id.vars = c("Subject ID", "Activity ID", "Activity Name"))
    tidy.dataset <- dcast(melted.dataset, `Subject ID` + `Activity Name` ~ variable,
                          fun = function(...) mean(..., na.rm = T))
    
    write.table(tidy.dataset, file = "uci_har_tidy_dataset.txt", row.names = F)

})()
