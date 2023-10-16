#!/bin/bash

# Q: Given a list of countries, each on a new line, your task is to read them into an array and then display the element indexed at 3. Note that indexing starts from 0.

# Initilize an array wityh an empty string
array[0]=''

# Initialize a variable to keep track of current position in the array
increment=0

# Read each line of stdin. Includes line that don't end with a newline
while read line || [[ -n "$line" ]]
do
    # Add the line to the array
    array[$increment]=$line
    # Increment the position
    ((increment++))
done

# Print 4th element in the array
echo ${array[3]}