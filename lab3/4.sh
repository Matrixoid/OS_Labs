#!/bin/bash

./4_1.sh &
./4_2.sh &
./4_3.sh &
cpulimit -p $(cat pid1) -l 10 &
kill $(cat pid3)
