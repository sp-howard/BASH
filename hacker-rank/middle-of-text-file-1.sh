#!/bin/bash

# Display the lines (from line number 12 to 22, both inclusive) of a given text file.

# Add every line of stdin to a text file
# head -n 22 <filename> displays the first 22 lines of the document
# tail -n 11 selects the last 11 lines from that, leaving you with the 10 middle lines of the file.


while read line;
do
    echo ${line} >> input.txt
done

head -n 22 input.txt | tail -n 11