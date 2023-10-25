#!/bin/bash

# https://www.hackerrank.com/challenges/awk-1/problem?isFullScreen=true
# https://www.thegeekstuff.com/2010/02/awk-conditional-statements/


awk '{
    if ($2 == "" || $3 == "" || $4 == "")
        print "Not all scores are available for",$1
}'