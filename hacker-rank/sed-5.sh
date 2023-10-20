#!/bin/bash

# https://www.hackerrank.com/challenges/text-processing-in-linux-the-sed-command-3/problem?isFullScreen=true

# Q: Given an input file, in each line, highlight all the occurrences of 'thy' by wrapping them up in brace brackets. The search should be case-insensitive.

sed -e 's/[Tt]hy/{&}/g'