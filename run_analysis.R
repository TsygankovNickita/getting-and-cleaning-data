
## okay, lets try to perform our run_analysis.R
### we need it later
library(plyr)


X_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
s_train <- read.table("train/subject_train.txt")

X_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
s_test <- read.table("test/subject_test.txt")

# merge dataset 'X'
x_full <- rbind(X_train, X_test)

# merge dataset 'y'
y_full <- rbind(y_train, y_test)

# merge dataset 'subject'
s_full <- rbind(s_train, s_test)


### Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("features.txt")

# use grep to get the coumn number of the features which contains 'std' or 'mean()'
f_mean_std <- grep("std|mean\\(\\)", features$V2)

# create a table with the features we want
x_desired <- x_full[,f_mean_std]

# set the column names
names(x_desired) <- features[f_mean_std, 2]


### Uses descriptive activity names to name the activities in the data set

a_labels <- read.table("activity_labels.txt")

y_fulll[,1] <- a_labels[y_fulll[,1], 2]

names(y_full) <- "activity"


###
### Appropriately labels the data set with descriptive variable names.
###

names(s_full) <- "subject"

# bind data into a single data table
final_data <- cbind(x_desired, y_full, s_full)

###
### From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
###


tidy <- ddply(.data = final_data, .variables = c("subject", "activity"), .fun = numcolwise(mean))

write.table(tidy, "tidy.txt", row.names = FALSE)