#!/bin/bash

PID=$(ps -Ao pid --no-header)

for pid in $PID
do
        if [[ -f "/proc/$pid/io" ]]
        then
	read_bytes=$(grep "read_bytes" "/proc/$pid/io" | awk '{print $2}')
	echo "$pid $read_bytes" >> temp
        fi
done

echo "Sleeping for 1 minute"
sleep 60
echo "Complete"

while read line
do
        pid=$(echo "$line | awk '{print $1}')
        read_bytes=$(echo "$line" | awk '{print $2}')
        if [[ -f "/proc/$pid/io" ]]
        then
	new_read_bytes=$(grep "read_bytes" "/proc/$pid/io" | awk '{print $2}')
	echo "$pid" $(echo "$new_read_bytes" "read_bytes" | awk '{print($1-$2)}') >> temp1
        fi
done < temp

sort -nk2 temp1 > ans7
rm temp1
rm temp