#!/bin/bash

# https://www.hackerrank.com/challenges/text-processing-in-linux-the-grep-command-4/problem?isFullScreen=true
# Q: An Introduction to Grep
# Grep is a multi-purpose search tool, which is used to find specified strings or regular expressions. A variety of options exist, which make it possible to use the command in several different ways and to handle many different situations. For example, one might opt for case-insensitive search, or to display only the fragment matching the specified search pattern, or to display only the line number of an input file where the specified string or regular expression has been found.
# More details about common examples of grep usage may be read here.
# Before using grep it is recommended that one should become familiar with regular expressions, to be able to harness the command to its fullest. 

# -i = case insensitive, -w = match whole word, -E = extended regular expression 
grep -iwE 'the|that|then|those'