
## Create data frames filled with the data
xtest <- read.table("UCI Har Dataset/test/X_test.txt")
xtrain <- read.table("UCI Har Dataset/train/X_train.txt")
ytest <- read.table("UCI Har Dataset/test/Y_test.txt")
ytrain <- read.table("UCI Har Dataset/train/Y_train.txt")
subjectTest <- read.table("UCI Har Dataset/test/subject_test.txt")
subjectTrain <- read.table("UCI Har Dataset/train/subject_train.txt")

## combine activities (ytrain and ytest)
activities <- rbind(ytrain, ytest)

## replace entries with descriptive names

for (i in 1:nrow(activities)){
  if (activities[i,1]==1){activities[i,1] <- c("Walking")} 
  else if (activities[i,1]==2){activities[i,1] <- c("Walking_Upstairs")}
  else if (activities[i,1]==3){activities[i,1] <- c("Walking_Downstairs")}
  else if (activities[i,1]==4){activities[i,1] <- c("Sitting")}
  else if (activities[i,1]==5){activities[i,1] <- c("Standing")} 
  else{activities[i,1] <- c("Laying")}
}

## Merge the rest of the datasets.
xy_test <- cbind(xtest, subjectTest)
xy_train <- cbind(xtrain, subjectTrain)
combined <- rbind(xy_train, xy_test)
data <- cbind(combined, activities)


## features importing (to name the variables)
features <- read.table("UCI Har Dataset/features.txt")
features <- features[,2]
features_vector <- as.vector(features)
## Add Subjects and Activities labels to features
features_vector <- append(features_vector, c("subject", "activity"))

## apply the names to the dataframe
names(data) <- features_vector

## Subsetting Data to keep only those columns that refer to means and standard deviation
## Capture what columns to keep
mean_names <- grep("mean()", colnames(data))
std_names <- grep("std()", colnames(data))
keep_cols <- c(mean_names, std_names, 562, 563)

## Subset the data
data_subset <- data[keep_cols]

## Aggregate the data
agg_subset <- aggregate(data_subset, list(data_subset$subject, data_subset$activity), FUN=mean)
tidy_data <- agg_subset[1:81]

neat_names <- c("tbodyacc_mean_x", "tbodyacc_mean_y", "tbodyacc_mean_z", "tgravityacc_mean_x",
                "tgravityacc_mean_y", "tgravityacc_mean_z", "tbodyaccjerk_mean_x", "tbodyaccjerk_mean_y",
                "tbodyaccjerk_mean_z", "tbodygyro_mean_x", "tbodygyro_mean_y", "tbodygyro_mean_z",
                "tbodygyrojerk_mean_x", "tbodygyrojerk_mean_y", "tbodygyrojerk_mean_z", "tbodyaccmag_mean",
                "tgravityaccmag_mean", "tbodyaccjerkmag_mean", "tbodygyromag_mean", "tbodygyrojerkmag_mean",
                "fbodyacc_mean_x", "fbodyacc_mean_y", "fbodyacc_mean_z", "fbodyacc_meanfreq_x",
                "fbodyacc_meanfreq_y", "fbodyacc_meanfreq_z", "fbodyaccjerk_mean_x", "fbodyaccjerk_mean_y",
                "fbodyaccjerk_mean_z", "fbodyaccjerk_meanfreq_x", "fbodyaccjerk_meanfreq_y", "fbodyaccjerk_meafreq_z",
                "fbodygyro_mean_x", "fbodygyro_mean_y", "fbodygryo_mean_z", "fbodygyro_meanfreq_x",
                "fbodygryo_meanfreq_y", "fbodygryo_meanfreq_z", "fbodyaccmag_mean", "fbodyaccmag_meanfreq",
                "fbodyaccjerkmag_mean", "fbodyaccjerkmag_meanfreq", "fbodygyromag_mean", "fbodygryomag_meanfreq",
                "fbodygyroherkmag_mean", "fbodygyrojerkmag_meanfreq", "tbodyacc_std_x", "tbodyacc_std_y",
                "tbodyacc_std_z", "tgravityacc_std_x", "tgravityacc_std_y", "tgravityacc_std_z",
                "tbodyaccjerk_std_x", "tbodyaccjerk_std_y", "tbodyaccjerk_std_z", "tbodygyro_std_x",
                "tbodygyro_std_y", "tbodygyro_std_z", "tbodygyrojerk_std_x", "tbodygyrojerk_std_y",
                "tbodygyrojerk_std_z", "tbodyaccmag_std", "tgravityaccmag_std", "tbodyaccjermag_stud",
                "tbodygyromag_std", "tbodygyrojerkmag_std", "fbodyacc_std_x", "fbodyacc_std_y", 
                "fbodyacc_std_z", "fbodyaccjerk_std_x", "fbodyaccjerk_std_y", "fbodyaccjerk_std_z",
                "fbodygyro_std_x", "fbodygyro_std_y", "fbodygyro_std_z", "fbodyaccmag_std",
                "fbodyacjerkmag_std", "fbodygyromag_std", "fbodygyrojerkmag_std")
                

names(tidy_data) <- c("subject", "activity", neat_names)

## Write the data
write.table(tidy_data, file="tidy_data.txt")