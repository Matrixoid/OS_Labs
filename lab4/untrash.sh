#!/bin/bash

if [[ $# -ne 1 ]]
then
	echo "Неправильное количество переданных скрипту параметров"
	exit -1
fi

gp=$(grep "/$1|" "$HOME/.trash.log")
if [[ "$gp" = "" ]]
then
	echo "Файлов с таким именем нет"
	exit -1
fi

for i in $(grep "/$1|" $HOME/.trash.log)
do
	path=$(echo $i | awk -F "|" '{print $1}')
	fileName=$(echo $i | awk -F "|" '{print $2}')
	if [[ !( -f "$HOME/.trash/$fileName") ]]
	then
		echo "В корзине файла $path не обнаружено. Восстановить невозможно."
		continue
	fi
	echo "Файл $path найден в корзине. Желаете его восстановить?"
	read answer
	if [[ "$answer" = "yes" ]]
	then
		PWD=$(dirname $path)
		name=$1
		if [[ -e "$PWD" ]]
		then
			if [[ -f $path ]]
			then
				echo "Файл с таким именем уже существует. Измените его имя."
				read name
			fi
			ln "$HOME/.trash/$fileName" "$PWD/$name"
			rm "$HOME/.trash/$fileName"
		else
			echo "Директории $PWD больше не существует, поэтому файл был восстановлен в домашней директории."
			if [[ -f "$HOME/$1" ]]
			then
				echo "Файл с таким именем уже существует. Измените его имя."
				read name
			fi
			ln "$HOME/.trash/$fileName" "$HOME/$name"
			rm "$HOME/.trash/$fileName"
		fi
		continue
	fi
	if [[ "$answer" = "no" ]]
	then
		echo 0
		continue
	fi
	if [[ "$answer" != "yes" && "$answer" != "no" ]]
	then
		echo "Ваш ответ не распознан."
		exit -1
	fi
done
