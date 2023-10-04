#!/bin/bash

for num in {1..99}
do
    if [ $((num % 2)) -ne 0 ]
    then 
        echo $num
    fi
done
