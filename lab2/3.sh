#!/bin/bash

ps -A -o pid,start --no-header | sort -k2 -r | head -1 | awk '{print $1}' > ans3