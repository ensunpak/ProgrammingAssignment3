### Purpose
Description of approach for collecting and cleaning the Human Activity Recognition Using Smartphones Dataset for submission of the final assignment in the Getting and Cleaning Data Coursera course.

#### CodeBook.md
This document contains information that describes the variables, the data, and any transformations or work that was performed to clean up the dataset mentioned.<br><br>

#### run_analysis.R
This script will produce a tidied subset of the Human Activity Recognition dataset with the mean calculated for variables with mean and standard deviation by activity and subject.<br>

*Process*<br>
1.Load the dataset files into R and subsequently merge them into a single dataframe.<br>
2.Extract from the dataframe only variables with variable names mean or standard deviation.<br>
3.Replace the activity id with activity name for readability.<br>
4.Use descriptive names to replace the variable names for readability.<br>
5.Final sub set of processed dataframe created with mean calculated on variables with mean and standard deviation by activity and subject.
6. Export the independent datafame in Step 5 to a text file called "tidied_subset.txt"