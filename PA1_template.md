# Reproducible Research: Peer Assessment 1

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

## Loading and preprocessing the data

# I assume the input file is already in my directory

```r
initial_activity <- read.csv("./activity.csv")
```

## What is mean total number of steps taken per day?

# Calculate the total number of steps taken per day
# For this part of the assignment, you can ignore the missing values in the dataset.

```r
totalstepsperday <- initial_activity %>% group_by(date) %>% summarise(TotalSteps = sum(steps))
totalstepsperday <- subset(totalstepsperday, !is.na(TotalSteps))
```

# Make a histogram of the total number of steps taken each day

```r
ggplot(totalstepsperday, aes(x=TotalSteps)) + geom_histogram(binwidth = 400) +
        labs(title = "Total Steps taken each day", x = "Number of Steps", y = "Number of days (frequency)")
```

![](PA1_template_files/figure-html/unnamed-chunk-4-1.png) 

# Calculate and report the mean and median of the total number of steps taken per day

```r
mean_total <- mean(totalstepsperday$TotalSteps)
median_total <- median(totalstepsperday$TotalSteps)
```

# The mean is 10766 and the median is 10765.

## What is the average daily activity pattern?



## Imputing missing values



## Are there differences in activity patterns between weekdays and weekends?
