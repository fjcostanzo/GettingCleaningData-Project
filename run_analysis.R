
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

variable.names <- c("subject", "activity", colnames(data_subset[1:79]))
variable.names <- gsub("-", ".", variable.names)
variable.names <- gsub("\\(\\)", "", variable.names)
variable.names <- tolower(variable.names)
names(tidy_data) <- variable.names

## Write the data
write.table(tidy_data, file="tidy_data.txt")