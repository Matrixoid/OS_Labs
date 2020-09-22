#!/bin/bash

man bash | grep -oi "[a-z]\{4,\}" | sort | uniq -c | sort -rm | head -3 | awk '(print($2)}'
