#!/bin/bash

# You are given a file of text,which contains temperature information about American cities, in TSV (tab-separated) format. The first column is the name of the city and the next four columns are the average temperature in the months of Jan, Feb, March and April (see the sample input). Rearrange the rows of the table in descending order of the values for the average temperature in January. 

# sort -n - number
# -r - reverse
# -k 2 - second column 
# -t $'\t' - set delimiter as tab using an escaped character

sort -n -r -k 2 -t $'\t'