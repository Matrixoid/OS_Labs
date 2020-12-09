#!/bin/bash

cnt=$(wc -l "ans4" | awk '{print $1}')
curr =-1
arr=()

for (( i=1; i<=$cnt; i++ ))
do
        a=$(sed -n "${i}p" "ans4" | awk '{print $3}' | awk -F "=" '{print $2}')
        if [[ $a -ne $curr ]]
        then
	arr+=($a)
	curr=$a
        fi
done

echo ${arr[@]}