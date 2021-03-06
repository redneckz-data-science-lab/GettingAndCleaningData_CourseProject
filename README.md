# Getting and Cleaning Data > Course Project

## Purpose

The purpose of this project is to demonstrate ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

One of the most exciting areas in all of data science right now is wearable computing - see for example this [article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/). Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.

## Original Data

A full description is available at the [site](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) where the data was obtained.

## Project Data

The data for the project is located [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Project Structure

0. README.md: this file.
1. CodeBook.md: Describes the variables, the data, and any transformations that was performed to clean up the data.
2. features_info.txt: Information about the variables/features/measurements.
3. activity_labels.txt: Lists the activity names.
4. run_analysis.R: Main script does the following:
    0. Downloads and unzips [project data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) to temp directory.
    1. Merges the training and the test sets from [project data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) to create one data set.
    2. Extracts only the measurements on the mean and standard deviation for each measurement.
    3. Uses descriptive activity names to name the activities in the data set
    4. Appropriately labels the data set with descriptive variable/feature/measurement names. 
    5. From the data set in step 4.4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    6. Writes data set from step 4.5 to uci_har_tidy_dataset.txt file.
5. uci_har_read.R: Module resposible for 4.1 to 4.4 steps.
6. load_libraries.R: Utility module used for loading required libraries.
7. uci_har_tidy_dataset.txt: Resulting data set (see 4.6)

## How to run

Just run run_analysis.R script. It takes care about all things such as:

1. Installation and loading of required packages/modules.
2. Loading and preparing UCI HAR Dataset.
3. Data transformations.
4. Writing tidy dataset to uci_har_tidy_dataset.txt.
