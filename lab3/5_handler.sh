#!/bin/bash

number="1"
operand="+"

generatorPID=$(head -n 1 "dataTask5.txt")

(tail -n 0 -f "dataTask5.txt") |
while true
do
	read tempString
	if [[ $tempString == "QUIT" ]]; then
		echo "Planned stop"
		killall tail
		kill $generatorPID
		rm dataTask5.txt
		exit 0
	fi

	if [[ $tempString == "+" || $tempString == "*" ]]; then
		operand=$tempString
		continue
	fi

	if [[ $tempString =~ ^-?[0-9]+$ ]]; then
		number=$(echo "scale=10; ($number)$operand($tempString)" | bc)
		echo $number
		continue
	else
		echo "Unplanned stop"
		killall tail
		kill $generatorPID
		rm dataTask5.txt
		exit 0
	fi
	sleep 1
done
