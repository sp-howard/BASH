#!/bin/bash

# Given a tab delimited file with several columns (tsv format) print the first three fields.

while read line;
do
    echo "${line}" | cut -c 1-4
done
