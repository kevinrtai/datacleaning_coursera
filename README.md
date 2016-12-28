# datacleaning_coursera
Course project for the Getting and Cleaning Data class offered on Coursera

## Files
* run_analysis.R : a R script that produces a dataset corresponding to the specification of the assignment
* CodeBook.md : a codebook that describes the variables of the tidy dataset produced by the run_analysis.R script
* submit.txt : the dataset produced by the script in txt format

## run_analysis.R
run_analysis.R assumes that the dataset is stored in the directory UCI HAR Dataset. Ultimately, the script produces a dataframe named second_dataset that has the mean of select columns from the original dataset, grouped by both the subject who gathered the data and the activity they were performing at the time. A full description of the data can be found in CodeBook.md.

The dataset can be reproduced by running

```
source('run_analysis.R')
```

## CodeBook.md
The codebook provides a description of the dataset as well information on how the data was summarized.

## submit.txt
The file containing the original dataset submitted to Coursera for judgment.
