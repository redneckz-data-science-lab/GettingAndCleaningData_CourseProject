if (!exists("HAR")) {
    # Declaring namespace
    HAR <- list()
}

(function() {

    # Constants
    
    # Temporary folder for UCI HAR data
    TEMP_FOLDER <- file.path("temp")
    # UCI HAR Dataset zip file
    TEMP_ZIP <- file.path(TEMP_FOLDER, "data.zip")
    
    # Unziped UCI HAR Dataset folder
    UCI_HAR_DATASET_FOLDER <- file.path(TEMP_FOLDER, "UCI HAR Dataset")
    # UCI HAR Dataset activity labels file
    ACTIVITY_LABELS_FILE <- file.path(UCI_HAR_DATASET_FOLDER, "activity_labels.txt")
    # UCI HAR Dataset feature names file
    FEATURES_FILE <- file.path(UCI_HAR_DATASET_FOLDER, "features.txt")
    
    # Folder with test dataset
    TEST_DATASET_FOLDER <- file.path(UCI_HAR_DATASET_FOLDER, "test")
    # Folder with training dataset
    TRAIN_DATASET_FOLDER <- file.path(UCI_HAR_DATASET_FOLDER, "train")
    
    # Public functions
    
    HAR$ReadDataset <<- function(zip.url) {
        #
        # Reads UCI HAR data from zip file
        # 
        # Args:
        #   zip.url: URL to zip archive with UCI HAR data
        #
        # Retuns:
        #   data.table with UCI HAR measurements
        #   {Subject ID: integer, Activity ID: integer, Activity Name: character,
        #    ... Mean and standart deviation features: double ...}
        #
        
        unlink(TEMP_FOLDER, recursive = T, force = T)
        dir.create(TEMP_FOLDER)
        download.file(zip.url, destfile = TEMP_ZIP, method = "curl")
        unzip(TEMP_ZIP, exdir = TEMP_FOLDER)
        
        # data.table with activity labels ordered by ID/Index
        activity.labels <- ReadActivityLabels(ACTIVITY_LABELS_FILE)
        # data.table with feature names ordered by column index
        features <- ReadFeatures(FEATURES_FILE)
        
        # Test dataset
        test.dataset <- ReadReducedDataset(TEST_DATASET_FOLDER, activity.labels, features)
        # Training dataset
        train.dataset <- ReadReducedDataset(TRAIN_DATASET_FOLDER, activity.labels, features)
        # Combined dataset
        return(rbind(test.dataset, train.dataset))
    }
    
    # Private functions
    
    ReadActivityLabels <- function(activity.labels.file) {
        #
        # Reads activity labels ordered by ID/Index
        #
        # Args:
        #   activity.labels.file: path to activity labels file
        #
        # Returns:
        #   data.table with activity labels ordered by ID/Index
        #   {Activity ID: integer, Activity Name: character}
        #
        raw.activity.labels <- fread(activity.labels.file)
        activity.labels <- raw.activity.labels %>% rename(`Activity ID`=V1, `Activity Name`=V2) %>% arrange(`Activity ID`)
        return(activity.labels)
    }
    
    ReadFeatures <- function(features.file) {
        #
        # Reads feature names ordered by column index in dataset
        #
        # Args:
        #   features.file: path to features file
        #
        # Returns:
        #   data.table with feature names ordered by column index
        #   {Feature ID: integer, Feature Name: character, Main: logical}
        #
        raw.features <- fread(features.file)
        features <- raw.features %>% rename(`Feature ID` = V1, `Feature Name` = V2) %>% arrange(`Feature ID`)
        # Add logical column named "Main" to mark features related to mean or standart deviation
        features <- mutate(features, Main = grepl("-(mean|std)\\(\\)-", features[["Feature Name"]]))
        return(features)
    }
    
    ReadReducedDataset <- function(dataset.folder, activity.labels, features) {
        #
        # Reads dataset of UCI HAR measurements from dataset.folder,
        # and reduces it to main features
        #
        # Args:
        #   dataset.folder: folder where dataset is located
        #   activity.labels: data.table with activity labels ordered by ID/Index
        #   features: data.table with feature names ordered by column index
        # 
        # Returns:
        #   data.table with UCI HAR measurements
        #   {Subject ID: integer, Activity ID: integer, Activity Name: character,
        #    ... Main Features: double ...}
        #
        
        # Compute widths for measurements file
        # to skip not main (not mean or standart deviation) features
        measurements.file.widths <- ifelse(features$Main, yes = 16, no = -16)
        # Compute column names for measurements file
        measurements.file.col.names <- features[features$Main][["Feature Name"]]
        # X file
        raw.measurements <- read.fwf(file.path(dataset.folder,
                                               paste0("X_", basename(dataset.folder), ".txt")),
                                     widths = measurements.file.widths,
                                     col.names = measurements.file.col.names,
                                     check.names = F)
        
        # Resulting data.table with UCI HAR measurements
        measurements <- cbind(ReadDatasetSubjects(dataset.folder),
                              ReadDatasetActivities(dataset.folder, activity.labels),
                              as.data.table(raw.measurements))
        return(measurements)
    }
    
    ReadDatasetSubjects <- function(dataset.folder) {
        # Subject file
        raw.subjects <- fread(file.path(dataset.folder,
                                        paste0("subject_", basename(dataset.folder), ".txt")))
        subjects <- rename(raw.subjects, `Subject ID` = V1)
        return(subjects)
    }
    
    ReadDatasetActivities <- function(dataset.folder, activity.labels) {
        # Y file
        raw.activities <- fread(file.path(dataset.folder,
                                          paste0("y_", basename(dataset.folder), ".txt")))
        activities <- activity.labels[raw.activities$V1]
        return(activities)
    }

})()
