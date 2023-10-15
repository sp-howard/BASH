#!/bin/bash

# Q: We now transition to some basic examples of bash scripting for the purpose of text processing and data munging. In this challenge, we practice reading and filtering an array. 

# Initilize an array wityh an empty string
array[0]=''

# Initialize a variable to keep track of current position in the array
increment=0

# Read each line of stdin
while read line
do

    # Add the line to the array
    array[$increment]=$line
    # Increment the position
    ((increment++))
done

# Filter out any element that has an 'a' in it
declare -a filtered_array=( ${array[@]/*a*/} )
echo ${filtered_array[@]}