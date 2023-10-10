#!/bin/bash

# Add every line of stdin to a text file
# print (cat) the text file and pipe to 'head -1' to only show top line
# pipe again to cut to show only the top 20 characters of the top line


while read line;
do
    echo ${line} >> input.txt
done

cat input.txt | head -1 | cut -c -20