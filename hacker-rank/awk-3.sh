#!/bin/bash

# https://www.hackerrank.com/challenges/awk-3/problem?isFullScreen=true
# https://www.thegeekstuff.com/2010/02/awk-conditional-statements/


awk '{
    total=$2+$3+$4;
    avg=total/3;
    
    if ( avg >= 80 ) 
        grade="A";
    else if ( avg >= 60) 
        grade ="B";
    else if (avg >= 50) 
        grade ="C";
    else 
        grade="FAIL";

    print $0,":",grade;
}'