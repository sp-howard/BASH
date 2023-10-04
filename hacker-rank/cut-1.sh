#!/bin/bash

# Quotations must be placed around the line variable to ensure that the entire string is referenced, and isn't split into strings seprated by spaces as is default For loop behaviour.
while read line;
do
    echo "${line}" | cut -c 3
done
