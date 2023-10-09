#!/bin/bash

# Given a tab delimited file with several columns (tsv format) print the fields from second fields to last field.

# "-f 2-" selects the secodn field to last

while read line;
do
    echo "${line}" | cut -f 2-
done