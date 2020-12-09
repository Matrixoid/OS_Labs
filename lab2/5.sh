#!/bin/bash

all=($(./max.sh))

for i in ${all[@]}
do
        average=0
        cnt=$(grep "Parent_ProcessID=$i " "ans4" | wc -l)
        grep "Parent_ProcessID=$i " "ans4"
        average=$(grep "Parent_ProcessID=$i " "ans4" | awk -F "Average_Running_Time=" '{print $2}')
        for j in $average
        do
	average=$(echo "$average + $j" | bc -l)
        done
        echo Average_Sleeping_Children_of_ParentID=$i is $(echo "$average/$cnt" | bc -l)
done > ans5