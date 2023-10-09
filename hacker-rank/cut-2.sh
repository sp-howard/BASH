#!/bin/bash

# Problem: The output should contain lines. Each line should contain just two characters at the 2nd and 7th position of the corresponding input line. 

# Issues: I was initially trying
#
# second=$("${line}" | cut -c 2)
#
# forgetting to include the actual echo command $(...) indicates a command, or a subshell which output is assigned to a variable. $(line) is not a command on it's own, and it needed to be echoed out in order for there to be output to be assigned ot a variable.


while read line;
do
    second=$(echo "${line}" | cut -c 2)
    seventh=$(echo "${line}" | cut -c 7)
    echo "${second}${seventh}"
done
