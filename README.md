## Read Me: Prepare Tidy Data - "Human Activity Recognition Using Smartphones"

### Description

The script, run_analysis.R, collects the data set of "Human Activity Recognition Using Smartphone", works with it and then cleans it up.

### Manipulation

* Step0: Download the data set (if it doesn't exist) and unzip to local

        Using download.files() and unzip()

* Step1: Merges the training and the test sets to create one data set.

        Merge feature-variables data (X_train.txt/X_test.txt), activities (y_train.txt/y_test.txt) and subjects (subject_train.txt/subject_test.txt) data. Saving the resulting data set to a variable called "total_data".

        ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        +        X_train.txt                +    y_train.txt    +    subject_train.txt   +
        ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        +        X_test.txt                 +    y_test.txt     +    subject_test.txt    +
        ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

* Step2: Extracts only the measurements on the mean and standard deviation for each measurement.

        Subsetting "total_data" with mean and standard deviation values only. Then saving the result to a variable called "total_data_mean_std".

        ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        +        X_train.txt (mean/std)     +    y_train.txt    +    subject_train.txt   +
        ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        +        X_test.txt (mean/std)      +    y_test.txt     +    subject_test.txt    +
        ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

* Step3: Uses descriptive activity names to name the activities in the data set

        Name the activities according to activity_labels.txt.
        1 WALKING
        2 WALKING_UPSTAIRS
        3 WALKING_DOWNSTAIRS
        4 SITTING
        5 STANDING
        6 LAYING

* Step4: Appropriately labels the data set with descriptive variable names.

        ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        +        features.txt (mean/std)    +   "Activity"      +      "Subject"         +
        ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        +        X_train.txt (mean/std)     +    y_train.txt    +    subject_train.txt   +
        ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        +        X_test.txt (mean/std)      +    y_test.txt     +    subject_test.txt    +
        ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

* Step5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

        Using aggregate() and write.table()
        Output final result to a file named tidy_data.txt

### Execution
* Source the script file, run_analysis.R, then run the function, run_analysis(). (No argument is required)

        source('run_analysis.R')
        run_analysis()

### Code Book
* CodeBook.md

        Explain the variables, data and transformations performed.

### Read Me
* This file. (README.md)