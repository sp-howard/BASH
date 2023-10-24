#!/bin/bash

# https://www.hackerrank.com/challenges/text-processing-in-linux-the-grep-command-3/problem?isFullScreen=true
# Q: You are given a text file that will be piped into your command through STDIN. Use grep to remove all those lines that contain the word 'that'. The search should NOT be sensitive to case.


# -i = case insensitive, -w = match whole word, -E = extended regular expression, -v = invert matching

grep -iwEv 'that'