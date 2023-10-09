#!/bin/bash

# Print the characters from thirteenth position to the end.

# "13-" indicates formcharacter thirteen to the end of the string.

while read line;
do
    echo "${line}" | cut -c 13-
done
