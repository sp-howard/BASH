#!/bin/bash

# https://www.hackerrank.com/challenges/sed-command-4/problem?isFullScreen=true

#  The first three occurances on eahc line end with a space, but the last one doesn't.

sed 's/[0-9]\{4\} /**** /g'