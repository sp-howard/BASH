#/bin/bash

# Given a CSV file where each row contains the name of a city and its state separated by a comma, your task is to replace the newlines in the file with tabs as demonstrated in the sample. 

# -s = serial, one file at a time
# -d "  " = sets tab as the delimiter

paste -s -d"    "