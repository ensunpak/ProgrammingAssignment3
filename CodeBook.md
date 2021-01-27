### Each of the downloaded data files is initally loaded into R and assigned to an object. In total, 8 data files were downloaded or use in this assignment.

1. activity - activity_labels.txt<br>
Links the class labels with their activity name<br>
*Dimension: 6 rows x 2 columns*
2. features - features.txt<br>
List of all features with data collected by the accelerometer and gyroscope in 3 axis<br>
*Dimension: 561 rows x 2 columns*
3. subject_test - subject_test.txt<br>
Subjects who performned the activities are stored in this dataset under the test group<br>
*Dimension: 2,947 rows x 1 column*
4. x_test - x_test.txt<br>
Data captured from the various activities carried out by the subjects under the test group is found in this dataset<br>
*Dimension: 2,947 rows x 561 columns*
5. y_test - y_test.txt<br>
Labels for the data captured in the test group is found in this dataset<br>
*Dimension: 2,947 rows x 1 column*
6. subject_train - subject_train.txt<br>
Subjects who performned the activities are stored in this dataset under the training group<br>
*Dimension: 7,352 rows x 1 column*
7. x_train - x_test.txt<br>
Data captured from the various activities carried out by the subjects under the training group is found in this dataset<br>
*Dimension: 7,352 rows x 1 column*
8. y_train - y_train.txt<br>
Labels for the data captured in the test group is found in this dataset<br>
*Dimension: 7,352 rows x 1 column*

### The datasets were then merged to form the final dataset in R
1. x_data - merged x_train and x_test together using rbind() function<br>
*Resultant dimension: 10,299 rows x 561 columns*
2. y_data - merged y_train and y_test together using rbind() function<br>
*Resultant dimension: 10,299 rows x 1 column*
3. subject_data - merged subject_train and subject_test together using rbind() function<br>
*Resultant dimension: 10,299 rows x 1 column*
4. combined - final merge of x_data, y_data and subject_data using cbind() function<br>
*Resultant dimension: 10,299 rows x 563 columns*

### To extract only required mean and standard deviation of the measurements in the final dataset
1. combined.std.mean - selected subject, id, mean and standard deviation of the measurements from ***combined*** object<br>
*Resultant dimension: 10,299 rows x 88 columns*

### Descriptive activity names were merged into the dataframe
1. combined.std.mean - merged combined.std.mean with activity by id, dropped id from the dataframe, retaining only the descriptive name from activity object<br>
*Resultant dimension: 10,299 rows x 88 columns*

### Labels of the variables were tidied up for better readibility
1. All character "t" in variable names were replaced with "Time"
2. All character "f" in variable names were replaced with "Frequency"
3. All instances of string "Acc" in variable names were replaced with "Accelerometer"
4. All instances of string "Gyro" in variable names were replaced with "Gyrometer"
5. All instances of string "Mag" in variable names were replaced with "Magnitude"
6. All instances of string "BodyBody" in variable names were replaced with "Body"
7. All instances of string "gravity" in variable names were replaced with "Gravity"
8. All instances of string "angle" in variable names were replaced with "Angle"

### Separate independent tidy dataset was created with mean calculated for each activity and subject
1. New object combine2 created as a subset from combined.std.mean with mean computed using group by activity and subject
*Resultant dimension: 180 rows x 88 columns*