#!/bin/bash

# https://www.hackerrank.com/challenges/text-processing-in-linux-the-grep-command-5/problem?isFullScreen=true

# Q: Given an input file, with N credit card numbers, each in a new line, your task is to grep out and output only those credit card numbers which have two or more consecutive occurences of the same digit (which may be separated by a space, if they are in different segments). Assume that the credit card numbers will have 4 space separated segments with 4 digits each.
# If the credit card number is 1434 5678 9101 1234, there are two consecutive instances of 1 (though) as highlighted in box brackets: 1434 5678 910[1] [1]234
# Here are some credit card numbers where consecutively repeated digits have been highlighted in box brackets. The last case does not have any repeated digits: 1234 5678 910[1] [1]234
# 2[9][9][9] 5178 9101 [2][2]34
# [9][9][9][9] 5628 920[1] [1]232
# 8482 3678 9102 1232 

grep -E '0[[:space:]]*0|1[[:space:]]*1|2[[:space:]]*2|3[[:space:]]*3|4[[:space:]]*4|5[[:space:]]*5|6[[:space:]]*6|7[[:space:]]*7|8[[:space:]]*8|9[[:space:]]*9'