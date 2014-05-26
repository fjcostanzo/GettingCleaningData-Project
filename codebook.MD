{\rtf1\ansi\ansicpg1252\cocoartf1038\cocoasubrtf360
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
\margl1440\margr1440\vieww9000\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\ql\qnatural\pardirnatural

\f0\fs24 \cf0 # Codebook for Smartphone Data\
\
## Information provided by the data source: \
\
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. \
\
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. \
\
For each record it is provided:\
======================================\
\
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.\
- Triaxial Angular velocity from the gyroscope. \
- A 561-feature vector with time and frequency domain variables. \
- Its activity label. \
- An identifier of the subject who carried out the experiment.\
\
The dataset includes the following files:\
=========================================\
\
- 'README.txt'\
\
- 'features_info.txt': Shows information about the variables used on the feature vector.\
\
- 'features.txt': List of all features.\
\
- 'activity_labels.txt': Links the class labels with their activity name.\
\
- 'train/X_train.txt': Training set.\
\
- 'train/y_train.txt': Training labels.\
\
- 'test/X_test.txt': Test set.\
\
- 'test/y_test.txt': Test labels.\
\
The following files are available for the train and test data. Their descriptions are equivalent. \
\
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. \
\
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. \
\
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. \
\
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. \
\
Notes: \
======\
- Features are normalized and bounded within [-1,1].\
- Each feature vector is a row on the text file.\
\
For more information about this dataset contact: activityrecognition@smartlab.ws\
\
## Information about data cleaning conducted by Frank Costanzo\
\
The data was cleaned in the following manner:\
\
* Activities data was created by margining ytrain and ytext files\
* Activity numbers were replaced with descriptive text\
* the x_test and x_train data were combined with their subject identifiers\
* the x_test and x_train data was combined, then merged with the activities data\
* the column variable names were added to the data set from the features.txt\
* the data was subset to eel only mean and standard deviation data\
* Finally, the data was aggregated to find the mean of each variable by subject and activity\
\
The end result is the tidy_data.txt\
\
}