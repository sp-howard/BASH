#!/bin/bash

# https://www.hackerrank.com/challenges/text-processing-in-linux-the-sed-command-2/problem?isFullScreen=true

# Q: For each line in a given input file, transform all the occurrences of the word 'thy' with 'your'. The search should be case insensitive, i.e. 'thy', 'Thy', 'tHy' etc. should be transformed to 'your'. 

# \< and \> surround the so that only that word is matched, not other words that comtain it like therefore, etc.
# g selects all occurances of the serach pattern, and I makes it case insensitive.


sed -e 's/\<thy\>/your/gI'