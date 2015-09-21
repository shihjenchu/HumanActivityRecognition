## Code Book: Prepare Tidy Data - "Human Activity Recognition Using Smartphones"

### Data Source
* https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Script File
* run_analysis.R

        Carrys out entire data acquiring, cleaning works.

### Function
* run_analysis()

        Transforms input data set to a tidy data set.

### Variable
* total_feature_variables

      Merging feature variables of training and test data.

        +++++++++++++++++++++++++++++++++++++
        +        X_train.txt                +
        +++++++++++++++++++++++++++++++++++++
        +        X_test.txt                 +
        +++++++++++++++++++++++++++++++++++++

* total_activity

      Merging activities of training and test data.

        +++++++++++++++++++++
        +    y_train.txt    +
        +++++++++++++++++++++
        +    y_test.txt     +
        +++++++++++++++++++++

* total_subject

      Merging subjects of training and test data.

        ++++++++++++++++++++++++++
        +    subject_train.txt   +
        ++++++++++++++++++++++++++
        +    subject_test.txt    +
        ++++++++++++++++++++++++++

* total_data

      Merging feature variables, activities and subjects.


        ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        +        X_train.txt                +    y_train.txt    +    subject_train.txt   +
        ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        +        X_test.txt                 +    y_test.txt     +    subject_test.txt    +
        ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

* total_data_mean_std

      Labelling the data set and sorting out mean and standard deviation data only.

        ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        +        features.txt (mean/std)    +   "Activity"      +      "Subject"         +
        ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        +        X_train.txt (mean/std)     +    y_train.txt    +    subject_train.txt   +
        ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        +        X_test.txt (mean/std)      +    y_test.txt     +    subject_test.txt    +
        ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

### Data output
* tidy_data.txt