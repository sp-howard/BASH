#!/bin/bash

# https://www.hackerrank.com/challenges/bash-tutorials---compute-the-average/problem?isFullScreen=true

# Q: Given N integers, compute their average, rounded to three decimal places.
# The first line contains an integer, N. 
# Each of the following N lines contains a single integer. 
# Display the average of the integers, rounded off to three decimal places. 


# Initialize count variable. This is mainly to determine which line is the first, so that it isn't added to the sum to be averaged
count=0

# Initialize sum. After all values except for the first line are summed up, it will be divided by the count-1
sum=0

# Loops through every line, ensuring that the last line is read even if the previous line didn't have a /n (newline) character
while read line || [[ -n "$line" ]];
do
    # Increse count for every line
    count=$(($count+1))
    # echo "Count is: $count"

    # Skip the first line, as it will not be added to the sum
    if [ $count -ne 1 ]
    then
        # Runing total of all lines
        sum=$(($line+$sum))
        # echo "Line is: $line"
        # echo "Sum is: $sum"
    fi
done

# Remove the first line from the total count.
count=$(($count-1))
# echo "Count is: $count"

# Get average using sum and coount values using bc and round the result to 4 decimal places
result=$(echo "scale=4; $sum/$count" | bc)

# Print the rounded result with 3 decimal places
printf "%.3f\n" "$result"