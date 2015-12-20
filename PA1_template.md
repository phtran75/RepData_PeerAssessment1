# Reproducible Research: Peer Assessment 1
=====================================================================================================================

```r
library(dplyr)
```

```
## 
## Attaching package: 'dplyr'
## 
## The following objects are masked from 'package:stats':
## 
##     filter, lag
## 
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

```r
library(ggplot2)
```
# Loading and preprocessing the data

I assume the input file is already in my directory

```r
initial_activity <- read.csv("./activity.csv")
```

# What is mean total number of steps taken per day?

## Calculate the total number of steps taken per day.

```r
totalstepsperday <- initial_activity %>% group_by(date) %>% summarise(TotalSteps = sum(steps))
```

## For this part of the assignment, you can ignore the missing values in the dataset.

```r
totalstepsperday <- subset(totalstepsperday, !is.na(TotalSteps))
```

## Make a histogram of the total number of steps taken each day.

```r
ggplot(totalstepsperday, aes(x=TotalSteps)) + geom_histogram(binwidth = 400) +
        labs(title = "Total Steps taken each day", x = "Number of Steps", y = "Number of days (frequency)")
```

![](PA1_template_files/figure-html/Total number of steps taken each day-1.png) 

## Calculate and report the mean and median of the total number of steps taken per day.

```r
mean_total <- mean(totalstepsperday$TotalSteps)
median_total <- median(totalstepsperday$TotalSteps)
```

The mean is 10766 and the median is 10765.

=====================================================================================================================

# What is the average daily activity pattern?

## Make a time series plot (i.e. type = "l") of the 5-minute interval (x-axis) and the average number of steps taken, averaged across all days (y-axis)

```r
averageinterval <- subset(initial_activity, !is.na(steps)) %>% group_by(interval) %>% summarise(AverageSteps = mean(steps))
ggplot(averageinterval, aes(x=interval, y=AverageSteps)) + geom_line() +
        labs(title = "Averaged number of steps taken across all days", x = "5-minute intervals", y = "Averaged Steps")
```

![](PA1_template_files/figure-html/unnamed-chunk-6-1.png) 

## Which 5-minute interval, on average across all the days in the dataset, contains the maximum number of steps?

```r
max_interval_steps <- averageinterval[which.max(averageinterval$AverageSteps),1]
max_steps <- max(averageinterval$AverageSteps)
```
The interval 835 contains the maximum number of steps: 206.1698113

=====================================================================================================================

# Imputing missing values


=====================================================================================================================

# Are there differences in activity patterns between weekdays and weekends?
