#!/bin/bash

if [[ $1 -gt $2 ]]
then
    a=$1
else
    a=$2
fi

if [[ $3 -gt "$a" ]]
then
    b=$3
else
    b=$a
fi

 echo $b
