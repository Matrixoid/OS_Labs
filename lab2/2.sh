#!/bin/bash

files=$(ls /sbin)
for file in $(echo -e "$files")
do
        ps uxa | grep "$file" | awk '{print $2}' >> ans2
done