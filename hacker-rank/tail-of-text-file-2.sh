#!/bin/bash

# In this challenge, we practice using the tail command to display the last 20 lines of a text file.

# Add every line of stdin to a text file
# tail -n 20 selects the last 20 characters of the file.


while read line;
do
    echo ${line} >> input.txt
done

tail -c 20 input.txt