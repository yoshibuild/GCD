

## Readme.md ##

### Brief explanation of the script flow, "run_analysis.R" ###

*Specifying file names*
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20 
is a zip archive file.  When the zipfile is extracted by an appropriate unzip software, "UCI HAR Dataset" folder appeares. The folder includes all datasets as text that you need for carrying out this analysis. The first process is to replace  long data names to  short ones. 

*List of columns' names and activities*

 - Variant name: col.name  -> 561 variant name for columns described in features.txt. 
   
 - Variant name: activity -> A list of activities which include
"WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING",  "LAYING"


*Changing text data to vector and combining two datasets, test data and train data.*
 
 - d.tain.x -> Values from training. 
 - d.test.x -> Values from testing. 
 -  dat.x -> A combinded data made from traing data and testing data.
 -  dat.sub -> A list data of substitues described by numbers.
 -  dat.y -> A list data of activities described above.

*Extracting columns which includes means and standard deviaion column.*

- Columns contained "mean" and "std" are selected by using a reguler expression method.

*Combining all datasets*

- The extracted dataset included "mean" and "std" is combinded to dat.sub and dat.y, and a final dataset called "data.fset" is produced. 

*Calculating the mean of each variable per each substitute and activity*

- Package "plyr" is used for each mean value for each substitue and each activity. Then the final data is saved as text file.
 
