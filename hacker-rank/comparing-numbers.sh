#!/bin/bash

read int1
read int2

if [ $int1 -lt $int2 ]
then
    echo "X is less than Y"
fi

if [ $int1 -gt $int2 ]
then
    echo "X is greater than Y"
fi

if [ $int1 -eq $int2 ]
then
    echo "X is equal to Y"
fi
