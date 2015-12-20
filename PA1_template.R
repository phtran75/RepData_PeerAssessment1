# 
# Reproducible Research : Peer Assessment 1
# 
library(dplyr)
library(ggplot2)

## Loading and preprocessing the data

# I assume the input file is already in my directory
initial_activity <- read.csv("./activity.csv")

## What is mean total number of steps taken per day?

# Calculate the total number of steps taken per day
# For this part of the assignment, you can ignore the missing values in the dataset.
totalstepsperday <- initial_activity %>% group_by(date) %>% summarise(TotalSteps = sum(steps))
totalstepsperday <- subset(totalstepsperday, !is.na(TotalSteps))

# Make a histogram of the total number of steps taken each day
ggplot(totalstepsperday, aes(x=TotalSteps)) + geom_histogram(binwidth = 400) +
        labs(title = "Total Steps taken each day", x = "Number of Steps", y = "Number of days (frequency)")

# Calculate and report the mean and median of the total number of steps taken per day
mean_total <- mean(totalstepsperday$TotalSteps)
median_total <- median(totalstepsperday$TotalSteps)

## What is the average daily activity pattern?



## Imputing missing values



## Are there differences in activity patterns between weekdays and weekends?
