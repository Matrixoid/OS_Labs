#!/bin/bash

ps uxa | sort -nk4 -r | head -1 | awk '{print $2}' > ans6