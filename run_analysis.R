library(plyr)

## Specifying the file names.
dir.test.x <- "UCI HAR Dataset/test/x_test.txt"
dir.train.x <- "UCI HAR Dataset/train/x_train.txt"
dir.test.y <- "UCI HAR Dataset/test/y_test.txt"
dir.test.sub <- "UCI HAR Dataset/test/subject_test.txt"
dir.train.y <- "UCI HAR Dataset/train/y_train.txt"
dir.train.sub <- "UCI HAR Dataset/train/subject_train.txt"
label <- "UCI HAR Dataset/features.txt"

## Reading the labels of colums nad activity.
col.name <- read.table(label)
activity <- c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING", "LAYING")


# Reading two datasets; test data and train data.
d.train.x <- read.table(dir.train.x)
d.test.x <- read.table(dir.test.x)
dat.x <- rbind(d.train.x, d.test.x)

# Labeling of each column names.
colnames(dat.x) <- col.name[,2]

# Extracting columns which includes means and stds, and sorting.
na <- c(grep("mean", col.name[,2]), grep("std", col.name[,2]))
data.x <- dat.x[,sort(na)]

# Combining two datasets, training datasets and testdatasets. 
d.train.y <- read.table(dir.train.y)
d.test.y <- read.table(dir.test.y)
d.train.sub <- read.table(dir.train.sub)
d.test.sub <- read.table(dir.test.sub)

# Repalcing the activity number to  the activity names.
dat.y <-  factor(unlist(rbind(d.train.y, d.test.y)), labels=activity)
dat.sub <- unlist(rbind(d.train.sub, d.test.sub))

# Combining all datasets, and make a final dataset including just either means or std. Final datasets name is called "data.fset" 
data.fset <- data.frame(Substitute=dat.sub, Activity=dat.y, data.x, row.names=NULL)

#Calculating means by substitues and activities.
data.mean <- ddply(data.fset, .(Substitute, Activity), colwise(mean))

# Writing "data.fset" to a memory devece with a csv style.
write.table(data.mean, file="final_mean_data.txt")

