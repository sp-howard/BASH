#!/bin/bash

# https://www.hackerrank.com/challenges/text-processing-in-linux-the-sed-command-1/problem?isFullScreen=true

# Q: For each line in a given input file, transform the first occurrence of the word 'the' with 'this'. The search and transformation should be strictly case sensitive. 

# \< and \> surround the so that only that word is matched, not other words that comtain it like therefore, etc.

sed -e 's/\<the\>/this/'