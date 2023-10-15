#!/bin/bash

# Q: Given a list of countries, each on a new line, your task is to read them into an array and then display the entire array, with a space between each of the countries' names. 

#

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

# Output five elements of the array, starting at the 3rd position
echo ${array[@]:3:5}