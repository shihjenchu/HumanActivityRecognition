run_analysis <- function () {
        # download data
        if (! file.exists("data")) {
                dir.create("data")

                fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
                download.file(fileUrl, destfile = "./data/getdata-projectfiles-UCI HAR Dataset.zip")
                unzip("./data/getdata-projectfiles-UCI HAR Dataset.zip", exdir = "./data")
        }

        #read training data from files
        X_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt", header = FALSE)
        y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt", header = FALSE)
        subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", header = FALSE)

        #read test data from files
        X_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt", header = FALSE)
        y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt", header = FALSE)
        subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", header = FALSE)

        #merge feature-variables data
        total_feature_variables <- rbind(X_train, X_test)

        #merge activity data
        total_activity <- rbind(y_train, y_test)

        #merge subject data
        total_subject <- rbind(subject_train, subject_test)

        #merge feature-variables, activity and subject data
        total_data <- cbind(total_feature_variables, total_activity, total_subject)

        #Extracts only the measurements on the mean and standard deviation for each measurement.
        index_mean_std <- c(
                            1, #tBodyAcc-mean()-X
                            2, # tBodyAcc-mean()-Y
                            3, # tBodyAcc-mean()-Z
                            4, # tBodyAcc-std()-X
                            5, # tBodyAcc-std()-Y
                            6, # tBodyAcc-std()-Z
                            41, # tGravityAcc-mean()-X
                            42, # tGravityAcc-mean()-Y
                            43, # tGravityAcc-mean()-Z
                            44, # tGravityAcc-std()-X
                            45, # tGravityAcc-std()-Y
                            46, # tGravityAcc-std()-Z
                            81, # tBodyAccJerk-mean()-X
                            82, # tBodyAccJerk-mean()-Y
                            83, # tBodyAccJerk-mean()-Z
                            84, # tBodyAccJerk-std()-X
                            85, # tBodyAccJerk-std()-Y
                            86, # tBodyAccJerk-std()-Z
                            121, # tBodyGyro-mean()-X
                            122, # tBodyGyro-mean()-Y
                            123, # tBodyGyro-mean()-Z
                            124, # tBodyGyro-std()-X
                            125, # tBodyGyro-std()-Y
                            126, # tBodyGyro-std()-Z
                            161, # tBodyGyroJerk-mean()-X
                            162, # tBodyGyroJerk-mean()-Y
                            163, # tBodyGyroJerk-mean()-Z
                            164, # tBodyGyroJerk-std()-X
                            165, # tBodyGyroJerk-std()-Y
                            166, # tBodyGyroJerk-std()-Z
                            201, # tBodyAccMag-mean()
                            202, # tBodyAccMag-std()
                            214, # tGravityAccMag-mean()
                            215, # tGravityAccMag-std()
                            227, # tBodyAccJerkMag-mean()
                            228, # tBodyAccJerkMag-std()
                            240, # tBodyGyroMag-mean()
                            241, # tBodyGyroMag-std()
                            253, # tBodyGyroJerkMag-mean()
                            254, # tBodyGyroJerkMag-std()
                            266, # fBodyAcc-mean()-X
                            267, # fBodyAcc-mean()-Y
                            268, # fBodyAcc-mean()-Z
                            269, # fBodyAcc-std()-X
                            270, # fBodyAcc-std()-Y
                            271, # fBodyAcc-std()-Z
                            345, # fBodyAccJerk-mean()-X
                            346, # fBodyAccJerk-mean()-Y
                            347, # fBodyAccJerk-mean()-Z
                            348, # fBodyAccJerk-std()-X
                            349, # fBodyAccJerk-std()-Y
                            350, # fBodyAccJerk-std()-Z
                            424, # fBodyGyro-mean()-X
                            425, # fBodyGyro-mean()-Y
                            426, # fBodyGyro-mean()-Z
                            427, # fBodyGyro-std()-X
                            428, # fBodyGyro-std()-Y
                            429, # fBodyGyro-std()-Z
                            503, # fBodyAccMag-mean()
                            504, # fBodyAccMag-std()
                            516, # fBodyBodyAccJerkMag-mean()
                            517, # fBodyBodyAccJerkMag-std()
                            529, # fBodyBodyGyroMag-mean()
                            530, # fBodyBodyGyroMag-std()
                            542, # fBodyBodyGyroJerkMag-mean()
                            543, # fBodyBodyGyroJerkMag-std()
                            562, # activity
                            563 # subject
                           )
        total_data_mean_std <- total_data[, index_mean_std]

        #Uses descriptive activity names to name the activities in the data set
        activity_label <- read.table("./data/UCI HAR Dataset/activity_labels.txt", header = FALSE)
        activity_label <- activity_label[, 2]
        activity_label <- as.character(activity_label)
        for (i in 1 : nrow(total_data_mean_std)) {
          total_data_mean_std[i, (ncol(total_data_mean_std) - 1)] <- activity_label[as.numeric(total_data_mean_std[i, (ncol(total_data_mean_std) - 1)])]
        }

        #Appropriately labels the data set with descriptive variable names.
        features <- read.table("./data/UCI HAR Dataset/features.txt", header = FALSE)
        features <- features[, 2]
        features <- as.character(features)
        features <- c(features, "activity", "subject")
        features <- features[index_mean_std]
        names(total_data_mean_std) <- features

        #creates a second, independent tidy data set with the average of each variable for each activity and each subject
        tidy_data <- aggregate(. ~ subject + activity, total_data_mean_std, mean)
        write.table(tidy_data, file = "./data/tidy_data.txt", row.name = FALSE)
}