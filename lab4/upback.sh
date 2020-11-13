#!/bin/bash

if ! [[ -d "$HOME/restore" ]]
then 
	mkdir "$HOME/restore"
fi

str=""

dir=$(ls $HOME | grep '^Backup-' | sort -n | tail -1)
for currentFile in $(ls "$HOME/$dir")
do 
str=$(echo $currentFile | grep -E -o "^[A-Za-z0-9]+.[0-9]+-[0-9]+-[0-9]+")
	if [[ $currentFile != $str ]]
	then
		cp -R $currentFile "$HOME/restore"
	fi
done
