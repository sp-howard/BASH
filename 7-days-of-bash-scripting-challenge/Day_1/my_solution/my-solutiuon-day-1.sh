#!/bin/bash

## Task 1: Comments
# Every part of this script will include comments that explain the purpose of each line.


## Task 3: Variables
# Create a variable, message, that equals the string "Hello World" 
message="Hello World"


## Task 2: Echo
# Print the contents of the message variable to the command line
echo $message


## Task 4: Using Variables

# Set two variables equal to integers in order to be added
num1=1
num2=2

# Print the sum of the lines to the command line. The variables are surrounded by $(( )) to designate a mathmatical operation.
echo $(($num1+$num2))


## Task 5: Using Built-in Variables

# Prints the path of the current user's home directory
echo $HOME

# Prints the path of the current working directory.
echo $PWD

# Prints the current user's username.
echo $USER

# Prints the hostname of the machine running the script.
echo $HOSTNAME


## Task 6: Wildcards

# Print all shell scripts within the current directory using the ls command an a wildcard for the filename. 
ls ./*.sh
