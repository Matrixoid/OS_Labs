#!/bin/bash

echo "Enter a number from 1 to 4"
echo "  1.Open editor nano"
echo "  2.Open editor vi"
echo "  3.Open browser links"
echo "  4.Exit from the program"

while [[ true ]]
do
  read a
  case $a in
    1) nano
    break ;;
    2) vi
    brak ;;
    3) links
    break ;;
    4) exit
    ;;
  esac
  echo "You input wrong command. Try again"
done
