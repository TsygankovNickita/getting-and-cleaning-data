# Introduction

The script run_analysis.R realize 5 steps described in the course project.

All data has been merged by using the rbind() func. We addressed files having the same number of columns and referring to the same entities.

Then, only those columns with the mean and standard deviation measures are taken from the whole dataset. After extraction of these columns, they were given the correct names, taken from features.txt.

Activity data was addressed with values 1:6, we take the activity names and IDs from activity_labels.txt and they are substituted in the dataset.

On the whole dataset, those columns with vague column names were corrected.

Finally, we generate a new dataset with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows). The output file is called tidy.txt, and uploaded to this repository.

# Variables in use

X_train, y_train, X_test, y_test, s_train and s_test contain the data from the downloaded files.

x_full, y_full and s_full merge the previous datasets to further analysis.

Features contains the correct names for the x_full dataset, which were applied to the column names stored in f_mean_std, a numeric vector used to extract the desired data.

The same approach was performed with activity names through the act_labels variable.

x_desired contains a table with the features selected

final_data merges x_full, y_full and subject_full in a big dataset.

Finally, tidy contains the relevant averages which will be later stored in a .txt file. ddply() from the plyr package is used to apply numcolwise() and easy further work.
