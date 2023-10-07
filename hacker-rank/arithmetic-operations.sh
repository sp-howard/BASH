#!/bin/bash

# Read the mathematical expression
read expression

# Evaluate the expression using bc and round the result to 4 decimal places
result=$(echo "scale=4; $expression" | bc)

# Print the rounded result with 3 decimal places
printf "%.3f\n" "$result"