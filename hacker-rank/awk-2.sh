#!/bin/bash

# https://www.hackerrank.com/challenges/awk-2/problem?isFullScreen=true
# https://www.thegeekstuff.com/2010/02/awk-conditional-statements/


awk '{
    if ($2 >= 50 && $3 >= 50 && $4 >= 50)
        print $1,":","Pass";
    else
        print $1,":","Fail";
}'