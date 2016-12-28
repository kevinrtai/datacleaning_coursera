# Assumes that the dataset is stored in the directory 'UCI HAR Dataset'

# First read in the test and train datasets
test_data <- read.table('UCI HAR Dataset/test/X_test.txt')
test_labels <- read.table('UCI HAR Dataset/test/y_test.txt')
test_subj <- read.table('UCI HAR Dataset/test/subject_test.txt')
train_data <- read.table('UCI HAR Dataset/train/X_train.txt')
train_labels <- read.table('UCI HAR Dataset/train/y_train.txt')
train_subj <- read.table('UCI HAR Dataset/train/subject_train.txt')

# Match each observation with the corresponding labels
test <- cbind(test_subj, test_labels, test_data)
train <- cbind(train_subj, train_labels, train_data)

# Merge the test and train datasets
merged <- rbind(test, train)

# Label the columns using the names in 'features.txt'
col_names <- read.table('UCI HAR Dataset/features.txt')[[2]]
names(merged) <- c('subject', 'activity', as.character(col_names))

# Select only the columns with mean or standard deviation data
meanstd_colnames <- grep('mean|Mean|std', names(merged), value=TRUE)
meanstd_only <- merged[, c('subject', 'activity', meanstd_colnames)]

# Turn the 'activity' column into a factor variable with the proper names
activity_names <- as.character(read.table('UCI HAR Dataset/activity_labels.txt')[[2]])
meanstd_only$activity <- as.factor(meanstd_only$activity)
levels(meanstd_only$activity) <- activity_names

# Turn the 'subject' column into a factor variable
meanstd_only$subject <- as.factor(meanstd_only$subject)

# Create a second dataset with the average of each variable per subject/activity
library(dplyr)
grp_cols <- names(meanstd_only)[c(1, 2)]
dots <- lapply(grp_cols, as.symbol)
second_dataset <- meanstd_only %>% group_by_(.dots=dots) %>% summarize_each(funs(mean))