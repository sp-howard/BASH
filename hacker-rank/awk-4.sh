#!/bin/bash

# https://www.hackerrank.com/challenges/awk-4/problem?isFullScreen=true
# https://www.thegeekstuff.com/2010/02/awk-conditional-statements/

awk 'ORS=NR%2?";":"\n";'