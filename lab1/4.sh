#!/bin/bash

if [[ "$PWD" == "/root" ]]
then
echo "Script was launched from the home directory"
exit 0
else
echo "Script was launched from outside the home directory"
exit -1
fi
