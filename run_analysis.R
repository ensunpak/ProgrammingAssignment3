# Load package for the script
library(dplyr)

# Begin to download the data files
# Check for filename in directory
if(!file.exists("wk4_assignment.csv")){
      fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
      download.file(fileURL, "wk4_assignment.zip", method = "curl") # Download the file
      unzip("wk4_assignment.zip") # Unzip the file
}

# Assign the txt files to objects in R for processing
activity <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("id", "activity"))
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("id", "features")) # for column name assignment

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$features)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "id")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$features)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "id")

# QN1 - Merge the datasets into one for next steps
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)
combined <- cbind(x_data, y_data, subject_data)

# QN2 - Keep only the variables with standard deviation and mean
combined.std.mean <- select(combined, id, subject, contains("std"), contains("mean"))

# QN3 - Use descriptive names for the activities in the dataset
combined.std.mean <- merge(combined.std.mean, activity, by = "id")
combined.std.mean <- select(combined.std.mean, -id)

# QN 4 - Give variables proper names
combined.std.mean <- combined.std.mean[, c(1, 88, 2:87)]
names(combined.std.mean) <- gsub("^t", "Time", names(combined.std.mean))
names(combined.std.mean) <- gsub("^f", "Frequency", names(combined.std.mean))
names(combined.std.mean) <- gsub("Acc", "Accelerometer", names(combined.std.mean))
names(combined.std.mean) <- gsub("Gyro", "Gyroscope", names(combined.std.mean))
names(combined.std.mean) <- gsub('Mag', "Magnitude", names(combined.std.mean))
names(combined.std.mean) <- gsub("BodyBody", "Body", names(combined.std.mean))
names(combined.std.mean) <- gsub("gravity", "Gravity", names(combined.std.mean))
names(combined.std.mean) <- gsub("angle", "Angle", names(combined.std.mean))

# QN 5 - Create an independent dataframe of tidied data with average for each variable
combined2 <- combined.std.mean %>%
      group_by(subject, activity) %>%
      summarise_all(funs(mean))
write.table(combined2, "tidied_subset.txt", row.name=FALSE)