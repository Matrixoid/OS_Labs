#!/bin/bash

ps uxa | grep "hald" | awk '{print $2 " " $9}'