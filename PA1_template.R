# 
# Reproducible Research : Peer Assessment 1
# 
library(dplyr)
library(ggplot2)

# Loading and preprocessing the data

### I assume the input file is already in my directory
initial_activity <- read.csv("./activity.csv")

# What is mean total number of steps taken per day?

## Calculate the total number of steps taken per day
## For this part of the assignment, you can ignore the missing values in the dataset.
totalstepsperday <- initial_activity %>% group_by(date) %>% summarise(TotalSteps = sum(steps))
totalstepsperday <- subset(totalstepsperday, !is.na(TotalSteps))

## Make a histogram of the total number of steps taken each day
ggplot(totalstepsperday, aes(x=TotalSteps)) + geom_histogram(binwidth = 400) +
        labs(title = "Total Steps taken each day", x = "Number of Steps", y = "Number of days (frequency)")

## Calculate and report the mean and median of the total number of steps taken per day
mean_total <- mean(totalstepsperday$TotalSteps)
median_total <- median(totalstepsperday$TotalSteps)

# What is the average daily activity pattern?

## Make a time series plot (i.e. type = "l") of the 5-minute interval (x-axis) and the average number of steps taken, averaged across all days (y-axis)
averageinterval <- subset(initial_activity, !is.na(steps)) %>% group_by(interval) %>% summarise(AverageSteps = mean(steps))
ggplot(averageinterval, aes(x=interval, y=AverageSteps)) + geom_line() +
        labs(title = "Averaged number of steps taken across all days", x = "5-minute intervals", y = "Averaged Steps")

## Which 5-minute interval, on average across all the days in the dataset, contains the maximum number of steps?
max_interval_steps <- averageinterval[which.max(averageinterval$AverageSteps),1]
max_steps <- max(averageinterval$AverageSteps)

# Imputing missing values

## Calculate and report the total number of missing values in the dataset (i.e. the total number of rows with NAs)
number_of_missing <- sum(is.na(initial_activity$steps))

##Devise a strategy for filling in all of the missing values in the dataset.
### The strategy could use the mean/median for that day, or the mean for that 5-minute interval, etc.

##Create a new dataset that is equal to the original dataset but with the missing data filled in.
total_activity <- initial_activity



## Are there differences in activity patterns between weekdays and weekends?
