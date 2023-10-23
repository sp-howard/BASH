#/bin/bash

# In this challenge, we practice using the paste command to merge lines of a given file.
# You are given a CSV file where each row contains the name of a city and its state separated by a comma. Your task is to restructure the file so that three consecutive rows are folded into one line and are separated by semicolons. 

# -d ";" = sets ; as the delimiter
# - - - = 3 items on each line

paste -d";" - - -