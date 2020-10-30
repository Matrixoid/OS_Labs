#!/bin/bash

mkfifo queue

while true
do
	read LINE
	echo "$LINE" > queue
	if [[ "$LINE" == "QUIT" ]]
	then
		break;
	fi
	if ! [[ $LINE =~ '^[0-9]+$' || $LINE == "+" || $LINE == "*" ]]
	then
		rm queue
		echo "Error! NaN"
		exit 1
	fi
done
