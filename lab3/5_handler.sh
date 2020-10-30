#!/bin/bash

op="+"
res=1

(tail -f queue) |
while true
do
	read LINE
	if [[ "$LINE" == "QUIT" ]]
	then 
		rm queue
		echo "exit"
		killall tail
		exit 0
	fi
	if ! [[ $LINE =~ '^[0-9]+&' || $LINE == "+" || $LINE == "*" ]]
	then
		rm queue
		echo "Error! NaN"
		exit 1
	fi
	if [[ $LINE == "+" || $LINE == "*" ]]
	then
		op = "$LINE"
	else if [[ $op == "+" ]]
		res=$(echo $res $LINE | awk '{print $1 + $2}')
		echo $res
		else
			res=$(echo $res $LINE | awk '{print $1 * &2}')
			echo $res
		fi
	fi
done
