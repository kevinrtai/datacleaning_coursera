# CodeBook

This is the codebook describing the dataset contained in submit.txt

## Description
This dataset represents a summarization of the original data from the UCI HAR Dataset. Specifically, the dataset contains the mean of each of the original variables containing the keyword "mean" or "std," grouped by both subject and activity. Each row corresponds to a particular subject and activity, and the columns represent the mean of some variable across all observations with that subject and activity.

## Variables
* subject - integer ids representing each of the participants in the studty
* activity - factor variable representing each activity
* The rest of the columns - the mean of this variable in the original dataset 
