#!/bin/bash

# https://www.hackerrank.com/challenges/text-processing-in-linux-the-grep-command-2/problem?isFullScreen=true
# Q: You are given a text file that will be piped into your command through STDIN. Use grep to display all those lines that contain the word the in them.
# The search should NOT be sensitive to case.
# Display only those lines of the input file that contain the word 'the'. 

# -w = match whole word, -E = extended regular expression, -i = case insensitive
grep -wiE 'the'