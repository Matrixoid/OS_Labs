#!/bin/bash

PID=$$
x=0

echo $PID > pid3

while true
do
	let x=$x+1
done
