#!/bin/bash

if [[ $# -ne 1 ]]
then
	echo "Неправильное количество переданных скрипту параметров!"
	exit -1
fi

if [[ !( -f ./$1 ) ]]
then
	echo "Такого файла в данной дириктории не существует!"
	exit -1
fi

tr=$(ls -a $HOME | grep ".trash$")
if [[ "$tr" = "" ]]
then
	mkdir $HOME/.trash
fi

dt=$(date +"%d-%m-%y_%H:%M:%S")
path="$PWD/$1"
ln $1 $HOME/.trash/$dt
rm $1
echo "$path|$dt" >> $HOME/.trash.log 
