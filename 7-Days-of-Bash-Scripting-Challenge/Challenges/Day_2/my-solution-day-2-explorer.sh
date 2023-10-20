#!/bin/bash

# Print welcome message
echo "Welcome to the Interactive File and Directory Explorer!"

# While loop that runs endlessly. Ctrl-C to stop. It pauses when user is prompted to enter a line of text.
while true;
do
    echo "Files and Directories in the Current Path:"
    # Selects each file in current directory one by one
    for file in *;
    do
        # Gets ls readout for the file, which includes filesize
        file_info=$(ls $file -lh)
        # From the ls stdout, select the 9th column, which is the filename
        file_name=$(echo "${file_info}" | cut -d " " -f 9)
        # From the ls stdout, select the 5th column, which is the filesize.
        # -d sets the delimiter to a space, which is how the ls stdout is formatted
        file_size=$(echo "${file_info}" | cut -d " " -f 5)
        
        # Prints info on each file in a special format
        echo "- $file_name ($file_size)"
    done

    # Prompts for an input, then prints the length of that input
    echo "Please enter a line of text"
    read string
    echo ${#string}
done
