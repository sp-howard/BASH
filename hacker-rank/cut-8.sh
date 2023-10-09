#!/bin/bash

# Given a sentence, identify and display its fourth word. Assume that the space (' ') is the only delimiter between words

# -d " " sets the delimiter to a space, and "-f 1,2,3" selects the first three fields

while read line;
do
    echo "${line}" | cut -d " " -f 1,2,3
done