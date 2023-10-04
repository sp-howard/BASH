#!/bin/bash

read side1
read side2
read side3

equal_sides=0

if [ $side1 == $side2 ]
then
    equal_sides=$(($equal_sides+1))
fi 

if [ $side1 == $side3 ]
then
    equal_sides=$(($equal_sides+1))
fi 

if [ $side2 == $side3 ]
then
    equal_sides=$(($equal_sides+1))
fi 

case $equal_sides in
    0) echo "SCALENE";;
    1) echo "ISOSCELES";;
    3) echo "EQUILATERAL"
esac
