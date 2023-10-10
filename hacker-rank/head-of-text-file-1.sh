#!/bin/bash

# Add every line of stdin to a text file
# print (cat) the text file and pipe to 'head -20' to only show the top 20 lines


while read line;
do
    echo ${line} >> input.txt
done

cat input.txt | head -20