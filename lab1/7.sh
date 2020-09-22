#!/bin/bash

grep -E -h -s -o -i -r --binary-files=without-match "[a-zA-Z0-9_.-]+@[a-zA-Z0-9_.-]+\.[a-z]+" /etc/* | uniq | awk '{printf("%s, ", $1)}' | sed 's/..$/\n/' > emails.lst 
