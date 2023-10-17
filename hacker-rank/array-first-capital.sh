#!/bin/bash

# Q: You are given a list of countries, each on a new line. Your task is to read them into an array and then transform them in the following way:
# The first capital letter (if present) in each element of the array should be replaced with a dot ('.'). Then, display the entire array with a space between each country's names.


# Initilize an array wityh an empty string
array[0]=''

# Initialize a variable to keep track of current position in the array
increment=0

# Read each line of stdin. Includes line that don't end with a newline
while read line || [[ -n "$line" ]]
do
    # Combine "." string with the line starting after the first character
    newline=.${line:1}

    # Add the modified line to the array
    array[$increment]=$newline
    
    # Increment the position
    ((increment++))
done

# Output entire array seperated by spaces
echo ${array[@]}