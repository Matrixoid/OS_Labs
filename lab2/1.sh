#!/bin/bash

ps -u user | tail -n +2 | wc -l > ans1
ps -u user | tail -n +2 | awk '{printf("%s:%s\n", $1, $4)}' >> ans1