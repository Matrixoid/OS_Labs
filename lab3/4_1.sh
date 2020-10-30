#!/bin/bash

PID=$$
x=0

echo $PID > pid1

while true
do
	let x=$x+1
done
