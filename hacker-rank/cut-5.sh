#!/bin/bash

# Given a tab delimited file with several columns (tsv format) print the first three fields.

# -f indicates fields. Fields are delimited by TAB by default.

while read line;
do
    echo "${line}" | cut -f 1,2,3
done
