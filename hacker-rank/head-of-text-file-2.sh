#!/bin/bash

# Add every line of stdin to a text file
# head -c 20 <filename> displays the first 20 characters of a document, no matter which lines they are on.


while read line;
do
    echo ${line} >> input.txt
done

head -c 20 input.txt